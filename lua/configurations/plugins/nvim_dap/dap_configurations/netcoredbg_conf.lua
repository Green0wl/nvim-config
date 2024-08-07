-- TODO: needs refactoring.
local M = {}

-- tried:
-- sudo luarocks --lua-version=5.1 install luaposix
-- require('posix').setenv("ASPNETCORE_ENVIRONMENT", "Development")
-- works but not configurable
local dap = require("dap")
if not dap.adapters["netcoredbg"] then
  require("dap").adapters["netcoredbg"] = {
    type = "executable",
    command = vim.fn.exepath("netcoredbg"),
    args = { "--interpreter=vscode" },
    options = {
      detached = false,
    },
  }
end

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local sorters = require "telescope.sorters"
local dropdown = require "telescope.themes".get_dropdown()

vim.g.ask_rebuild_aspnet = function(callback)
  pickers.new(dropdown, {
    prompt_title = "Rebuild?",
    finder = finders.new_table {
      results = { "Yes", "No" }
    },
    sorter = sorters.get_generic_fuzzy_sorter({}),
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selected_variant = action_state.get_selected_entry()[1]

        if selected_variant == "Yes" then
          if vim.g.aspdotnet_cwd ~= nil then
            local task = require("overseer").new_task({
              name = "Build .NET :: Debug",
              cmd = "dotnet",
              args = { "build", "-c", "Debug", vim.g.aspdotnet_cwd },
            })
            task:start()
            callback()
          end

          local current_dir = vim.fn.getcwd()
          pickers.new(dropdown, {
            prompt_title = "Workspace Folder:",
            finder = finders.new_oneshot_job({
              "find",
              current_dir,
              "-type", "d",
              "-name", "bin",
              "-prune",
              "-o",
              "-type", "f",
              "-name", "*.csproj",
              "-printf", "%h\n"
            }, {}),
            sorter = sorters.get_generic_fuzzy_sorter({}),
            attach_mappings = function(prompt_bufnr_inner, _)
              actions.select_default:replace(function()
                actions.close(prompt_bufnr_inner)

                local selection = action_state.get_selected_entry()
                vim.g.aspdotnet_cwd = selection[1]

                local task = require("overseer").new_task({
                  name = "Build .NET :: Debug",
                  cmd = "dotnet",
                  args = { "build", "-c", "Debug", vim.g.aspdotnet_cwd },
                })
                task:start()
                callback()
              end)
              return true
            end,
          }):find()
        else
          callback()
        end
      end)
      return true
    end,
  }):find()
end

vim.g.seen_aspdotnet_dll_dbg_paths = {}
local function shortenPathDll(fullPath)
  local parts = {}
  for part in fullPath:gmatch("[^/]+") do
    table.insert(parts, part)
  end

  local result = parts[#parts]
  local index = #parts - 1

  while index > 0 do
    local current = parts[index] .. "/" .. result
    if not vim.g.seen_aspdotnet_dll_dbg_paths[current] then
      vim.g.seen_aspdotnet_dll_dbg_paths[current] = true
      result = current
      break
    end
    result = current
    index = index - 1
  end

  return result
end

-- refers to:
-- https://stackoverflow.com/questions/77216161/how-to-setup-envs-in-neovim-dap-configs-for-dotnet-c
M.lang = { "cs", "fsharp", "vb" }
M.conf = {
  {
    type = "netcoredbg",
    name = "netcoredbg custom",
    request = "launch",
    justMyCode = false,
    stopAtEntry = false,
    program = function()
      vim.g.seen_aspdotnet_dll_dbg_paths = {}
      vim.g.aspdotnet_cwd = nil

      return coroutine.create(function(coro)
        local opts_executable = require("telescope.themes").get_dropdown({})
        local current_dir = vim.fn.getcwd()

        pickers.new(opts_executable, {
          prompt_title = "Dll to debug:",
          finder = finders.new_oneshot_job({
            "find",
            current_dir,
            "-type", "f",
            "-name", "*.dll",
            "-path", "*/bin/Debug/*"
          }, {
            entry_maker = function(entry)
              local made_path = shortenPathDll(entry)
              return {
                value = entry,
                display = made_path,
                ordinal = made_path,
              }
            end
          }),
          sorter = sorters.get_generic_fuzzy_sorter({}),
          attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
              actions.close(prompt_bufnr)
              local program = action_state.get_selected_entry().value;
              vim.g.ask_rebuild_aspnet(function()
                coroutine.resume(coro, program)
              end)
            end)
            return true
          end,
        }):find()
      end)
    end,
    env = {
      ASPNETCORE_ENVIRONMENT = function(opts)
        return coroutine.create(function(coro)
          opts = require("telescope.themes").get_dropdown({})
          pickers.new(opts, {
            prompt_title = "ASPNETCORE_ENVIRONMENT:",
            finder = finders.new_table {
              results = { "Development", "Production", "Staging" }
            },
            sorter = sorters.get_generic_fuzzy_sorter({}),
            attach_mappings = function(prompt_bufnr, _)
              actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                coroutine.resume(coro, action_state.get_selected_entry()[1])
              end)
              return true
            end,
          }):find()
        end)
      end
    },
    cwd = function()
      if vim.g.aspdotnet_cwd ~= nil then
        return vim.g.aspdotnet_cwd
      end
      return coroutine.create(function(coro)
        local opts = dropdown
        local current_dir = vim.fn.getcwd()
        pickers.new(opts, {
          prompt_title = "Workspace Folder:",
          finder = finders.new_oneshot_job({
            "find",
            current_dir,
            "-type", "d",
            "-name", "bin",
            "-prune",
            "-o",
            "-type", "f",
            "-name", "*.csproj",
            "-printf", "%h\n"
          }, {}),
          sorter = sorters.get_generic_fuzzy_sorter({}),
          attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
              actions.close(prompt_bufnr)
              vim.g.aspdotnet_cwd = action_state.get_selected_entry().value
              coroutine.resume(coro, vim.g.aspdotnet_cwd)
            end)
            return true
          end,
        }):find()
      end)
    end
  },
}

return M
