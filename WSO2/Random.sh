# Enable GC Logs in WSO2 server
#==============================================================================================================
	# Open wso2server.sh file and add following under $JVM_MEM_OPTS \
	    -XX:+PrintGC \
	    -XX:+PrintGCDetails \
	    -XX:+PrintGCDateStamps \
	    -Xloggc:"$CARBON_HOME/repository/logs/gc.log" \


# Kill all wso2 servers
#==============================================================================================================
	kill $(ps aux | grep wso2 | grep -v 'grep' | awk '{print $2}')


# Gen code skeleton from swagger
#==============================================================================================================
    mvn swagger2cxf:generate


# Debugging Tomcat web app
#==============================================================================================================
	# Open catelina.sh file and add below line after "#JAVA_OPTS..."
	    JAVA_OPTS="$JAVA_OPTS -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8000"
	# Restart tomcat server
	    sudo service tomcat7 restart
	# Open idea and setup remote debug configuration with port 8000.


# Remove broken SAML registry entries
#==============================================================================================================
	# Go to Home > Registry > Browse
	# Search for /_system/config/repository/identity/SAMLSSO/
	# Find correct element and delete.


# Runing intgration tests on external server
#==============================================================================================================
	# Open ../product-is/modules/integration/tests-integration/tests-backend/src/test/resources/automation.xml file.
	# Comment the line "<name>org.wso2.identity.integration.common.extension.server.IdentityServerExtension</name>"
	# Start a new IS instance with port offset set to 410
		./bin/wso2server.sh -DportOffset=410
	# Run tests.

# Start server with SSL logs enables
#==============================================================================================================
	./bin/wso2server.sh -Djavax.net.debug=ssl,handshake

# Turn off CSRF check
#==============================================================================================================
	# Open file repository/conf/security/Owasp.CsrfGuard.Carbon.properties
	subl repository/conf/security/Owasp.CsrfGuard.Carbon.properties
	# Cahnge the property org.owasp.csrfguard.Enabled to false.
	