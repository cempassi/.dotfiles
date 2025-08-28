{
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.resurrect
      tmuxPlugins.continuum
    ];

    extraConfig = builtins.readFile ./tmux.conf;
  };
}
