# window.nvim

## Features

- Maximize current window.
- Does not affect window layout after restoration.

<img src="https://github.com/niuiic/assets/blob/main/window.nvim/usage.gif" />

## Keymap

```lua
vim.keymap.set("n", "<space>wm", "<cmd>ToggleMaxWin<CR>", {})
```

## Notice

Not work if current window is a float window.
