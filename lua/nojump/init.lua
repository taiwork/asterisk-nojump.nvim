local M = {}

-- TODO: カスタムコマンドとして提供する
-- *キー押下時に検索を実行し、カーソル位置を元に戻す関数
function M.asterisk_no_move()
  -- 現在のカーソル位置を保存
  local save_pos = vim.api.nvim_win_get_cursor(0)

  -- ノーマルモードの '*' コマンドをマッピングを無視して実行（検索）
  vim.cmd("normal! *")

  -- 保存したカーソル位置に戻す
  vim.api.nvim_win_set_cursor(0, save_pos)
end

-- プラグインがロードされたときにキー設定を自動的に行う
local function setup_keymap()
  vim.keymap.set("n", "*", function()
    M.asterisk_no_move()
  end, { noremap = true, silent = true, desc = "Search word without moving cursor" })
end

-- プラグインの初期化時にキー設定を実行
setup_keymap()

return M
