sudo chown clerezza:clerezza /home/clerezza/workspace
if [ ! -d /home/clerezza/workspace/keystore ]; then
  keytool -genkey -keyalg RSA -alias "selfsigned" -keystore /home/clerezza/workspace/keystore -keypass password -validity 360 -storepass password -dname "CN=localhost,OU=ME,O=ME,L=Dhere,S=MyPlace,C=ME"
fi
cd /home/clerezza/workspace
java -XX:MaxPermSize=400m -Xss512k -Xmx1g -jar ../platform.launcher.tdb-0.5-incubating.jar -NCS --https_keystore_clientauth want --https_keystore_path keystore

