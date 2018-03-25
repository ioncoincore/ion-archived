#!/bin/bash

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

IOND=${IOND:-$SRCDIR/iond}
IONCLI=${IONCLI:-$SRCDIR/ion-cli}
IONTX=${IONTX:-$SRCDIR/ion-tx}
IONQT=${IONQT:-$SRCDIR/qt/ion-qt}

[ ! -x $IOND ] && echo "$IOND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BTCVER=($($IONCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for iond if --version-string is not set,
# but has different outcomes for ion-qt and ion-cli.
echo "[COPYRIGHT]" > footer.h2m
$IOND --version | sed -n '1!p' >> footer.h2m

for cmd in $IOND $IONCLI $IONTX $IONQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
