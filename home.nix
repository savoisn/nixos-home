{ pkgs, ... }:

{
  imports = [
    ./tools
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    htop
    fortune
    google-chrome
    pasystray
    pavucontrol
    blueman
    xorg.xbacklight
    slack-dark
    spotify
    brightnessctl
    xorg.xcalc
    tdesktop
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
      #pathogen.pluginNames = with pkgs.vimPlugins; [
      #  "colors-solarized"
      #];
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          #colors-solarized
          zenburn
          ctrlp
          fugitive
          vim-nix
          vim-elixir
          nerdtree
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
  };


  # Enable Oh-my-zsh
  programs.zsh.oh-my-zsh = {
    enable = true;
    theme = "candy";
    plugins = [ "git" "sudo" "docker" "kubectl" ];
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
