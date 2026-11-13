{
    inputs,
    ...
}: let
    inherit (inputs) import-tree;
in {
    imports = [
        (import-tree.match
            ".+\/default\.nix"
            ./.
        )
        # avoid infinite recursion
        (import ./mkCustomOutput/function.nix [ "modules" ])
    ];
}
