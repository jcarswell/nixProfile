export LANG=$(locale -uU)
if [ -n "${BASH_VERSION}" ]; then
  if [ -z "${JPRO}" ]; then
    if [ -f "${HOME}/.bashrc" ]; then
      source "${HOME}/.bashrc"
    fi
  fi
fi
