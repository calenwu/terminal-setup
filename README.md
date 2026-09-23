# 🚀 Dotfiles & Terminal Environment Setup

Automated setup script for a clean, modern, and high-performance macOS/Linux terminal environment using **Oh My Zsh**, **Starship**, **FZF**, and custom Zsh plugins.

---

## 🛠️ Included Stack & Tools

* **[Oh My Zsh](https://ohmyzsh.sh/):** Zsh configuration management framework.
* **[Starship](https://starship.rs/):** Cross-shell prompt engine.
* **[FZF](https://github.com/junegunn/fzf):** Command-line fuzzy finder for interactive search.
* **[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions):** Asynchronous inline history completion suggestions.
* **[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting):** Real-time command syntax highlighting.
* **[Cursor Editor Integration](https://cursor.sh/):** Sets Cursor (`cursor --wait`) as the default `$EDITOR` and `$VISUAL` terminal editor.
* **Stripe Internal Shell Config Support:** Automatically includes `~/.stripe/shellinit/zshrc` if present.

---

## 📋 Prerequisites

Before running the setup script, ensure you have Homebrew installed on your Mac or Linux system:

```bash
/bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh](https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh))"

```

---

## ⚡ Quick Start

### 1. Clone the Repository

```bash
git clone [https://github.com/your-username/dotfiles.git](https://github.com/your-username/dotfiles.git)
cd dotfiles

```

### 2. Make the Script Executable

```bash
chmod +x setup_environment.sh

```

### 3. Run the Automated Installer

```bash
./setup_environment.sh

```

### 4. Reload Your Shell

```bash
source ~/.zshrc

```

---

## ⚙️ Features & Configuration Overview

### Default Editor (`$EDITOR`)

The script sets **Cursor** as your primary terminal editor (`export EDITOR="cursor --wait"`).

When commands like `git commit` or `crontab -e` are run in the terminal, Cursor will open a dedicated tab and return control back to the terminal once the file tab is saved and closed.

### Plugin Load Order

Plugins in `~/.zshrc` are explicitly loaded in the recommended order to avoid syntax highlighting glitches or completion overlaps:

```bash
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

```

---

## 💡 Keyboard Shortcuts & Usage

| Shortcut / Command | Tool | Action |
| --- | --- | --- |
| `Tab` | Zsh / FZF | Trigger completion for paths, commands, and options |
| `Ctrl + R` | FZF | Interactive fuzzy-search through terminal command history |
| `Ctrl + T` | FZF | Interactive fuzzy-search for files/folders to insert at cursor |
| `Alt + C` | FZF | Interactive fuzzy-search directory tree and `cd` directly |
| `→` (Right Arrow) | Autosuggestions | Accept inline auto-suggestion |

---

## 🛟 Troubleshooting

### Question mark boxes `[?]` rendering in Starship prompt

Ensure your terminal application (iTerm2, macOS Terminal, or Cursor) is configured to use a **Nerd Font** such as `MesloLGS NF`:

1. Download and install **MesloLGS NF** from [Nerd Fonts](https://www.nerdfonts.com/font-downloads?utm_source=gemini).
2. Open **iTerm2 Settings (`Cmd + ,`) > Profiles > Text > Font**.
3. Select **`MesloLGS NF`**.

---

## 📜 License

MIT © [Your Name]

```

```
