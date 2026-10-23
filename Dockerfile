FROM jenkins/jenkins:lts-jdk17

USER root
# Optional: install tools your pipeline needs (git is already included)
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

USER jenkins

# Skip the manual setup wizard plugins screen; install common plugins
RUN jenkins-plugin-cli --plugins \
    git \
    github \
    workflow-aggregator \
    credentials-binding

EXPOSE 8080