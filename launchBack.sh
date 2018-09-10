#!/bin/bash

VERSION=$(cat pom.xml | grep '<version>[0-9.]\+' | sed 's/<version>\([0-9.]\+\)<\/version>/\1/g' | tr -d '[:space:]')
CLASSPATH=$(find datashare-dist/target/datashare-dist-${VERSION}-all/lib/ -name '*.jar' | sort | xargs | sed 's/ /:/g')

mkdir -p dist

java -agentlib:jdwp=transport=dt_socket,server=y,address=8000,suspend=n -Djavax.net.ssl.trustStorePassword=changeit -Xmx4g -DPROD_MODE=true -cp "dist/:${CLASSPATH}" org.icij.datashare.cli.DatashareCli --cors '*' --oauthAuthorizeUrl http://xemx:3001/oauth/authorize --oauthTokenUrl http://xemx:3001/oauth/token --oauthApiUrl http://xemx:3001/api/v1/me.json "$@"
