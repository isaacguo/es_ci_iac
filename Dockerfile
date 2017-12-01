FROM jenkins:latest
MAINTAINER Isaac Guo <yue_guo@keysight.com>

ENV JENKINS_USER admin
ENV JENKINS_PASS admin


USER root

# Install Jenkins Plugins
RUN /usr/local/bin/install-plugins.sh \
      bitbucket:1.1.6 \
      workflow-aggregator:2.4 \
      docker-workflow:1.8 \
      artifactory:2.13.0  \
      msbuild:1.28 \
      slack:2.3 \
      copyartifact:1.38.1 \
      kubernetes


# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false


COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/



RUN git config --global user.email "yue_guo@keysight.com" && \
    git config --global user.name "Isaac Guo"



