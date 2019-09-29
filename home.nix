{ pkgs, ... }:

let 
  myvim = (import ./nvim-custom-plugin.nix ) pkgs;
in
{
  imports = [
    ./tools
  ];


  nixpkgs.config.allowUnfree = true;

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
    elixir
    fortune
    google-chrome
    htop
    jetbrains.idea-ultimate
    nodejs
    pasystray
    pavucontrol
    pcmanfm
    ponysay
    qalculate-gtk
    rox-filer
    slack-dark
    spotify
    tdesktop
    unzip
    vagrant
    vscode
    xorg.xbacklight
    xarchiver
    xclip
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
            cocelixir
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
    shellAliases = { vim = "nvim"; };
    initExtra =  ''
      any-nix-shell zsh --info-right | source /dev/stdin
      source ~/.zshrc_functions
    '';
  };


  # Enable Oh-my-zsh
  programs.zsh.oh-my-zsh = {
    enable = true;
    theme = "candy";
    plugins = [ "git" "sudo" "docker" "kubectl" "mix"];
  };


  programs.firefox = {
    enable = true;
    enableIcedTea = true;
  };

  programs.git = {
    enable = true;
    userName = "Nicolas Savois";
    userEmail = "nicolas.savois@gmail.com";
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
