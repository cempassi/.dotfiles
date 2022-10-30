{
  config,
  pkgs,
  ...
}: {
  home.file.".lldbinit".source = ./lldbinit;
}
