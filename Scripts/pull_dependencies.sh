#!/bin/bash

set -e

git subtree pull --prefix Sources/OpenVPN3 git@github.com:OpenVPN/openvpn3.git --squash

git subtree pull --prefix Sources/ASIO git@github.com:chriskohlhoff/asio.git --squash
git subtree pull --prefix Sources/LZ4 git@github.com:lz4/lz4.git --squash
git subtree pull --prefix Sources/mbedTLS git@github.com:ARMmbed/mbedtls.git --squash
