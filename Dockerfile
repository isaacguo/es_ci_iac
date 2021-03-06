FROM jenkins:latest

MAINTAINER Isaac Guo <yue_guo@keysight.com>


USER root

COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy


# Install Jenkins Plugins
RUN /usr/local/bin/install-plugins.sh \
      bitbucket \
      workflow-aggregator \
      docker-workflow \
      artifactory \
      msbuild \
      slack \
      copyartifact \
      kubernetes \
      jobConfigHistory \
      build-timeout \
      disk-usage \
      email-ext \
      parameterized-trigger \
      jira \
      sonar \
      ec2 \
      build-monitor-plugin \
      blueocean \
      github
      
      


# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false




RUN git config --global user.email "yue_guo@keysight.com" && \
    git config --global user.name "Isaac Guo"



