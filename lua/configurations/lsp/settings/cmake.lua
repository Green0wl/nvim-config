local function async_system(command)
  local job_id = vim.fn.jobstart(command, {
    on_stdout = function(_, data, _)
      vim.schedule(function()
        -- Проверка, что data является строкой Lua
        if type(data) == "string" then
          vim.api.nvim_out_write(data)
        else
          -- Преобразование data в строку Lua
          vim.api.nvim_out_write(tostring(data))
        end
      end)
    end
  })
  vim.fn.chansend(job_id, "")
end

async_system("pip install cmake-language-server")
return {}
