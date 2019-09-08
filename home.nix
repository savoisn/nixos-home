{ pkgs, ... }:

{
  home.packages = [
    pkgs.htop
    pkgs.fortune
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
