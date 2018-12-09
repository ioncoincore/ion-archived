# Copyright (c) 2018 The Ion developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

# replace Ion chainparamsseeds.h
# Requirements:
#  - 1. RUN THIS SCRIPT FROM ION (Coins) ROOT FOLDER
#  - 2. File contrib/seeds/generate-seeds.py MUST BE PRESENT
#       Check requirements for usage of generate-seeds.py
#       for your operating system.

wget -O contrib/seeds/nodes_main.json https://chainz.cryptoid.info/ion/api.dws?q=nodes
awk -F ':[ \t]*' '/^.*"nodes"/ {print $5 $9 $13 $17 $21 $25 $29 $33 $37 $41}' contrib/seeds/nodes_main.json > contrib/seeds/nodes_main.txt
rm -f contrib/seeds/nodes_main.json
sed -i 's/,{\"subver\"/\\\n/g' contrib/seeds/nodes_main.txt
sed -i 's/\[\"//g' contrib/seeds/nodes_main.txt
sed -i 's/\",\"/:12700\\\n/g' contrib/seeds/nodes_main.txt
sed -i 's/\"]}]//g' contrib/seeds/nodes_main.txt
sed -i 's/\"]}/:12700/g' contrib/seeds/nodes_main.txt
sed -i 's/\\//g' contrib/seeds/nodes_main.txt
touch ./contrib/seeds/nodes_test.txt
tee ./contrib/seeds/nodes_test.txt <<EOF
185.107.224.197:39020
45.77.215.23:27170
51.15.95.171:27170
104.238.167.129:27170
108.61.132.189:27170
73.115.9.124:35142
149.28.101.87:37834
EOF

cd contrib/seeds
python3 generate-seeds.py . > ../../src/chainparamsseeds.h
rm -f ./nodes_main.txt
rm -f ./nodes_test.txt
cd ../..
cat < ./src/chainparamsseeds.h

