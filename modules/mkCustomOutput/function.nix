path:
# module scope
{
    lib,
    ...
}: let
    inherit (lib) types;
in {
    options.flake = {
        type = types.attrs
            // {
                merge = locations: definitions: definitions
                    |> lib.getValues
                    |> lib.foldl
                        (lib.recursiveUpdate)
                        {};
            };
        default = {};
    }
        |> lib.mkOption
        |> lib.setAttrByPath path
    ;
}
