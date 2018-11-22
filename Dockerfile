FROM ubuntu:latest

WORKDIR /app
ADD ./backup.sh .

RUN apt-get update
RUN apt-get install cron

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/hello-cron
 
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/hello-cron
 
# Create the log file to be able to run tail
RUN touch /var/log/cron.log

ENTRYPOINT cron start && tail -f /var/log/cron.log