{
  description = "Ergotu's NeoVim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ts-comments = {
      url = "github:folke/ts-comments.nvim";
      flake = false;
    };
    ntree-float = {
      url = "github:JMarkin/nvim-tree.lua-float-preview";
      flake = false;
    };
    buffer-manager = {
      url = "github:j-morano/buffer_manager.nvim";
      flake = false;
    };
    color-picker = {
      url = "github:ziontee113/color-picker.nvim";
      flake = false;
    };
    moveline = {
      url = "github:willothy/moveline.nvim";
      flake = false;
    };
    session-manager = {
      url = "github:Shatur/neovim-session-manager";
      flake = false;
    };
    markdown-nvim = {
      url = "github:MeanderingProgrammer/markdown.nvim";
      flake = false;
    };
    windows = {
      url = "github:anuvyklack/windows.nvim";
      flake = false;
    };
    windows-mc = {
      url = "github:anuvyklack/middleclass";
      flake = false;
    };
    windows-a = {
      url = "github:anuvyklack/animation.nvim";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    nixvim,
    flake-parts,
    pre-commit-hooks,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["aarch64-linux" "x86_64-linux" "aarch64-darwin" "x86_64-darwin"];

      perSystem = {
        system,
        pkgs,
        self',
        lib,
        ...
      }: let
        opts = {
          border = "rounded";
          transparent = "true";
        };

        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          inherit pkgs;
          module = ./config;

          extraSpecialArgs =
            {
              inherit inputs opts;
            }
            // import ./lib {inherit lib;};
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in {
        checks = {
          default = pkgs.nixvimLib.check.mkTestDerivationFromNvim {
            inherit nvim;
            name = "A nixvim configuration";
          };
          pre-commit-check = pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              statix.enable = true;
              alejandra.enable = true;
            };
          };
        };

        formatter = pkgs.alejandra;

        packages.default = nvim;

        devShells = {
          default = with pkgs;
            mkShell {inherit (self'.checks.pre-commit-check) shellHook;};
        };
      };
    };
}
