### Do This stuff first 
# cp -rp ~/.composer .
# chmod -R a+rw .composer
# find .composer -type d -exec chmod a+x {} +
### (https://www.codementor.io/gangachris125/passport-jwt-authentication-for-hyperledger-composer-rest-server-jqfgkoljn)

FROM hyperledger/composer-rest-server:0.20.7

RUN npm install --production loopback-connector-mongodb passport-google-oauth2 && \
npm cache clean --force && \
ln -s node_modules .node_modules

COPY .composer /home/composer/.composer

# 1) docker build -t localhost/composer-rest-server .
# 2) docker run -d --name mongo --network composer_default -p 27017:27017 mongo
# 3) source envvars.txt (Read Tutorial again)
# 4) docker run \
#    -d \
#    -e COMPOSER_CARD=${COMPOSER_CARD} \
#    -e COMPOSER_NAMESPACES=${COMPOSER_NAMESPACES} \
#    -e COMPOSER_AUTHENTICATION=${COMPOSER_AUTHENTICATION} \
#    -e COMPOSER_MULTIUSER=${COMPOSER_MULTIUSER} \
#    -e COMPOSER_PROVIDERS="${COMPOSER_PROVIDERS}" \
#    -e COMPOSER_DATASOURCES="${COMPOSER_DATASOURCES}" \
#    --name rest \
#    --network composer_default \
#    -p 3000:3000 \
#    localhost/composer-rest-server