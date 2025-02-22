Bootstrap

- Install aws cli and configure secret_key and access_key
- Install Python and ansible
- Install Boto3 and boto Python packages
- Install Firefox, create a new profile (openlab)
    /Applications/Firefox.app/Contents/MacOS/firefox -CreateProfile openlab
- Configure "openlab" profile
    - launch and stop firefox with that profile
        /Applications/Firefox.app/Contents/MacOS/firefox -P openlab
    - add the following lines in "/Users/${USER}/Library/Application\ Support/Firefox/Profiles/*.openlab/prefs.js"
        user_pref("network.proxy.socks", "localhost");
        user_pref("network.proxy.socks_port", 8157);
        user_pref("network.proxy.socks_remote_dns", true);
        user_pref("network.proxy.type", 1);
- Install certutil and add it into the path
    brew install nss

To execute at the end of Ansible

# convert cacert.p12 into cacert.pem
openssl pkcs12 -in /tmp/cacert.p12 -out /tmp/cacert.pem -clcerts -nokeys -passin 'pass:FreeIPAServer@3498'

# replace * by its value
certDir="/Users/${USER}/Library/Application\ Support/Firefox/Profiles/*.openlab"
certificateFile="/tmp/cacert.pem"
certificateName="OpenLab"

# log "mozilla certificate" "install '${certificateName}' in ${certDir}"
certutil -A -n "${certificateName}" -t "TCu,Cuw,Tuw" -i ${certificateFile} -d sql:${certDir}

# list installed certificates
certutil -L -d ${certDir}

# start the ssh SOCKS tunnel
ssh -o StrictHostKeyChecking=no -o ForwardAgent=yes  -N -D 8157 ec2-user@"{{ hostvars['localhost']['bastion'].instances[0].public_ip_address }}"

# launch firefox with "openlab" profile
/Applications/Firefox.app/Contents/MacOS/firefox -P openlab



Jenkins configuration

setsebool -P httpd_can_network_relay 1 -P


eval $(ssh-agent -s)
ssh-add /Users/stephanenangue/Downloads/bastion_aws_key_pair.pem

ipa-getcert request -K host/metric.openlab.net -k /etc/pki/tls/private/metric.openlab.net.key -f /etc/pki/tls/certs/metric.openlab.net.crt -D metric.openlab.net -D influxdb.openlab.net  -N metric.openlab.net

SELECT timestamp as time, log.request.operation as operation, count() as c FROM "vault"."auditlogs" WHERE ( time >= $__fromTime AND time <= $__toTime and log.type == 'response' ) GROUP BY time, operation ORDER BY time ASC LIMIT 1000


ansible-playbook infra_provision.yml -e '{"erase_vaultseal_data": true}'

ansible-playbook infra_provision.yml -e '{"erase_vaultseal_data": true}' --tags inventory,metric

Jenkins credentials : devops/devops

