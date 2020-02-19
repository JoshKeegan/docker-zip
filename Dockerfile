FROM mcr.microsoft.com/dotnet/core/sdk:3.1.102-buster

RUN apt-get update && \
	apt-get install -y make && \
	# Clean up apt lists & temp dir to not bloat the layer
	rm -rf /var/lib/apt/lists/* /tmp/*
