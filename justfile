default:
    @just --list

# format every .nix file
fmt:
    nix fmt

# prints antipatterns and unused bindings
lint:
    statix check .
    deadnix .

# fix lint issues
lint-fix:
    statix fix .
    deadnix --edit .

# evaluate hosts config without building anything
check:
    nixos-rebuild dry-build --flake .#$(hostname)

update:
    nix flake update

switch:
    nh os switch