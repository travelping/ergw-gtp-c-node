#!/bin/sh

PACKAGE=ergw-gtp-c-node
PKG_VERSION=$(dpkg-parsechangelog -SVersion | sed -e 's/-[^-]*$//')
DEB_VERSION=$(dpkg-parsechangelog -SVersion)
ARCHITECTURE=$(dpkg-architecture -qDEB_BUILD_ARCH)

DEB_FILE="artifacts/${PACKAGE}_${DEB_VERSION}_${ARCHITECTURE}.deb"
DEB="pool/main/e/ergw/$(basename ${DEB_FILE})"

URL="https://api.bintray.com/content/$BINTRAY_USER/ergw/$PACKAGE/$PKG_VERSION/$DEB"

echo "Uploading ${DEB_FILE} to ${URL} ..."
curl -T ${DEB_FILE} -u ${BINTRAY_USER}:${BINTRAY_API_KEY} ${URL} \
     -H 'X-Bintray-Debian-Distribution: xenial' \
     -H 'X-Bintray-Debian-Component: main' \
     -H "X-Bintray-Debian-Architecture: ${ARCHITECTURE}" \
     -H 'X-Bintray-Publish: 1' \
     -H 'X-Bintray-Override: 1'
echo "...done"

