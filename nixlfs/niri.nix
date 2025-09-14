# Draft Nix expression for Niri Wayland
{ stdenv, fetchFromGitHub, meson, ninja, pkg-config, wayland, wayland-protocols, libinput, pixman, seatd, libxkbcommon, cairo, pango, wlroots, scdoc }:

stdenv.mkDerivation {
  pname = "niri";
  version = "latest";

  src = fetchFromGitHub {
    owner = "niri-wayland";
    repo = "niri";
    rev = "main";
    sha256 = "0000000000000000000000000000000000000000000000000000"; # TODO: update
  };

  nativeBuildInputs = [ meson ninja pkg-config scdoc ];
  buildInputs = [ wayland wayland-protocols libinput pixman seatd libxkbcommon cairo pango wlroots ];

  mesonFlags = [ ];

  meta = {
    description = "A dynamic, tiling Wayland compositor";
    homepage = "https://github.com/niri-wayland/niri";
    license = stdenv.lib.licenses.gpl3;
    maintainers = with stdenv.lib.maintainers; [ ];
    platforms = stdenv.lib.platforms.linux;
  };
}

