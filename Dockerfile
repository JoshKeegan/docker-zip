FROM mcr.microsoft.com/dotnet/core/sdk:2.2.300-stretch

RUN apt-get update && \
	apt-get install -y make && \
	# Clean up apt lists & temp dir to not bloat the layer
	rm -rf /var/lib/apt/lists/* /tmp/*