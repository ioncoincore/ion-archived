#!/usr/bin/python
# Copyright 2014 BitPay, Inc.
# Copyright (c) 2015-2018 The PIVX developers
# Copyright (c) 2018 The Ion developers
# Distributed under the MIT/X11 software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

import os
import bctest
import buildenv

if __name__ == '__main__':
	bctest.bctester(os.environ["srcdir"] + "/test/data",
			"bitcoin-util-test.json",buildenv)

