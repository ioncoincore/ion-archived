#!/bin/sh
# Copyright (c) 2014-2015 The Bitcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C
set -e

ROOTDIR=dist
BUNDLE=${ROOTDIR}/Ion-Qt.app
CODESIGN=codesign
TEMPDIR=sign.temp
TEMPLIST=${TEMPDIR}/signatures.txt
<<<<<<< HEAD
OUT=signature-osx.tar.gz
=======
OUT=signature.tar.gz
>>>>>>> master
OUTROOT=osx

if [ ! -n "$1" ]; then
  echo "usage: $0 <codesign args>"
  echo "example: $0 -s MyIdentity"
  exit 1
fi

rm -rf ${TEMPDIR} ${TEMPLIST}
mkdir -p ${TEMPDIR}

${CODESIGN} -f --file-list ${TEMPLIST} "$@" "${BUNDLE}"

<<<<<<< HEAD
grep -v CodeResources < "${TEMPLIST}" | while read i; do
  TARGETFILE="${BUNDLE}/`echo "${i}" | sed "s|.*${BUNDLE}/||"`"
  SIZE=`pagestuff "$i" -p | tail -2 | grep size | sed 's/[^0-9]*//g'`
  OFFSET=`pagestuff "$i" -p | tail -2 | grep offset | sed 's/[^0-9]*//g'`
  SIGNFILE="${TEMPDIR}/${OUTROOT}/${TARGETFILE}.sign"
  DIRNAME="`dirname "${SIGNFILE}"`"
=======
for i in `grep -v CodeResources ${TEMPLIST}`; do
  TARGETFILE="${BUNDLE}/`echo ${i} | sed "s|.*${BUNDLE}/||"`"
  SIZE=`pagestuff $i -p | tail -2 | grep size | sed 's/[^0-9]*//g'`
  OFFSET=`pagestuff $i -p | tail -2 | grep offset | sed 's/[^0-9]*//g'`
  SIGNFILE="${TEMPDIR}/${OUTROOT}/${TARGETFILE}.sign"
  DIRNAME="`dirname ${SIGNFILE}`"
>>>>>>> master
  mkdir -p "${DIRNAME}"
  echo "Adding detached signature for: ${TARGETFILE}. Size: ${SIZE}. Offset: ${OFFSET}"
  dd if="$i" of="${SIGNFILE}" bs=1 skip=${OFFSET} count=${SIZE} 2>/dev/null
done

<<<<<<< HEAD
grep CodeResources < "${TEMPLIST}" | while read i; do
  TARGETFILE="${BUNDLE}/`echo "${i}" | sed "s|.*${BUNDLE}/||"`"
=======
for i in `grep CodeResources ${TEMPLIST}`; do
  TARGETFILE="${BUNDLE}/`echo ${i} | sed "s|.*${BUNDLE}/||"`"
>>>>>>> master
  RESOURCE="${TEMPDIR}/${OUTROOT}/${TARGETFILE}"
  DIRNAME="`dirname "${RESOURCE}"`"
  mkdir -p "${DIRNAME}"
  echo "Adding resource for: \"${TARGETFILE}\""
  cp "${i}" "${RESOURCE}"
done

rm ${TEMPLIST}

tar -C "${TEMPDIR}" -czf "${OUT}" .
rm -rf "${TEMPDIR}"
echo "Created ${OUT}"
