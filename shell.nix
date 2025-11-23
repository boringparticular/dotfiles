{
  nixpkgs ? <nixpkgs>,
  pkgs ? (import nixpkgs { }),
}:
pkgs.mkShell {
  packages = with pkgs; [
    chezmoi
    python3
    python3Packages.bpython
    python3Packages.pyyaml
  ];
}
