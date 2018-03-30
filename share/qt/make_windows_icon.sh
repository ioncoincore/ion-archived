#!/bin/bash
# create multiresolution windows icon
#mainnet
ICON_SRC=../../src/qt/res/icons/ion.png
ICON_DST=../../src/qt/res/icons/ion.ico
convert ${ICON_SRC} -resize 16x16 ion-16.png
convert ${ICON_SRC} -resize 32x32 ion-32.png
convert ${ICON_SRC} -resize 48x48 ion-48.png
convert ion-16.png ion-32.png ion-48.png ${ICON_DST}
#testnet
ICON_SRC=../../src/qt/res/icons/ion_testnet.png
ICON_DST=../../src/qt/res/icons/ion_testnet.ico
convert ${ICON_SRC} -resize 16x16 ion-16.png
convert ${ICON_SRC} -resize 32x32 ion-32.png
convert ${ICON_SRC} -resize 48x48 ion-48.png
convert ion-16.png ion-32.png ion-48.png ${ICON_DST}
rm ion-16.png ion-32.png ion-48.png
#regtest
ICON_SRC=../../src/qt/res/icons/ion_regtest.png
ICON_DST=../../src/qt/res/icons/ion_regtest.ico
convert ${ICON_SRC} -resize 16x16 ion-16.png
convert ${ICON_SRC} -resize 32x32 ion-32.png
convert ${ICON_SRC} -resize 48x48 ion-48.png
convert ion-16.png ion-32.png ion-48.png ${ICON_DST}
rm ion-16.png ion-32.png ion-48.png
#unittest
ICON_SRC=../../src/qt/res/icons/ion_unittest.png
ICON_DST=../../src/qt/res/icons/ion_unittest.ico
convert ${ICON_SRC} -resize 16x16 ion-16.png
convert ${ICON_SRC} -resize 32x32 ion-32.png
convert ${ICON_SRC} -resize 48x48 ion-48.png
convert ion-16.png ion-32.png ion-48.png ${ICON_DST}
rm ion-16.png ion-32.png ion-48.png