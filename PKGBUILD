# Maintainer: Mocha Hois <Mochaaaaaa@cybertari.net>
pkgname=waylandcraft-session-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Minimal labwc session preconfigured to run Minecraft Waylandcraft as a session."
arch=('x86_64')
url="https://github.com/NerdPupX3/Waylandcraft-Session"
license=('GPL-3.0-or-later')
depends=('labwc' 'prismlauncher' 'wlcontrol' 'pavucontrol')
source=("git+https://github.com/NerdPupX3/Waylandcraft-Session.git")
sha256sums=('SKIP')

package() {
    install -Dm644 "$srcdir/waylandcraft-session/rc.xml" \
        "$pkgdir/usr/share/waylandcraft/rc.xml"
    install -Dm755 "$srcdir/waylandcraft-session/scripts/start-waylandcraft.sh" \
        "$pkgdir/usr/bin/start-waylandcraft.sh"
    install -Dm644 "$srcdir/waylandcraft-session/waylandcraft-session.desktop" \
        "$pkgdir/usr/share/wayland-sessions/waylandcraft-session.desktop"
    install -Dm755 "$srcdir/waylandcraft-session/scripts/waylandcraft-setup.sh" \
        "$pkgdir/etc/profile.d/waylandcraft-setup.sh"
    install -dm755 "$srcdir/waylandcraft-session/instances" \
        "$pkgdir/usr/share/waylandcraft/instances"
    cp -a "$srcdir/waylandcraft-session/instances/Waylandcraft Extended" \
        "$pkgdir/usr/share/waylandcraft/instances/"
    cp -a "$srcdir/waylandcraft-session/instances/Waylandcraft original" \
        "$pkgdir/usr/share/waylandcraft/instances/"
}
