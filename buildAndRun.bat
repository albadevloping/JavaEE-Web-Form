@echo off
call mvn clean package
call docker build -t com.alba.first_app.form/First_Web_App_Form .
call docker rm -f First_Web_App_Form
call docker run -d -p 9080:9080 -p 9443:9443 --name First_Web_App_Form com.alba.first_app.form/First_Web_App_Form