get_lan_ip() {
    all_nics="$(ip addr show | cut -d ' ' -f2 | tr -d :)"
    all_nics=(${all_nics[@]//lo/})	 # Remove lo interface.

    for nic in "${all_nics[@]}"; do
        # Parse IP address for the NIC.
        lan_ip="$(ip addr show ${nic} | grep '\<inet\>' | tr -s ' ' | cut -d ' ' -f3)"
        # Trim the CIDR suffix.
        lan_ip="${lan_ip%/*}"
        # Only display the last entry
        lan_ip="$(echo "$lan_ip" | tail -1)"

        [ -n "$lan_ip" ] && break
    done
	echo " ${lan_ip-N/a}"
}
get_lan_ip
