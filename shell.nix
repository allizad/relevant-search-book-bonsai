# { pkgs ? import <nixpkgs> {} }:
#   pkgs.mkShell {
#     # nativeBuildInputs is usually what you want -- tools you need to run
#     nativeBuildInputs = [ pkgs.buildPackages.ruby_2_3 ];
# }

# (with pkgs;
# let
#   my-python-packages = python-packages: with python-packages; [
#     requests
#     jupyter
#     # other python packages
#   ];
#   python-with-my-packages = python2.withPackages my-python-packages;
# in
# python-with-my-packages)

# shell.nix
{ pkgs ? import <nixpkgs> {} }:
let
  python-with-my-packages = pkgs.python27.withPackages (p: with p; [
    jupyter
    # other python packages you want
  ]);
in
python-with-my-packages.env # replacement for pkgs.mkShell
