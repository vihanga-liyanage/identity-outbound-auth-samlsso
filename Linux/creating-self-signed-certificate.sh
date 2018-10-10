# The below command will create a file named 'server.pass.key' and place it in the same folder where the command is executed. 
openssl genrsa -des3 -passout pass:x -out server.pass.key 2048

# The below command will use the 'server.pass.key' file that just generated and create 'server.key'.
openssl rsa -passin pass:x -in server.pass.key -out server.key

# We no longer need the 'server.pass.key'
rm server.pass.key

# The below command will ask you for information that would be included in the certificate. Since this is a self-signed certificate, there is no need to provide the 'challenge password' (to leave it blank, press enter).
openssl req -new -key server.key -out server.csr

# You will be asked for additional details. Fill them and press enter.

# Generate a file named v3.ext with the below-listed contents:
subl v3.ext

	authorityKeyIdentifier=keyid,issuer
	basicConstraints=CA:FALSE
	keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
	subjectAltName = @alt_names
	[alt_names]
	DNS.1 = <specify-the-same-common-name-that-you-used-while-generating-csr-in-the-last-step>

openssl x509 -req -sha256 -extfile v3.ext -days 365 -in server.csr -signkey server.key -out server.crt

openssl pkcs12 -export -name servercert -in server.crt -inkey server.key -out myp12keystore.p12

keytool -importkeystore -destkeystore mykeystore.jks -srckeystore myp12keystore.p12 -srcstoretype pkcs12 -alias servercert
