FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl unzip libcurl4 && \
    apt-get clean

# Set working directory
WORKDIR /bedrock

# Download Bedrock Dedicated Server
COPY . .

RUN unzip bedrock-server* && \
    rm bedrock-server* && \
    chmod +x bedrock_server

# Accept EULA
RUN echo "eula=true" > eula.txt

# Expose default MCPE port
EXPOSE 62025/udp

# Start server
CMD ["./bedrock_server"]
