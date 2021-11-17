{ pkgs, system, lib, python, ... }:

let 
  myvim = (import ./nvim-custom-plugin.nix ) pkgs;
  pop = pkgs.callPackage ./tools/pop {};

in
{
  imports = [
    ./tools
    #(fetchGit { url = "https://github.com/NicolasGuilloux/shadow-nix"; ref = "v1.0.3"; } + "/import/home-manager.nix")
  ];



  nixpkgs.config.allowUnfree = true;

  home.file.".xprofile".source = ./xprofile;

  home.packages = with pkgs; [
    acpi
    ag
    android-studio
    android-tools
    ansible
    any-nix-shell
    arandr
    arduino
    audacious
    audacity
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
    dart
    dbeaver
    discord
    dhall
    dhall-json
    docker-compose
    dotnet-sdk_3
    dpkg
    dune-release
    elixir
    erlang
    exercism
    feh
    ffmpeg-full
    flutter
    fortune
    fsharp 
    galculator
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
    jq
    kind
    kubectl
    kotlin
    librecad
    lz4
    maven
    mpv
    ngrok
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
    postman
    pulsemixer
    python38Full
    python38Packages.pip
    pythonFull
    obs-studio
    ocaml
    opam
    packer qalculate-gtk
    ranger
    rclone
    rebar3
    remarkable-toolchain
    rox-filer
    rustup
    s3cmd
    scrcpy
    skaffold
    simplescreenrecorder
    shutter
    slack-dark
    spotify
    sqlite
    sqlite-utils
    taskwarrior
    taskwarrior-tui
    vit
    timewarrior
    teams
    terraform_0_14
    tig
    tightvnc
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
    xorg.xhost
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
            coc-nvim
            coc-go
            crystal
            ctrlp
            dhall-vim
            fugitive
            markdown-preview
            mixformat
            nerdtree
            nerdcom
            nvim-treesitter
            nlua-nvim
            popup-nvim
            telescope-nvim
            telescope-fzy-native-nvim
            vim-elixir
            vim-elm-syntax
            vim-jsx-typescript
            vim-markdown
            vim-nix
            vim-surround
            vim-terraform
            zenburn
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
      alias create-typescript-react=npx create-react-app --template typescript
      complete -F __start_kubectl k
      test -r /home/nico/.opam/opam-init/init.zsh && . /home/nico/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
      #export CLOUD_SDK_HOME="${pkgs.google-cloud-sdk}"
      #source "$CLOUD_SDK_HOME/google-cloud-sdk/completion.zsh.inc"
      PROMPT='%{$fg_bold[green]%}%n@%m %{$fg[blue]%}%D{[%X]}%{$reset_color%} %{$fg_bold[red]%}$(aws_prompt_info)%{$reset_color%} %{$fg[white]%}[%~]%{$reset_color%} $(git_prompt_info)
%{$fg[blue]%}->%{$fg_bold[blue]%} %#%{$reset_color%} '
    '';
    envExtra = ''
      GOPATH='/home/nico/.gopath'
    '';
  };


  # Enable Oh-my-zsh
  programs.zsh.oh-my-zsh = {
    enable = true;
    theme = "candy";
    plugins = [ "git" "sudo" "docker" "kubectl" "mix" "jump" "golang" "aws" "terraform" "taskwarrior" ];
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
      init.defaultBranch = "main";

    };
    #extraConfig = ''
        #[push]
        #default = current
      #'';
  };

  #programs.shadow-client = {
    ##enable = true;
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
