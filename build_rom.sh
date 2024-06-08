#!/bin/bash

#set -e

blue='\033[0;34m'
cyan='\033[0;36m'
yellow='\033[0;33m'
nocol='\033[0m'

echo -e "$yellow************* Getting Started *************"
echo -e "$blue***********************************************"
echo -e "         Building Using Crave Run command           "
echo -e "$cyan***********************************************$nocol"

crave clone destroy -y /crave-devspaces/RR

crave clone create --projectID 73 /crave-devspaces/RR

cd /crave-devspaces/RR

# Sync and build
crave run --no-patch -- "rm -rf .repo/local_manifests/; \
repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b Q; \
git clone https://github.com/strongreasons/local_manifest.git -b rr .repo/local_manifests; \
/opt/crave/resync.sh; \
. build/envsetup.sh; \
lunch rr_X00TD-userdebug; \
export TZ=Asia/Jakarta; \
mka bacon"; \
