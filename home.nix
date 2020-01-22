{ pkgs, ... }:

let 
  myvim = (import ./nvim-custom-plugin.nix ) pkgs;
in
{
  imports = [
    ./tools
  ];


  nixpkgs.config.allowUnfree = true;

  home.file.".xprofile".source = ./xprofile;

  home.packages = with pkgs; [
    acpi
    ag
    ansible
    any-nix-shell
    arandr
    blueman
    brightnessctl
    calibre
    cowsay
    discord
    docker-compose
    dotnet-sdk
    dune
    elixir
    exercism
    feh
    fortune
    fsharp 
    gimp
    gthumb
    google-chrome
    htop
    imagemagick
    inotify-tools
    jetbrains.idea-ultimate
    nix-index
    nodejs
    pasystray
    patchelf
    pavucontrol
    pcmanfm
    pciutils
    ponysay
    ocaml
    opam
    qalculate-gtk
    ranger
    rox-filer
    simplescreenrecorder
    shutter
    slack-dark
    spotify
    steam-run
    transmission-gtk
    tdesktop
    udisks2
    udiskie
    unzip
    usbutils
    file
    vagrant
    vscode
    w3m
    xorg.xbacklight
    xarchiver
    xclip
    yquake2-all-games
    zip
  ];

  xresources.properties = { 
    "xterm*background" = "black"; 
    "xterm*foreground" = "lightgray"; 
    "xterm*faceName" = "monospace:pixelsize=14";
    "*background" = "black";
    "*foreground" = "white";
#    "URxvt.font" = "xft:Hermit Light:size=12"; # fun but not my taste
    "URxvt.font" = "xft:monospace:size=12";
    "URxvt.scrollBar" = "false";
    "URxvt.keysym.C-Down" =  "resize-font:smaller";
    "URxvt.keysym.C-Up" = "resize-font:bigger";
    "URxvt.iso14755" = "false";
    "URxvt.iso14755_52" = "false";
    "urxvt.perl-ext-common" = "default,resize-font";
    "URxvt.keysym.Shift-Control-V" = "eval:paste_clipboard";
    "URxvt.keysym.Shift-Control-C" = "eval:selection_to_clipboard";
  };

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [
      epkgs.nix-mode
      epkgs.magit
    ];
  };

  programs.neovim = {
    enable = true;

    #settings = {
    #  relativenumber = true;
    #  number = true;
    #};

    configure = {
        packages.myVimPackage = with pkgs.vimPlugins // myvim.custom_plugins; {
          start = [
            zenburn
            ctrlp
            fugitive
            vim-nix
            vim-elixir
            nerdtree
            nerdcom
            coc-nvim
            coc-go
            #cocelixir
            vim-markdown
            markdown-preview
            mixformat
          ];
        };


        customRC = builtins.readFile vim/vimrc;
      };
  };

  programs.tmux = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    shellAliases = { vim = "nvim"; dc = "docker-compose"; };
    initExtra =  ''
      any-nix-shell zsh --info-right | source /dev/stdin
      source ~/.zshrc_functions
      export PATH=$PATH:~/bin
      test -r /home/nico/.opam/opam-init/init.zsh && . /home/nico/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
    '';
  };


  # Enable Oh-my-zsh
  programs.zsh.oh-my-zsh = {
    enable = true;
    theme = "candy";
    plugins = [ "git" "sudo" "docker" "kubectl" "mix" "jump"];
  };


  programs.firefox = {
    enable = true;
    enableIcedTea = true;
  };

  programs.git = {
    enable = true;
    userName = "Nicolas Savois";
    userEmail = "nicolas.savois@gmail.com";
    extraConfig = ''
        [push]
        default = current
      '';
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  programs.home-manager = {
    enable = true;
    path = "…";
  };
}
