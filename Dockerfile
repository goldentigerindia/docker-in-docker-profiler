FROM goldentigerindia/docker-in-docker:release
USER root
#Environment Variables
ARG ENVIRONMENT_NAME
ENV ENVIRONMENT_NAME=$ENVIRONMENT_NAME
ARG BUILD_BRANCH
ENV BUILD_BRANCH=$BUILD_BRANCH
#Install
COPY root/scripts/start.sh /app/start.sh
COPY root/scripts/install_env.sh /root/.scripts/install_env.sh
RUN chmod 777 -R /app/start.sh
RUN chmod 777 -R /root/.scripts/install_env.sh
#Initilize the Environment variables to overwrite the base images variables
RUN /root/.scripts/install_env.sh
WORKDIR /root/go/src/github.com/goldentigerindia
#Clone and Build the app
RUN git clone --branch ${BUILD_BRANCH} https://goldentigerindia:49d7fc92bfec7278352d6c2626df89621df929b6@github.com/goldentigerindia/profiling-agent.git
RUN cd /root/go/src/github.com/goldentigerindia/profiling-agent && go build -mod=vendor -o /app/profiling-agent .
WORKDIR /app
ENTRYPOINT ["/app/start.sh"]
EXPOSE 8080
