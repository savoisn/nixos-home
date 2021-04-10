{ pkgs, system, lib, python, ... }:

let 
  myvim = (import ./nvim-custom-plugin.nix ) pkgs;
in
{
  imports = [
    ./tools
    (fetchGit { url = "https://github.com/Elyhaka/shadow-nix"; ref = "drv-v0.14.0"; } + "/home-manager.nix")
        #(fetchGit { url = "https://github.com/NicolasGuilloux/shadow-nix"; ref = "v1.0.0"; } + "/import/home-manager.nix")


  ];

  nixpkgs.config.allowUnfree = true;

  home.file.".xprofile".source = ./xprofile;

  home.packages = with pkgs; [
    acpi
    ag
    android-studio
    ansible
    any-nix-shell
    audacious
    arandr
    asciidoctor
    awscli2
    bind
    blueman
    brightnessctl
    broot
    calibre
    cdrkit
    chromedriver
    cloud-init
    cowsay
    crystal
    discord
    dhall
    dhall-json
    docker-compose
    dotnet-sdk
    dune-release
    elixir
    exercism
    feh
    ffmpeg-full
    flutter
    fortune
    fsharp 
    gcc
    gimp
    gitkraken
    gnumake    
    go
    google-chrome
    gphoto2
    gradle
    gromit-mpx
    gthumb
    htop
    imagemagick
    inkscape
    inotify-tools
    jetbrains.idea-ultimate
    jdk
    kind
    kubectl
    kotlin
    lz4
    maven
    nix-index
    nix-tree
    nodejs
    pamix
    pamixer
    paprefs
    pasystray
    patchelf
    pavucontrol
    pcmanfm
    pciutils
    pgmanage
    ponysay
    portaudio
    pulsemixer
    python38Full
    python38Packages.pip
    pythonFull
    obs-studio
    obs-v4l2sink
    ocaml
    opam
    packer qalculate-gtk
    ranger
    remarkable-toolchain
    rox-filer
    rustup
    skaffold
    simplescreenrecorder
    shutter
    slack-dark
    spotify
    teams
    terraform_0_14
    tig
    tlaplus
    transmission-gtk
    tdesktop
    unzip
    usbutils
    file
    vagrant
    vlc
    vscode-extensions.ms-vsliveshare.vsliveshare
    vscode-with-extensions
    w3m
    xorg.xbacklight
    xarchiver
    xclip
    xorg.xev
    youtubeDL
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

    plugins = 
        with pkgs.vimPlugins // myvim.custom_plugins; [
            zenburn
            ctrlp
            dhall-vim
            fugitive
            vim-nix
            vim-elixir
            nerdtree
            nerdcom
            coc-nvim
            coc-go
            #cocelixir
            vim-markdown
            vim-elm-syntax
            markdown-preview
            mixformat
            vim-terraform
            crystal
          ];
      extraConfig = builtins.readFile vim/vimrc;
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
      export PATH=$PATH:~/bin:~/bin/bats/bin
      source <(kubectl completion zsh)
      alias k=kubectl
      complete -F __start_kubectl k
      test -r /home/nico/.opam/opam-init/init.zsh && . /home/nico/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
      #export CLOUD_SDK_HOME="${pkgs.google-cloud-sdk}"
      #source "$CLOUD_SDK_HOME/google-cloud-sdk/completion.zsh.inc"
      PROMPT='%{$fg_bold[green]%}%n@%m %{$fg[blue]%}%D{[%X]}%{$reset_color%} %{$fg_bold[red]%}$(aws_prompt_info)%{$reset_color%} %{$fg[white]%}[%~]%{$reset_color%} $(git_prompt_info)
%{$fg[blue]%}->%{$fg_bold[blue]%} %#%{$reset_color%} '
    '';
    envExtra = ''
      GOPATH='~/gopath'
    '';
  };


  # Enable Oh-my-zsh
  programs.zsh.oh-my-zsh = {
    enable = true;
    theme = "candy";
    plugins = [ "git" "sudo" "docker" "kubectl" "mix" "jump" "golang" "aws" "terraform" ];
  };


  programs.firefox = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Nicolas Savois";
    userEmail = "nicolas.savois@gmail.com";
    extraConfig = {
      push = {
        default = "current";
      };
      credential.helper = "cache";

    };
    #extraConfig = ''
        #[push]
        #default = current
      #'';
  };

  #programs.shadow-client = {
    #enable = true;
    #channel = "preprod";
  #};


  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  services.udiskie = {
    enable = true;
    automount = true; 
    notify = true;
    tray = "auto";
  };

  programs.home-manager = {
    enable = true;
    path = "…";
  };
}
