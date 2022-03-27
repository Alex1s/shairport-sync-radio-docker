FROM node:buster

# install ffmpeg
RUN apt update
RUN apt install -y ffmpeg
RUN rm /var/lib/apt/lists/*

CMD [ "sleep", "9999999" ]
