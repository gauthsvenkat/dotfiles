{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home = {
    stateVersion = "23.05"; # Don't change this
    packages = with pkgs; [
      pre-commit
      just
      meslo-lgs-nf
      glab
      cmake
      nodejs
      rustup
      xclip
      cue
      hurl
      uv
      poetry
      nixfmt-rfc-style
      hoppscotch
      ttyper
      chezmoi
    ];
  };

  programs = {
    home-manager.enable = true;
    lazygit.enable = true;
    nh.enable = true;
    direnv.enable = true;
    fastfetch.enable = true;
    ripgrep.enable = true;
    bat.enable = true;
    k9s.enable = true;
    jq.enable = true;
    fzf.enable = true;
    eza.enable = true;
    yazi.enable = true;

    zoxide = {
      enable = true;
      options = [
        "--cmd j"
      ];
    };

    git = {
      enable = true;
      userEmail = "gautham@dexterenergy.ai";
      userName = "Gautham";
      lfs.enable = true;
    };

    btop = {
      enable = true;
      settings = {
        color_theme = "gruvbox_dark";
        update_ms = 1000;
        proc_tree = true;
      };
    };

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "docker"
          "docker-compose"
          "sudo"
          "fzf"
          "git"
          "zoxide"
        ];
      };
      shellAliases = {
        l = "eza -l --icons -a";
        lt = "eza --tree --icons --git --level=3";
        v = "nvim";
        b = "bat";
        y = "yazi";
        lg = "lazygit";
      };
      initExtra = ''
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        test -f ~/.p10k.zsh && source ~/.p10k.zsh
        export PATH=/opt/homebrew/bin:$PATH
        fastfetch
      '';
    };
  };
}
