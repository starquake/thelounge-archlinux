# Maintainer: Reto Brunner <brunnre8@gmail.com>
# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>
pkgname=thelounge
pkgver=4.2.0
pkgrel=3
pkgdesc='Modern self-hosted web IRC client'
url='https://thelounge.chat/'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('yarn')
backup=('etc/thelounge/config.js')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/thelounge/thelounge/archive/v${pkgver}.tar.gz"
    'system.service'
    'user.service'
    'sysusers.d'
    'tmpfiles.d'
)
sha256sums=('b727fbc42b895ddd7c4b8a7d5a4b72fdf3c882b33c44b25eb3e1ee00ced709d2'
            'c92210f6ac8f01c1cd01b6b26793094cd2feea583ed21fab3564d6bcafdc7a20'
            'c609f3309f54bd6285e99ff29ca2464828bec7bbbca67243ee688bd2d605dbf0'
            '67aa49cf001192b32c62b045bffa3fd0b37f56e00176c4af2cbadba10a6d8a10'
            'b12378668c8466c1edd1659e3763283bd53b0b254e7518ab5cf8fee2d10f071d')

prepare() {
    echo /var/lib/thelounge > "${pkgname}-${pkgver}/.thelounge_home"
}

build() {
    cd "${pkgname}-${pkgver}"
    yarn install
    export NODE_ENV=production
    yarn build
}

package() {
    export NODE_ENV=production

    yarn global add --prefix "${pkgdir}/usr" --global-folder "${pkgdir}/usr/lib/${pkgname}" file:${srcdir}/${pkgname}-${pkgver}

    # add default config
    install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/defaults/config.js" "${pkgdir}/etc/thelounge/config.js"

    # services
    install -Dm644 "${srcdir}/system.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${srcdir}/user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

    # setting up system user
    install -Dm644 "${srcdir}/sysusers.d" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${srcdir}/tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
