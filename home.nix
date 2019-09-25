{ pkgs, ... }:

{
  imports = [
    ./tools
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    acpi
    htop
    fortune
    cowsay
    ponysay
    google-chrome
    pasystray
    arandr
    pavucontrol
    blueman
    xorg.xbacklight
    slack-dark
    spotify
    brightnessctl
    any-nix-shell
    tdesktop
    qalculate-gtk
    vagrant
    ansible
    rox-filer
    pcmanfm
    xarchiver
    unzip
    xclip
    vscode
    jetbrains.idea-ultimate
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
      #pathogen.pluginNames = with pkgs.vimPlugins; [
      #  "colors-solarized"
      #];
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
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
