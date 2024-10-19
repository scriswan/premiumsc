###/bin/bash

# Function to convert bytes to human-readable format
function con() {
    local -i bytes=$1
    if (( bytes < 1024 )); then
        echo "${bytes}B"
    elif (( bytes < 1048576 )); then
        echo "$(( (bytes + 1023) / 1024 ))KB"
    elif (( bytes < 1073741824 )); then
        echo "$(( (bytes + 1048575) / 1048576 ))MB"
    else
        echo "$(( (bytes + 1073741823) / 1073741824 ))GB"
    fi
}

# Clear the screen
clear

# Clear the temporary file
> /tmp/other.txt

# Extract user accounts from the config file
data=($(grep -E "^###" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort -u))

# Loop through each user account
for user in "${data[@]}"; do
    if [[ -z "$user" ]]; then
        continue  # Skip if no account found
    fi

    # Clear temporary file for IPs
    > /tmp/ipvmess.txt

    # Extract IP addresses from logs
    data2=($(grep -w "$user" /var/log/xray/access.log | tail -n 500 | awk '{print $3}' | sed 's/tcp://g' | cut -d ":" -f 1 | sort -u))

    # Loop through IPs and process them
    for ip in "${data2[@]}"; do
        if grep -qw "$ip" /var/log/xray/access.log; then
            echo "$ip" >> /tmp/ipvmess.txt
        else
            echo "$ip" >> /tmp/other.txt
        fi
    done

    # Check if the user has any associated IPs
    if [[ -s /tmp/ipvmess.txt ]]; then
        # Print the user's IP information
        lastlogin=$(journalctl -u xray --no-pager | grep -w "$user" | tail -n 1 | awk '{print $1, $2}')
        # Fallback to access log if journalctl not available
        if [ -z "$lastlogin" ]; then
            lastlogin=$(grep -w "$user" /var/log/xray/access.log | tail -n 1 | awk '{print $2}')
        fi

        # Read the IP limit for the user with a fallback in case the file is missing or empty
        iplimit="No limit"  # Default value if file doesn't exist or is empty
        if [[ -f "/etc/kyt/limit/vmess/ip/${user}" ]]; then
            iplimit=$(cat /etc/kyt/limit/vmess/ip/${user})
            # Handle case where file is empty
            if [[ -z "$iplimit" ]]; then
                iplimit="No limit"
            fi
        fi

        # Count the number of logged in IPs
        jum2=$(wc -l < /tmp/ipvmess.txt)

        # Read the byte usage for the user
        if [[ -f "/etc/vmess/${user}" ]]; then
            byte=$(cat /etc/vmess/${user})
        else
            byte=0
        fi

        # Convert byte usage to human-readable format
        lim=$(con ${byte})

        # Read the quota limit for the user and convert to human-readable format
        if [[ -f "/etc/limit/vmess/${user}" ]]; then
            wey=$(cat /etc/limit/vmess/${user})
        else
            wey=0
        fi
        gb=$(con ${wey})

        # Display information for the user
        echo "User: ${user}"
        echo "Online Time: ${lastlogin}"
        echo "Limit Quota: ${lim}"
        echo "Usage Quota: ${gb}"
        echo "Limit IP: $iplimit"
        echo "Login IP Count: $jum2"
      
        nl /tmp/ipvmess.txt  # Display IP list with line numbers
        echo ""
    fi
done

# Clean up temporary files
rm -f /tmp/other.txt /tmp/ipvmess.txt
