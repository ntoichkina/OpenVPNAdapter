# Updating OpenVPN3 or dependencies

## Run pull_dependencies script

1. Change `OPENVPN3_VERSION` in `pull_dependencies.sh` to desired commit/tag
2. From the root of repository, run `$ ./Scripts/pull_dependencies.sh`
3. Script will pull both OpenVPN3 code and its subdependencies via Git Subtree. Versions of subdependencies are specified inside OpenVPN3 library and cannot be changed.

## Apply fixes to OpenVPN3 code manually

Manual code editing is required until better solution is found.

### Set proper TUN Builder options for mac (Fixes tun persist bug, when reconnect to server after reachability change fails):

- Open `Sources/OpenVPN3/openvpn/client/cliopt.hpp`
- Find the following region:

```cpp
#if defined(OPENVPN_PLATFORM_IPHONE)
                tunconf->retain_sd = true;
                tunconf->tun_prefix = true;
                if (config.tun_persist)
                    tunconf->tun_prop.remote_bypass = true;
```

- Replace it with:

```cpp
#if (defined(OPENVPN_PLATFORM_IPHONE) || defined(OPENVPN_PLATFORM_MAC))
                tunconf->retain_sd = true;
                tunconf->tun_prefix = true;
                if (config.tun_persist)
                    tunconf->tun_prop.remote_bypass = true;
```

- Comment out separate region with tun setting for mac:

```cpp
// #if defined(OPENVPN_PLATFORM_MAC)
//                tunconf->tun_prefix = true;
```

This will unify TUN Builder configuration process for iOS and Mac.
