# docker build -t vkonst/gnosis-multisig:v0.0.5 ./
FROM node:alpine

WORKDIR /usr/local/app
RUN echo '{"name": "multisig-ui", "dependencies": { "http-server": "^0.11.1" }}' > package.jspn && npm install

COPY ./start.sh .
COPY ./src ./src

EXPOSE 5000

ENTRYPOINT ["/bin/sh"]
CMD ["start.sh"]
