# Requirment:
- Python 3 (only for YouCompleteMe Plugin)

# Run the following command after cloning the repo
- `cd vim_tmux_conf && git submodule update --init --recursive`
- `chmod +x hide_these_files.sh && ./hide_these_files.sh`
- `vim`
- At vim editor, enter `:PluginInstall`

# (ONLY FOR YOUCOMPLETEME PLUGIN)
- `cd ~/.vim/bundle/youcompleteme`
- `./install.sh`
- add the following to .vimrc file: `let g:ycm_global_ycm_extra_conf="/home/${USER}/.vim/.ycm_extra_conf.py"
