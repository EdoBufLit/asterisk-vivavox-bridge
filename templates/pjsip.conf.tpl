[transport-udp]
type=transport
protocol=udp
bind=0.0.0.0

; ===== VivaVox Auth =====
[vivavox-auth]
type=auth
auth_type=userpass
username=__VIVAVOX_NUMBER__
password=__VIVAVOX_PASSWORD__

; ===== VivaVox AOR (dove contattare il provider) =====
[vivavox-aor]
type=aor
contact=sip:sip.vivavox.it

; ===== Endpoint VivaVox (chiamate in ingresso dal provider) =====
[vivavox-endpoint]
ice_support=no
rtcp_mux=no
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
rtp_symmetric=yes
force_rport=yes
rewrite_contact=yes
direct_media=no

; ===== Registrazione verso VivaVox (OUTBOUND) =====
[vivavox-registration]
type=registration
transport=transport-udp
outbound_auth=vivavox-auth
server_uri=sip:sip.vivavox.it
client_uri=sip:__VIVAVOX_NUMBER__@sip.vivavox.it
retry_interval=60
forbidden_retry_interval=300
expiration=120
