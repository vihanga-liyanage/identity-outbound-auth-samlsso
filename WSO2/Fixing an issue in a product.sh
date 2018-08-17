# Fork repository and clone

# Setting up git env (pull from WSO2 repo, push to your fork)
	git remote -v
	# origin  https://github.com/vihanga-liyanage/carbon-identity-framework.git (fetch)
	# origin  https://github.com/vihanga-liyanage/carbon-identity-framework.git (push)
	git remote set-url origin  https://github.com/wso2/carbon-identity-framework.git
	git remote -v
	# origin  https://github.com/wso2/carbon-identity-framework.git (fetch)
	# origin  https://github.com/wso2/carbon-identity-framework.git (push)
	git remote set-url --push origin https://github.com/vihanga-liyanage/carbon-identity-framework.git
	git remote -v
	# origin  https://github.com/wso2/carbon-identity-framework.git (fetch)
	# origin  https://github.com/vihanga-liyanage/carbon-identity-framework.git (push)
	git pull

	# Make a branch for the issue
		git checkout -b issue-2233

# Open via terminal and run 
	mvn clean install
# Open in idea
# Make a change and run 
	mvn clean install
# Copy the SNAPSHOT version

# Clone the product repository.
	git clone https://github.com/wso2/product-is
# Open main pom.xml, find the entry related to your changin module, replace the version with copied snapshot verison 
# Open in terminal and run below to build the product without running tests.
	mvn clean install -Dmaven.test.skip=true

# Product will be build in <product-dir>/modules/distribution/target/
# unzip it and run

# To run the server with a different ports
	./wso2server.sh -DportOffset=1

# After the first build you can add patches 
	# Make your change
	# Go to the module directory from terminal and run 
		mvn clean install
	# Go to target and copy the jar file
	# Go to the built product directory which you ran ealier
	# Go to repository/components/patches
	# Make a directory as patch9999, paste the jar into that
	# Restart the server. Log should say 
		INFO {org.wso2.carbon.server.extensions.PatchInstaller} -  Patch changes detected

	# To undo the patch, just delete patch9999 folder and restart the server (should keep the patch000 folder as it is)

# To debug changes
	# Run server in debug mode
		./wso2server.sh -debug 5005
	# Server will wait for a debug listner. Now go to idea, 
	# Run -> Edit Configurations... + Icon -> Remote (add a new remote debug instant with port 5005)
	# Save and start debugging. Server will start once debugging started.

# To debug maven build
	mvn clean install -Dmaven.surefire.debug

# Making the PR
	# Commit the changes mentioning the issue
		git commit -m "Fix issue 2233: Claims sorted in the Mapped Local Claim dropdown in Add External Claim menu"
		git pull
		git push origin issue-2233

	# Go to the wso2 repo and make the PR. Fill in neccessary info as applicable.

# Making Stub changes in identity-inbound-auth-oauth
	# make changes to OAuthConsumerAppDTO
	# build and patch org.wso2.carbon.identity.oauth
	# goto carbon.xml file and change HideAdminServiceWSDLs to false.
	# Run the pack and goto https://localhost:9443/services/OAuthAdminService?wsdl
	# copy paste the wsdl to OAuthAdminService.wsdl in org.wso2.carbon.identity.oauth.stub
	# build the stub and your methods will be available.

# Issues with building product
	# java.net.ConnectException: Connection refused (Connection refused)
		ps -ef | grep wso2
	# find the pids and kill them
		kill -9 18175

# Clean repo build
	mvn -Dmaven.repo.local=/home/vihanga/Desktop/m2 clean install

# Run only tests with maven
	mvn surefire:test
