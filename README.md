# Dotfiles

Configurações pessoais do macOS gerenciadas com [yadm](https://yadm.io/) — um wrapper do Git que usa o `$HOME` como working tree.

## O que é yadm?

O yadm (Yet Another Dotfiles Manager) gerencia dotfiles usando Git sem precisar de symlinks ou um repositório separado. Ele trata o `$HOME` diretamente como working tree, ignorando tudo que não for explicitamente trackeado.

```bash
# Comandos essenciais — são os mesmos do git, só troca "git" por "yadm"
yadm status
yadm add ~/.config/fish/config.fish
yadm commit -m "atualiza config do fish"
yadm push
yadm list -a              # lista arquivos trackeados
```

## Arquivos gerenciados

| Arquivo | Descrição |
|---|---|
| `.config/fish/config.fish` | Shell — aliases, env vars, paths |
| `.config/omf/*` | Oh My Fish (tema bobthefish) |
| `.config/zellij/config.kdl` | Multiplexer — keybinds, shell padrão (fish) |
| `.config/htop/htoprc` | Monitor de processos |
| `Library/Application Support/com.mitchellh.ghostty/config` | Terminal emulator |
| `.gitconfig` | Nome, email e config do Git |
| `.ssh/config` | Configuração SSH |
| `.claude/settings.json` | Configuração do Claude Code |
| `.Brewfile` | Lista de pacotes do Homebrew |
| `.macos-setup` | Defaults do macOS (Dock, Finder, etc.) |
| `.non-brew-apps` | Apps instalados manualmente |

## Setup em uma máquina nova

```bash
# 1. Instalar o yadm
brew install yadm

# 2. Clonar os dotfiles (yadm faz o checkout direto no $HOME)
yadm clone git@github.com:raulbcs/dotfiles.git

# 3. Instalar os pacotes do Homebrew
brew bundle --global

# 4. Aplicar as preferências do macOS
# (ler o arquivo antes — some coisas são manuais)
source ~/.macos-setup

# 5. Instalar o Oh My Fish e o tema
curl -L https://get.oh-my.fish | fish
omf install bobthefish

# 6. Trocar o shell padrão para fish
sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'
chsh -s /opt/homebrew/bin/fish
```

## Stack principal

- **Shell:** fish + Oh My Fish (tema bobthefish)
- **Terminal:** Ghostty
- **Multiplexer:** Zellij (shell padrão = fish)
- **Editor:** nvim (`$EDITOR` / `$VISUAL`)
- **ls replacement:** lsd
- **Gerenciador de pacotes:** Homebrew (Brewfile)

## Fazendo alterações

```bash
# Editar qualquer config normalmente
$EDITOR ~/.config/fish/config.fish

# Trackear e commitar
yadm add -u
yadm commit -m "descreve a mudança"
yadm push
```
