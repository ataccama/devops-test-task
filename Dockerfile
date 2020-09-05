From golang:1.12
Maintainer Jaroslav Alekseev

# Set ENV
#ENV GIT_DIR=https://github.com/ustas33/devops-test-task
#ENV SRC_DIR=/app
ENV ERVCP_PORT=8080
ENV ERVCP_DB_HOST=devops-test-redis.zzjowp.0001.euw3.cache.amazonaws.com
ENV ERVCP_DB_PORT=6379
ENV ERVCP_DB_PW=

# Copy repo
RUN apt update && apt install -y git
RUN git clone https://github.com/ustas33/devops-test-task /git

# Workdir for ENTRYPOINT
WORKDIR /git/app

# Build
RUN cd /git/app; go build;

#Listen port 8080
EXPOSE 8080

#Run the ERVCP binary
ENTRYPOINT ["./ervcp"]
#CMD ["/bin/bash"]
