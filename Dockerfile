FROM node:buster

# Install shairport-sync and ffmpeg
RUN apt update
RUN apt install -y shairport-sync
RUN apt install -y ffmpeg
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
COPY shairport-sync-radio/*.js .
COPY shairport-sync-radio/*.conf .
COPY start.sh .

RUN chmod 744 start.sh

EXPOSE 8080
ENTRYPOINT [ "./start.sh" ]
