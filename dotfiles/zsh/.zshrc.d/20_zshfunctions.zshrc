fixyubikey() {
    # from /Applications/yubikonf.app/Contents/Resources/scripts/ssh-add-piv-agent
    pushd "/Applications/yubikonf.app/Contents/Resources/scripts"

    [ -f yubikonf-vars ] && source yubikonf-vars || (popd && exit 1)
    [ ! -f "$LIBPKCS11" ] && >&2 echo "Can't find '$LIBPKCS11'. Make sure Yubikey Manager is installed." && popd && exit 1
    [ ! -f "$GET_PIV_PIN_SCRIPT" ] && >&2 echo "Can't find '$GET_PIV_PIN_SCRIPT'." && popd && exit 1
    "$BIN_SSH_ADD" -e "$LIBPKCS11"

    GET_PIN=$("$GET_PIV_PIN_SCRIPT")

    if [ "${#GET_PIN}" -lt $MIN_PIN_LEN ] || [ "${#GET_PIN}" -gt $MAX_PIN_LEN ]; then
        popd
    	exit 1
    fi

    SSH_ASKPASS_REQUIRE=force SSH_ASKPASS="$GET_PIV_PIN_SCRIPT" "$BIN_SSH_ADD" -s "$LIBPKCS11"

    popd
}
