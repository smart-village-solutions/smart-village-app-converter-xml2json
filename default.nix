{ pkgs ? import <nixpkgs> {} }:

with pkgs;

bundlerEnv rec {
  name = "smart-village-xml2json-${version}";
  version = "0";
  gemdir = ./.;
  ruby = ruby_2_6;
}
