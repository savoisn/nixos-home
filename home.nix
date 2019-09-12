{ pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  home.packages = [
    pkgs.htop
    pkgs.fortune
    pkgs.google-chrome
  ];

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
        ];
      };

      customRC = builtins.readFile vim/vimrc;
    };
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
