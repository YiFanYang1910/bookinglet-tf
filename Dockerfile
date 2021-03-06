FROM node:12

WORKDIR /usr/src/app
#set working directory

COPY package*.json ./
#in current directory cp package.json to WORKDIR

RUN npm install 
RUN npm ci 
#run this command when docker build

COPY . .



EXPOSE 8000
#expose port 8000

CMD ["npm", "run", "dev"]
#run this command when docker run