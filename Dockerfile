FROM ubuntu:14.04
MAINTAINER dooros@posgrado.upv.es
# Define a volume for the database
VOLUME ["/data/db"]
# Install MongoDB
RUN \
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 && \
	sudo echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list && \
	sudo apt-get update && \
	sudo apt-get install -y mongodb-org
RUN apt-get update
# Install Node.js
RUN apt-get install --yes curl
RUN curl --silent --location https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN apt-get install --yes nodejs
# run service of mongodb
CMD ["mongod"]
