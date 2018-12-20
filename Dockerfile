FROM node

RUN wget https://codeload.github.com/ArekSredzki/electron-release-server/tar.gz/v1.4.3 -O electron.tar

RUN mkdir /electron-config

RUN echo '{"allow_root": true }' > ~/.bowerrc

RUN tar -xvf electron.tar && cd ./electron-release-server-1.4.3  && npm install  &&  npm run postinstall --allow-root

RUN ln -s  /electron-config/local.js  /electron-release-server-1.4.3/config/local.js

WORKDIR /electron-release-server-1.4.3

CMD [ "npm", "start" ]
