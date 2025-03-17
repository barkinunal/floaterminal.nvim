# Floaterminal.nvim 🖥️

A lightweight **floating terminal** plugin for **Neovim**, allowing you to open multiple terminals in a pop-up window with **customizable size and border styles**.

![floaterminal-demo](https://github.com/user-attachments/assets/daca718b-5486-488d-94dd-4cf9bbfdc7fd)

## ✨ Features

✅ Open a floating terminal with a single command  
✅ Customizable size & border styles  
✅ Toggle terminal easily  
✅ Create new tabs and iterate over them
✅ Minimal and BLAZINGLY fast 🔥

---

## 📦 Installation

### **Packer**

```lua
use {
  'barkinunal/floaterminal.nvim',
  config = function()
    require('floaterminal').setup()
  end
}
```

### **Lazy**

```lua
{
  'barkinunal/floaterminal.nvim',
  config = function()
    require('floaterminal').setup()
  end
}
```

## ⚙️ Configuration

### You can customize Floaterminal by passing options in setup().

```lua
require("floaterminal").setup({
    width = 0.8,        -- Window width (default: 0.8)
    height = 0.8,       -- Window height (default: 0.8)
    border = "rounded",  -- Border style ("single", "double", "rounded", etc.)
    max_tab_size = 3,   -- Maximum tabs can be created (default 3)
})
```

**Default values:** - width = 0.8 - height = 0.8 - border = "rounded" - max_tab_size = 3

## 🚀 Usage

### **Available Commands**

| Command               | Description                                                       |
| --------------------- | ----------------------------------------------------------------- |
| `:Floaterminal`       | Toggles the terminal window                                       |
| `:FloaterminalTabC`   | Closes the floating terminal                                      |
| `:FloaterminalTabNew` | Opens a new floating terminal tab and sets it as the current tab  |
| `:FloaterminalTabN`   | Goes to the next tab (Goes to beginning if on the rightmost side) |
| `:FloaterminalTabP`   | Goes to the previous tab (Goes to end if on the leftmost side)    |

### **Keybind Example**

To bind Floaterminal to a shortcut in your Neovim config:

```lua
vim.keymap.set({ "n", "t" }, "<leader>tt",  ":Floaterminal<CR>")
vim.keymap.set({ "n", "t" }, "<leader><leader>", ":FloaterminalTabNew<CR>")
vim.keymap.set({ "n", "t" }, "<leader>d", ":FloaterminalTabC<CR>")
vim.keymap.set({ "n", "t" }, "<leader>]", ":FloaterminalTabN<CR>")
vim.keymap.set({ "n", "t" }, "<leader>[",  ":FloaterminalTabP<CR>")
```

## 🛠️ Contributing

Feel free to **submit issues** or **pull requests** on [GitHub](https://github.com/barkinunal/floaterminal.nvim/issues).

---

## 📜 License

**MIT License** - Feel free to use, modify, and contribute!

---

## 🌟 Credits

- Created by **Barkin Unal**
- Inspired by https://github.com/tjdevries's floating terminal youtube video.
