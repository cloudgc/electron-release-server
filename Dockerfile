FROM node

RUN wget https://codeload.github.com/cloudgc/electron-release-server/tar.gz/1.4.3-fix -O electron.tar

RUN mkdir /electron-config

RUN echo '{"allow_root": true }' > ~/.bowerrc

RUN tar -xvf electron.tar

WORKDIR /electron-release-server-1.4.3-fix

RUN npm install  &&  npm run postinstall --allow-root

RUN ln -s  /electron-config/local.js  /electron-release-server-1.4.3-fix/config/local.js


CMD [ "npm", "start" ]
