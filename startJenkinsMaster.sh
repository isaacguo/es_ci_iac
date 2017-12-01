#!/bin/sh
docker run -d -p 8080:8080 -p 50000:50000 -v /home/ec2-user/jenkins_home:/var/jenkins_home isaacguo/jenkins:latest
