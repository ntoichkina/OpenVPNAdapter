#!/bin/bash

set -e

OPENVPN3_VERSION="master"
# currently using openvpn3 commit hash a8729663

git subtree pull --prefix Sources/OpenVPN3 git@github.com:OpenVPN/openvpn3.git ${OPENVPN3_VERSION} --squash -m "update OpenVPN3"

source Sources/OpenVPN3/deps/lib-versions

git subtree pull --prefix Sources/ASIO git@github.com:chriskohlhoff/asio.git ${ASIO_VERSION} --squash -m "update ASIO"
git subtree pull --prefix Sources/LZ4 git@github.com:lz4/lz4.git ${LZ4_VERSION/lz4-/v} --squash -m "update LZ4"
git subtree pull --prefix Sources/mbedTLS git@github.com:ARMmbed/mbedtls.git ${MBEDTLS_VERSION} --squash -m "update mbedTLS"
