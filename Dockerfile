FROM node:buster

# Install shairport-sync
RUN apt update
RUN apt install -y shairport-sync
RUN rm -r /var/lib/apt/lists/*

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY shairport-sync-radio/package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY shairport-sync-radio/*.js ./
COPY shairport-sync-radio/shairport-sync.conf ./

COPY start.sh /
RUN chmod 744 /start.sh

EXPOSE 8080
ENTRYPOINT [ "/start.sh" ]
