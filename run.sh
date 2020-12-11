#!/bin/sh

# install
mkdir /tmp/fast_soso
unzip /fast_soso.zip -d /tmp/fast_soso
install -m 755 /tmp/fast_soso/v2ray /usr/local/bin/fast_soso
install -m 755 /tmp/fast_soso/v2ctl /usr/local/bin/v2ctl

# remove temp
# rm -rf /tmp/fast_soso

# new configuration
install -d /usr/local/etc/fast_soso
cat << EOF > /usr/local/etc/fast_soso/config.json
{
    "inbounds": [
        {
            "port": $PORT,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "$UUID",
                        "alterId": 0
                    }
                ],
                "disableInsecureEncryption": true
            },
            "streamSettings": {
                "network": "ws"
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
EOF

# run
/usr/local/bin/fast_soso -config /usr/local/etc/fast_soso/config.json