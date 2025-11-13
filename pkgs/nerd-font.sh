mkdir -p ~/.local/share/fonts
curl -L -o ~/.local/share/fonts/CascadiaMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaMono.zip
unzip -o ~/.local/share/fonts/CascadiaMono.zip -d ~/.local/share/fonts
fc-cache -f -v
