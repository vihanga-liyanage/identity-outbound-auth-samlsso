# Merge two keystores
	
	keytool -importkeystore -srckeystore mykeystore.jks -destkeystore client-truststore-2.jks -srcalias wso2am_keymanager -srcstorepass wso2carbon -deststorepass wso2carbon

# Generate a Java keystore and key pair
    
    keytool -genkey -alias mydomain -keyalg RSA -keystore keystore.jks -keysize 2048

# Generate a certificate signing request (CSR) for an existing Java keystore

    keytool -certreq -alias mydomain -keystore keystore.jks -file mydomain.csr
    
# Import a root or intermediate CA certificate to an existing Java keystore

    keytool -import -trustcacerts -alias root -file Thawte.crt -keystore keystore.jks
    
# Import a signed primary certificate to an existing Java keystore

    keytool -import -trustcacerts -alias mydomain -file mydomain.crt -keystore keystore.jks
    
# Generate a keystore and self-signed certificate (see How to Create a Self Signed Certificate using Java Keytoolfor more info)

    keytool -genkey -keyalg RSA -alias selfsigned -keystore keystore.jks -storepass password -validity 360 -keysize 2048

# Check a stand-alone certificate

    keytool -printcert -v -file mydomain.crt

# Check which certificates are in a Java keystore

    keytool -list -v -keystore keystore.jks

# Check a particular keystore entry using an alias

    keytool -list -v -keystore keystore.jks -alias mydomain

# Delete a certificate from a Java Keytool keystore

    keytool -delete -alias mydomain -keystore keystore.jks

# Change a Java keystore password

    keytool -storepasswd -new new_storepass -keystore keystore.jks

# Export a certificate from a keystore

    keytool -export -alias mydomain -file mydomain.crt -keystore keystore.jks

# List Trusted CA Certs

    keytool -list -v -keystore $JAVA_HOME/jre/lib/security/cacerts

# Import New CA into Trusted Certs

    keytool -import -trustcacerts -file /path/to/ca/ca.pem -alias CA_ALIAS -keystore $JAVA_HOME/jre/lib/security/cacerts

# Export certificate using openssl:
    openssl pkcs12 -in keystore.p12 -nokeys -out cert.pem

# Export unencrypted private key:
    openssl pkcs12 -in keystore.p12 -nodes -nocerts -out key.pem
