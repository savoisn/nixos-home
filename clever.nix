{ pkgs ? import <nixpkgs> {} }: with pkgs;

let clever-tools = import (fetchFromGitHub {
                     owner  = "fretlink";
                     repo   = "clever-tools-nix";
                     rev    = "665f6c42b6c3c5c8c07cf251e3faf3c54ac3cb9f";
                     sha256 = "1f9dv8iiprr4pnwp10rqcl5hdz475jxix7h6n133ifa9yyzp8j96";
                   }) {};
   # select appropriate version (see default.nix for the supported one)
   # clever-tools.v0_9_3
in clever-tools.latest


