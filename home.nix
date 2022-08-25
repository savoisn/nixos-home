{ pkgs, system, lib, python, ... }:

let 
  myvim = (import ./nvim-custom-plugin.nix ) pkgs;

in
{
  imports = [
    ./tools
    #(fetchGit { url = "https://github.com/NicolasGuilloux/shadow-nix"; ref = "v1.0.3"; } + "/import/home-manager.nix")
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-13.6.9"
  ];

  nixpkgs.config.allowUnfree = true;

  home.file.".xprofile".source = ./xprofile;

  home.packages = with pkgs; [
    acpi
    silver-searcher
    alacritty
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
    dive
    dhall
    dhall-json
    docker-compose
    dotnet-sdk_3
    dpkg
    dune-release
    elixir
    erlang
    exercism
    fasd
    feh
    file
    fira-mono
    fish
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
    jo
    jq
    kind
    kubectl
    kotlin
    librecad
    lua
    lz4
    maven
    mpv
    ngrok
    nushell
    nix-index
    nix-tree
    nodejs
    ntfs3g
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
    obsidian
    ocaml
    opam
    packer qalculate-gtk
    ranger
    rclone
    rebar3
    remarkable-toolchain
    rlwrap
    rustup
    rox-filer
    s3cmd
    scrcpy
    screenkey
    skaffold
    simplescreenrecorder
    shutter
    slack-dark
    spotify
    sqlite
    sqlite-utils
    sqlitebrowser
    starship
    taskwarrior
    taskwarrior-tui
    timewarrior
    teams
    terraform_0_14
    tig
    tlaplus
    transmission-gtk
    tdesktop
    udiskie
    unzip
    upower
    usbutils
    vagrant
    vit
    vlang
    vlc
    #vscode-extensions.ms-vsliveshare.vsliveshare
    #vscode-with-extensions
    watchman
    w3m
    xorg.xbacklight
    xarchiver
    xclip
    xorg.xkbcomp
    xorg.xhost
    xorg.xev
    xxkb
    youtube-dl
    zellij
    zip
  ];

  xresources.properties = { 
    "xterm*background" = "darkgrey"; 
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
    enable = false;
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
            coc-rls
            coc-go
            coc-lua
            coc-elixir
            coc-tsserver
            crystal
            ctrlp
            dhall-vim
            ember
            fugitive
            harpoon
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
            vim-fsharp
            vim-jsx-typescript
            vim-markdown
            vim-nix
            vim-solidity
            vim-surround
            vim-terraform
            vlang
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
      export PATH=$PATH:~/bin:~/bin/bats/bin:~/.mix/escripts
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

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;    # You can skip this if you want to use the unfree version
    extensions = with pkgs.vscode-extensions; [
      # Some example extensions...
      dracula-theme.theme-dracula
      vscodevim.vim
      yzhang.markdown-all-in-one
    ];
  };


  #programs.shadow-client = {
    ##enable = true;
    #channel = "preprod";
  #};
  programs.zellij = {
    enable = true;
  };
  
  programs.fish = {
    enable = true;

    shellAliases = {
      "sqlite3" = "rlwrap sqlite3";
      "l" = "ls -lastr";
    };

    functions = {
      fish_greeting = {
        body = "fortune";
      };
    };
    plugins = [
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "ddeb28a7b6a1f0ec6dae40c636e5ca4908ad160a";
          sha256 = "0c5i7sdrsp0q3vbziqzdyqn4fmp235ax4mn4zslrswvn8g3fvdyh";
        };
      }

      # oh-my-fish plugins are stored in their own repositories, which
      # makes them simple to import into home-manager.
      {
        name = "fasd";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-fasd";
          rev = "38a5b6b6011106092009549e52249c6d6f501fba";
          sha256 = "06v37hqy5yrv5a6ssd1p3cjd9y3hnp19d3ab7dag56fs1qmgyhbs";
        };
      }
    ];
  };

  programs.nushell = {
    enable = true;
    settings = {
      edit_mode = "vi";
      startup = [ "alias la [] { ls -a }" "alias e [msg] { echo $msg }" ];
      key_timeout = 10;
      completion_mode = "circular";
      no_auto_pivot = true;
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      shell = {
        program = "/home/nico/.nix-profile/bin/fish";
      };

      window.dimensions = {
        lines = 3;
        columns = 200;
      };
      key_bindings = [
        {
          key = "K";
          mods = "Control";
          chars = "\\x0c";
        }
      ];
    };
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
