{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      neovim
    ];
    variables = {
      EDITOR = "nvim";
      MANPAGER = "nvim +Man!";
    };
  };

  homebrew = {
    enable = true;
    taps = [
      "hashicorp/tap"
    ];
    brews = [
      "hashicorp/tap/vault"
      "libomp"
      "veeso/termscp/termscp"
    ];
    casks = [
      "wezterm"
      "nikitabobko/tap/aerospace"
    ];
  };

  services = {
    nix-daemon.enable = true;
  };

  nix.settings.experimental-features = "nix-command flakes";

  system.stateVersion = 5;
}
