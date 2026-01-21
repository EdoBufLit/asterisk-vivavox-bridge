[transport-udp]
type=transport
protocol=udp
bind=0.0.0.0

[vivavox-auth]
type=auth
auth_type=userpass
username=__VIVAVOX_NUMBER__
password=__VIVAVOX_PASSWORD__

[vivavox-aor]
type=aor
max_contacts=1

[vivavox-endpoint]
type=endpoint
transport=transport-udp
context=from-vivavox
disallow=all
allow=alaw
allow=ulaw
aors=vivavox-aor
outbound_auth=vivavox-auth
from_domain=sip.vivavox.it
from_user=__VIVAVOX_NUMBER__
contact_user=__VIVAVOX_NUMBER__
direct_media=no
rtp_symmetric=yes
force_rport=yes
rewrite_contact=yes

[vivavox-registration]
type=registration
transport=transport-udp
outbound_auth=vivavox-auth
server_uri=sip:sip.vivavox.it
client_uri=sip:__VIVAVOX_NUMBER__@sip.vivavox.it
contact_user=__VIVAVOX_NUMBER__
expiration=120
retry_interval=60

