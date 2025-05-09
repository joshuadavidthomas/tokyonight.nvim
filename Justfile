set dotenv-load := true
set unstable := true

# List all available commands
[private]
default:
    @just --list --list-submodules

build:
    nvim -u tests/minit.lua --headless +"lua require('tokyonight.extra').setup()" +qa

docs:
    nvim -u tests/minit.lua -l lua/tokyonight/docs.lua

update:
    git checkout -B update-repo
    @just build
    @just docs
    git add .
    git commit -m "chore(build): generate build files and docs"
    gh pr create --base joshuadavidthomas:josh --web
