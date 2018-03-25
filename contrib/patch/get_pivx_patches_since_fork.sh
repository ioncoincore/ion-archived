# get all ion patches since for
cd ../../
git format-patch -n c31696696b7889906eda534d2db534f54dc3ac0d
cd ..

# get pivx sources
git clone https://github.com/PIVX-Project/PIVX.git
# git clone git@github.com:PIVX-Project/PIVX.git 

# get all patches from master since fork
cd ./PIVX
# get pivx patches since fork
git format-patch -n fbb105a00a5dc46dba8b077484f56940e4201e2d


