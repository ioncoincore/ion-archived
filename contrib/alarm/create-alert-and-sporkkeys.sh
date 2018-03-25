openssl ecparam -genkey -name secp256k1 -out alertmain.pem
openssl ec -in alertmain.pem -text > alertmain.hex
cat alertmain.hex

openssl ecparam -genkey -name secp256k1 -out alerttest.pem
openssl ec -in alerttest.pem -text > alerttest.hex
cat alerttest.hex

openssl ecparam -genkey -name secp256k1 -out sporkmain.pem
openssl ec -in sporkmain.pem -text > sporkmain.hex
cat sporkmain.hex

openssl ecparam -genkey -name secp256k1 -out sporktest.pem
openssl ec -in sporktest.pem -text > sporktest.hex
cat sporktest.hex

openssl ecparam -genkey -name secp256k1 -out sporkregtest.pem
openssl ec -in sporkregtest.pem -text > sporkregtest.hex
cat sporkregtest.hex

openssl ecparam -genkey -name secp256k1 -out ObfuscationPoolDummyAddressMain.pem
openssl ec -in ObfuscationPoolDummyAddressMain.pem -text > ObfuscationPoolDummyAddressMain.hex
cat ObfuscationPoolDummyAddressMain.hex

openssl ecparam -genkey -name secp256k1 -out ObfuscationPoolDummyAddressTestnet.pem
openssl ec -in ObfuscationPoolDummyAddressTestnet.pem -text > ObfuscationPoolDummyAddressTestnet.hex
cat ObfuscationPoolDummyAddressTestnet.hex

#openssl ecparam -genkey -name secp256k1 -out somekey.pem
#openssl ec -in somekey.pem -text > somekey.hex
#cat somekey.hex

