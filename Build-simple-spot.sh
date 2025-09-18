#!/bin/sh
PACKAGE="simple-spot"
# ruim de AI zooi maar weer op. Overal ^M's, maar als je er over klaagt moet 
# eigen programma worden ingesteld, terwijl die al goed staat.
find pkg/DEBIAN -type f -exec dos2unix {} +

# En voor andere AI aangemaakte textbestanden:
find pkg -type f | while read f; do
   if file "$f" | grep -q "script"; then
      dos2unix "$f"
   fi
done
# ARCH=$(dpkg --print-architecture)
ARCH="all"  # scripts only, works on all 
VERSION=$(grep '^Version:' pkg/DEBIAN/control | awk '{print $2}')


# Make backup met datum-tijd in bestandsnaam
DATETIME=$(date +%Y%m%d-%H%M%S)
tar cf ../${PACKAGE}-${VERSION}_${ARCH}.${DATETIME}.tar  .
printf "Building package ${PACKAGE}_${VERSION}_${ARCH}.deb\n"
dpkg-deb --build pkg ${PACKAGE}_${VERSION}_${ARCH}.deb
