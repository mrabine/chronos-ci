#!/bin/bash

CHRONOS_USER="${CHRONOS_USER:-chronos}"
CHRONOS_UID="${CHRONOS_UID:-1001}"
CHRONOS_GID="${CHRONOS_GID:-1001}"

userdel -r ubuntu 2>/dev/null || true
groupdel ubuntu 2>/dev/null || true

groupadd -g "${CHRONOS_GID}" "${CHRONOS_USER}"
useradd -m -u "${CHRONOS_UID}" -g "${CHRONOS_GID}" -s /bin/bash "${CHRONOS_USER}"

usermod -aG sudo "${CHRONOS_USER}"
echo "${CHRONOS_USER} ALL=(ALL) NOPASSWD:ALL" > "/etc/sudoers.d/${CHRONOS_USER}"
chmod 0440 "/etc/sudoers.d/${CHRONOS_USER}"
visudo -cf "/etc/sudoers.d/${CHRONOS_USER}"

git config --system --add safe.directory '*'
