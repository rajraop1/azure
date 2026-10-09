FROM mcr.microsoft.com/azure-cli:latest
COPY task.sh /task.sh
RUN chmod +x /task.sh
ENTRYPOINT ["/bin/bash", "/task.sh"]
