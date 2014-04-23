# Incisively Base Image

The base image provides a predictable foundation for all Incisively containers.

`unattended-upgrades` is enabled so that security updates are applied during
build.

`/var/log` is exposed, enabling you to inspect logs by mounting on the host
filesystem using the `-v` switch at runtime, or alternatively mounting in
another container using the `--volumes-from` switch.
