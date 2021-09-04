#!/bin/sh
mvn clean package && docker build -t com.alba.first_app.form/First_Web_App_Form .
docker rm -f First_Web_App_Form || true && docker run -d -p 9080:9080 -p 9443:9443 --name First_Web_App_Form com.alba.first_app.form/First_Web_App_Form