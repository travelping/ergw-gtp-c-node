#!/bin/sh

PACKAGE=$(dpkg-deb -f $1 Package)
VERSION=$(dpkg-deb -f $1 Version | sed -e 's/-[^-]*$//')
ARCHITECTURE=$(dpkg-deb -f $1 Architecture)
DEB="pool/main/e/ergw/$(basename $1)"

URL="https://api.bintray.com/content/$BINTRAY_USER/ergw/$PACKAGE/$VERSION/$DEB"

echo "Uploading $1..."
curl -T $1 -u $BINTRAY_USER:$BINTRAY_API_KEY $URL \
     -H 'X-Bintray-Debian-Distribution: xenial' \
     -H 'X-Bintray-Debian-Component: main' \
     -H "X-Bintray-Debian-Architecture: $ARCHITECTURE" \
     -H 'X-Bintray-Publish: 1' \
     -H 'X-Bintray-Override: 1'
echo "...done"

