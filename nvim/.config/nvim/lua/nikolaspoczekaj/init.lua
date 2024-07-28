require("nikolaspoczekaj.config")
require("nikolaspoczekaj.packer")

local lspconfig = require'lspconfig'

-- Funktion zum Finden des venv-Pfads
local function get_python_path(workspace)
    -- Erst im workspace nach `venv` suchen
    local util = require'lspconfig.util'
    local path = util.path
    local function find_python_venv()
        local root_dir = lspconfig.util.find_git_ancestor(workspace) or workspace
        local venv_paths = { 'venv/bin/python', '.venv/bin/python' }
        for _, venv_path in ipairs(venv_paths) do
            local python_path = path.join(root_dir, venv_path)
            if util.path.exists(python_path) then
                return python_path
            end
        end
        return nil
    end
    return find_python_venv() or 'python'  -- Fallback zu system python wenn kein venv gefunden
end

-- Konfiguration für pylsp
lspconfig.pylsp.setup{
    cmd = {get_python_path(vim.fn.getcwd()) .. "/bin/pylsp"},
    settings = {
        pylsp = {
            plugins = {
                pylint = {enabled = true},
                pyflakes = {enabled = true},
                pycodestyle = {enabled = true},
            }
        }
    },
    on_attach = function(client)
        -- Optionale Einstellungen und Keybindings
    end,
}
vim.g.virtualenv_auto_activate = 1

