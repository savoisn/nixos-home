pkgs:

let
  abolish = pkgs.vimUtils.buildVimPlugin {
    name = "abolish";
    src = pkgs.fetchFromGitHub {
      owner = "tpope";
      repo = "vim-abolish";
      rev = "b6a8b49e2173ba5a1b34d00e68e0ed8addac3ebd";
      sha256 = "0i9q3l7r5p8mk4in3c1j4x0jbln7ir9lg1cqjxci0chjjzfzc53m";
    };
  };

  articulate = pkgs.vimUtils.buildVimPlugin {
    name = "articulate";
    src = pkgs.fetchFromGitHub {
      owner = "ivanbrennan";
      repo = "articulate";
      rev = "82d03316b67249a32cdddfc9a0385b1f4c2ff3a1";
      sha256 = "1cg4djcg3qh0hjic65ivkvcz1jcblahnvvi560qd9jvjm9j58kss";
    };
  };

  bstack = pkgs.vimUtils.buildVimPlugin {
    name = "bstack";
    src = pkgs.fetchFromGitHub {
      owner = "ivanbrennan";
      repo = "bstack";
      rev = "99e43e01cdfdd8758db5e0eb7f94511b41adb4f3";
      sha256 = "1rlvqxxka2big3amq1fjd3ic9p01pqhpxvy03s40hr6f79r3phbp";
    };
  };

  coherent = pkgs.vimUtils.buildVimPlugin {
    name = "coherent";
    src = pkgs.fetchFromGitHub {
      owner = "ivanbrennan";
      repo = "coherent";
      rev = "2085f0440f494ade1c8017937f3c86680f40c5c1";
      sha256 = "1cjycqqw358wwq4m72m1nzhjmzmixac4p6h1j8bha7yy75kdn30c";
    };
  };

  coot = pkgs.vimUtils.buildVimPlugin {
    name = "coot";
    src = pkgs.fetchFromGitHub {
      owner = "ivanbrennan";
      repo = "coot";
      rev = "ea0a86f4b337a8608e08b2b3fe20765f712bb66a";
      sha256 = "0k7bcy4gfms15iw6hfbbq3zrq5c209fs6mlnzf2db5m31k8295aj";
    };
  };

  dirvish = pkgs.vimUtils.buildVimPlugin {
    name = "dirvish";
    src = pkgs.fetchFromGitHub {
      owner = "justinmk";
      repo = "vim-dirvish";
      rev = "0ad27e1e9161057ad83c6a96e9a4b8acd6e17f98";
      sha256 = "19a21sr7c5lk8b6vx3gsyla03c32lixgk670md4n79gslxy40f6a";
    };
  };

  edot = pkgs.vimUtils.buildVimPlugin {
    name = "edot";
    src = pkgs.fetchFromGitHub {
      owner = "ivanbrennan";
      repo = "edot";
      rev = "c8d24897cd46e9aaf2ed2b1f53dceabeb4be6dcf";
      sha256 = "0jmpjg7kws601mb3wvmjj0j7syvfdqx0gcjyss0h89q0jmqzh0ri";
    };
  };

  ftglue = pkgs.vimUtils.buildVimPlugin {
    name = "ftglue";
    src = pkgs.fetchFromGitHub {
      owner = "ivanbrennan";
      repo = "ftglue";
      rev = "74af4d6e2bf49f4e914711184a07dcc12b6e5481";
      sha256 = "16hj3gs1bgi7307pgywik1k8bshwnm38qwwgw6ispfac4m01br8p";
    };
  };

  haskell-vim = pkgs.vimUtils.buildVimPlugin {
    name = "haskell-vim";
    src = pkgs.fetchFromGitHub {
      owner = "neovimhaskell";
      repo = "haskell-vim";
      rev = "a5302e09292a1ca00aa48927332ea77f7de5409d";
      sha256 = "1s2y82c70aihn1nkwqn0f8vkd5kv8a70p6vp6s6xq2lq9zic6m7h";
    };
  };

  hint = pkgs.vimUtils.buildVimPlugin {
    name = "hint";
    src = pkgs.fetchFromGitHub {
      owner = "ivanbrennan";
      repo = "hint";
      rev = "5e5e2776d0a6a7fcc6b582ff7532d9d47c60bb99";
      sha256 = "0qhjsdrg2nj8cxw27iv4kmr7zlpx9m919wjg5p0dqwybz3ybvn8j";
    };
  };

  iota = pkgs.vimUtils.buildVimPlugin {
    name = "iota";
    src = pkgs.fetchFromGitHub {
      owner = "ivanbrennan";
      repo = "iota";
      rev = "eb6409db09f7b547f769dfd0a00de4396e7af14c";
      sha256 = "159hfipy63vlykxcqwb9wzp6mfzv5v7ibj5lznjpzmkfn36sb867";
    };
  };

  latitude = pkgs.vimUtils.buildVimPlugin {
    name = "latitude";
    src = pkgs.fetchFromGitHub {
      owner = "ivanbrennan";
      repo = "latitude";
      rev = "b2aeba14230cb9524f78e3578f54797779320c52";
      sha256 = "072mvhip91310ps8mir1gwi8b6nd0hqzi721wgl6241mgkzw1198";
    };
  };

  listical = pkgs.vimUtils.buildVimPlugin {
    name = "listical";
    src = pkgs.fetchFromGitHub {
      owner = "ivanbrennan";
      repo = "listical";
      rev = "e209707be3cc2898cceaadb15e01b6ff957367ec";
      sha256 = "1vqslnlh8pa70a3s3h4z8fqzr2ll03y5sqbj97bj20bk65nck2yx";
    };
  };

  mline = pkgs.vimUtils.buildVimPlugin {
    name = "mline";
    src = pkgs.fetchFromGitHub {
      owner = "ivanbrennan";
      repo = "mline";
      rev = "69195fb88fa406f51a0ada9a845815d5863dd2b4";
      sha256 = "0pjp75f3av5p3vjrb64r0cib3g2pxqlk1s54cr8pl03qv3yp53w7";
    };
  };

  ocursor = pkgs.vimUtils.buildVimPlugin {
    name = "ocursor";
    src = pkgs.fetchFromGitHub {
      owner = "ivanbrennan";
      repo = "ocursor";
      rev = "c21602a41d40b76117af029cb98b4e4e459bf6cd";
      sha256 = "0c8ka85821b24g5l37lp2kigr44p6l567jdaa2smycqx8yspwamm";
    };
  };

  optcycle = pkgs.vimUtils.buildVimPlugin {
    name = "optcycle";
    src = pkgs.fetchFromGitHub {
      owner = "ivanbrennan";
      repo = "optcycle";
      rev = "9848e68c3de086f82cf66613ee141ff0a5aba46e";
      sha256 = "0y35j171lygfd4nhf2iqf0zapam24fzkdy7h6ks967zsvsl2dxmn";
    };
  };

  refract = pkgs.vimUtils.buildVimPlugin {
    name = "refract";
    src = pkgs.fetchFromGitHub {
      owner = "ivanbrennan";
      repo = "refract";
      rev = "ef9cc91cbb571e54e32ccaa556e56491ba8c4385";
      sha256 = "1ycb6gjd202smx7q8yvx7576v86sz2l6xkg8ps0ry0minirgaf6g";
    };
  };

  sohi = pkgs.vimUtils.buildVimPlugin {
    name = "sohi";
    src = pkgs.fetchFromGitHub {
      owner = "ivanbrennan";
      repo = "sohi";
      rev = "e63e700c2b3c8251db10d75a859123271aed9b9f";
      sha256 = "0xbxvg6rygm915lz60rfc2byqis5w7cb9ny4b95314izzpi27k79";
    };
  };

  splitjoin = pkgs.vimUtils.buildVimPlugin {
    name = "splitjoin";
    src = pkgs.fetchFromGitHub {
      owner = "AndrewRadev";
      repo = "splitjoin.vim";
      rev = "98d860151e4ea9b7845bfdd7e173b660d18fe2b0";
      sha256 = "1czw3hrhf8pw9bq3mfjbald2yqy81jjdnvn05qfq1b80navxff1q";
    };
  };

  super-shell-indent = pkgs.vimUtils.buildVimPlugin {
    name = "Super-Shell-Indent";
    src = pkgs.fetchFromGitHub {
      owner = "vim-scripts";
      repo = "Super-Shell-Indent";
      rev = "eee1c2ef40f333049c45c6cadd1a2b9fa58c8488";
      sha256 = "1k7mr8q7jbhqhg07a1m00ihcrvsnmg49rp8y7sdna20dd5jd3yfd";
    };
  };

  tabtab = pkgs.vimUtils.buildVimPlugin {
    name = "tabtab";
    src = pkgs.fetchFromGitHub {
      owner = "ivanbrennan";
      repo = "tabtab";
      rev = "cfd2119fdfd22c62af63a11417d6a2bb09b12534";
      sha256 = "1f5f4p3y31ricyjsfgpizxfrqf6wa4iybc0vlh14rfix82rkrzzj";
    };
  };

  traces = pkgs.vimUtils.buildVimPlugin {
    name = "traces";
    src = pkgs.fetchFromGitHub {
      owner = "markonm";
      repo = "traces.vim";
      rev = "4f320183504702baf069b2de9a800a7e765ff97a";
      sha256 = "0pp1g1g04ff1008593fd5623x9ld53ynd7d3aq0bhbbzyhf4vnwa";
    };
  };

  vim-grepper = pkgs.vimUtils.buildVimPlugin {
    name = "vim-grepper";
    src = pkgs.fetchFromGitHub {
      owner = "ivanbrennan";
      repo = "vim-grepper";
      rev = "2d397b549480056da655eba7ef54fc36ea23b66d";
      sha256 = "0scvx7dhwd81n2q0grwx2xmlqhbwxis3i1n2w5w80hpafpiz2ngf";
    };
  };

  vim-javascript-syntax = pkgs.vimUtils.buildVimPlugin {
    name = "vim-javascript-syntax";
    src = pkgs.fetchFromGitHub {
      owner = "jelera";
      repo = "vim-javascript-syntax";
      rev = "139ec9080f219536a94281aef7980654ab7c1a1c";
      sha256 = "18468dljr9fqfy89jfs8ahcfj6a26cp5c4iqi526wwj25irbxf71";
    };
  };

  vim-matchit = pkgs.vimUtils.buildVimPlugin {
    name = "vim-matchit";
    src = pkgs.fetchFromGitHub {
      owner = "jwhitley";
      repo = "vim-matchit";
      rev = "57de3a754795fe325771bf0c3991905ae1d0246e";
      sha256 = "0k31j4fbzdilkl8bqi1lkljyamj298fb2d4shds84lr1bmz4mlqm";
    };
  };

  vim-projectionist = pkgs.vimUtils.buildVimPlugin {
    name = "vim-projectionist";
    src = pkgs.fetchFromGitHub {
      owner = "tpope";
      repo = "vim-projectionist";
      rev = "d20f2a25fe820c5d0abf4b584c46203ecf067f2d";
      sha256 = "1vn55f3jls06bsavk4vf9fy9hq0izbg57b69f6j58kv887xvynlv";
    };
  };

  vim-racket = pkgs.vimUtils.buildVimPlugin {
    name = "vim-racket";
    src = pkgs.fetchFromGitHub {
      owner = "wlangstroth";
      repo = "vim-racket";
      rev = "f76fde9afbc008b7468c9ea026cbe3840af5f5ef";
      sha256 = "1cs6kyw9565mdpyifvnp6lw9n0i31ahfqn48pg1n5h49bvn9667x";
    };
  };

  vim-rails = pkgs.vimUtils.buildVimPlugin {
    name = "vim-rails";
    src = pkgs.fetchFromGitHub {
      owner = "tpope";
      repo = "vim-rails";
      rev = "39cb87dbbac742dad68908c1c645b8f202d8f943";
      sha256 = "0n9h56gicy4cdisqmd9rd3p2z5syadd0iv0xkv04glwd206k7naf";
    };
  };

  vim-rake = pkgs.vimUtils.buildVimPlugin {
    name = "vim-rake";
    src = pkgs.fetchFromGitHub {
      owner = "tpope";
      repo = "vim-rake";
      rev = "79e51f17d26e2f31321af94ffd45bc9060623fdb";
      sha256 = "0k5n06fwqlmkkmf8a7n9whrhc57l54fwl5dnr2hc1lyfjn8bqv45";
    };
  };

  vim-spec-runner = pkgs.vimUtils.buildVimPlugin {
    name = "vim-spec-runner";
    src = pkgs.fetchFromGitHub {
      owner = "gabebw";
      repo = "vim-spec-runner";
      rev = "08b31f2963073863de59df4aec1b22c610745968";
      sha256 = "19npg6q6ff5x9i6xaqj4pxzx3jg1nmbchj6vr8srn4af9znmzh6r";
    };
  };

  vim-tmux-runner = pkgs.vimUtils.buildVimPlugin {
    name = "vim-tmux-runner";
    src = pkgs.fetchFromGitHub {
      owner = "christoomey";
      repo = "vim-tmux-runner";
      rev = "30ed8912f5051eeffee70a478e8db63938a448f8";
      sha256 = "1svizngc4p1cnyqw7qbsxj215ls2nw0c2i041cdmlgdma1yyns4v";
    };
  };

  vim-unimpaired = pkgs.vimUtils.buildVimPlugin {
    name = "vim-unimpaired";
    src = pkgs.fetchFromGitHub {
      owner = "tpope";
      repo = "vim-unimpaired";
      rev = "c77939c4aff30b2ed68deb1752400ec15f17c3a2";
      sha256 = "0qd9as008r2vycls48bfb163rp7dddw7l495xn4l1gl00sh79cxy";
    };
  };

  vmacs = pkgs.vimUtils.buildVimPlugin {
    name = "vmacs";
    src = pkgs.fetchFromGitHub {
      owner = "ivanbrennan";
      repo = "vmacs";
      rev = "668f0a9273d5368fe8d8ac30662f6f5dacc47574";
      sha256 = "1yvhj2csskfaf1yqslc3hiv9y0i4pp26m20pakrw2k3dal8f4agd";
    };
  };

  myvmux = pkgs.vimUtils.buildVimPlugin {
    name = "vmux";
    src = pkgs.fetchFromGitHub {
      owner = "ivanbrennan";
      repo = "vmux";
      rev = "2773a8772f097f5ae491dc33ad2231e5417066db";
      sha256 = "18g6zhfcp30lxcdgqr45fpdw0aqvi5zvm9m1ag0abc84c2lk7h3g";
    };
  };

  wmgraphviz = pkgs.vimUtils.buildVimPlugin {
    name = "wmgraphviz";
    src = pkgs.fetchFromGitHub {
      owner = "wannesm";
      repo = "wmgraphviz.vim";
      rev = "eff46932ef8324ab605c18619e94f6b631d805e2";
      sha256 = "1l3qh6293v5rj2khr90i0pgybfvvifvclhla4d1pzdvi40csi0xs";
    };
  };

  zoo = pkgs.vimUtils.buildVimPlugin {
    name = "zoo";
    src = pkgs.fetchFromGitHub {
      owner = "ivanbrennan";
      repo = "zoo";
      rev = "05bd06b491b3fe45c4f0192bc8bad8bd86164c42";
      sha256 = "0z4zcvwfsx97n64bn3jis2b249zplrz2k34iz8qgdi98lgdlzhx9";
    };
  };
  nerdcom = pkgs.vimUtils.buildVimPlugin {
    name = "nerdcom";
    src = pkgs.fetchFromGitHub {
      owner = "scrooloose";
      repo = "nerdcommenter";
      rev = "9a32fd2534427f7a1dcfe22e9c0ea6b67b6dbe78";
      sha256 = "0s862kzhvv9qpr7gxd3h52hczjvm55zyff5qn0z5095072pr3wjx";
    };
  };
  coc-elixir = pkgs.vimUtils.buildVimPlugin {
    name = "cocelixir";
    src = pkgs.fetchFromGitHub {
      owner = "elixir-lsp";
      repo = "coc-elixir";
      rev= "a48b9c8fd8651fc3886b16f5c2fc367d91f4cffc";
      sha256= "xHCX3KWtA2+YrGRgua+vdI+8/yEJQjnZS0u82eHhuqw=";
    };
  };
  mixformat = pkgs.vimUtils.buildVimPlugin {
    name = "mixformat";
    src = pkgs.fetchFromGitHub {
      owner = "mhinz";
      repo = "vim-mix-format";
      rev = "2a30a8aee29ebc0961caac6e63ea9f554ba656ed";
      sha256 = "1pcrb3walghvn31w33r0l2b7ampxddn58mv35y0r01p2cjq4b7gb";
    };
  };
  markdown-preview = pkgs.vimUtils.buildVimPlugin {
    name = "markdown-preview";
    src = pkgs.fetchFromGitHub {
      owner = "iamcco";
      repo = "markdown-preview.nvim";
      rev = "5c813eaf943ed7491ba855ad0cb563c31767debf";
      sha256 = "094sxyna76vsw7gp8y6qwb7ff1p5ch4zbsm29mbndlw83b4d8yh2";
    };
  };
  crystal = pkgs.vimUtils.buildVimPlugin {
    name = "crystal";
    src = pkgs.fetchFromGitHub {
      owner = "vim-crystal";
      repo = "vim-crystal";
      rev = "bc4f115de69fdeb4419e2cbef1981f0b39c6d972";
      sha256 = "17qr5rbchpgh75g14i5m899zp56c4zkj0yaj0h0p4x184xkjrxl3";
    };
  };
  svelte = pkgs.vimUtils.buildVimPlugin {
    name = "svelte";
    src = pkgs.fetchFromGitHub {
      owner = "evanleck";
      repo = "vim-svelte";
      rev = "f63fa77d621b25092081cce815effd7fbc169113";
      sha256 = "0j7j6ibrylv32y0vw002yayfg7xia59nm2952bhbwlkl6m2cwnz9";
    };
  };
  ember = pkgs.vimUtils.buildVimPlugin {
    name = "ember";
    src = pkgs.fetchFromGitHub {
      owner = "joukevandermaas";
      repo = "vim-ember-hbs";
      rev = "c47e1958a6c190c9d79ac66cb812f1a1d3b4e968";
      sha256 = "AypAVARFyhoT/zTtkluZnE6TsWV3ydv4h9EVI1GwXSs=";
    };
  };
  vlang = pkgs.vimUtils.buildVimPlugin {
    name = "vlang";
    src = pkgs.fetchFromGitHub {
      owner = "ollykel";
      repo = "v-vim";
      rev = "1dc1388bafb89072f8349dbd96f9462ae22237cb";
      sha256 = "AJqSUK05pq//0Nw331oTRUUrm/sO8eInTRYgvDM3i+w=";
    };
  };


in {
  custom_plugins = { 
    nerdcom = nerdcom; 
    coc-elixir = coc-elixir; 
    mixformat = mixformat;
    markdown-preview = markdown-preview;
    crystal = crystal;
    svelte = svelte;
    ember = ember;
    vlang = vlang;
  };
}
