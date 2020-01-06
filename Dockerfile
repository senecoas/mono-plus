FROM mono

# Buildroot packages
RUN apt-get update && apt-get install -y --no-install-recommends \
	apt-utils \
	zip \
	unzip \
	jq \
	python3 \
	python3-serial \
	ssh \
	sshpass

# Clean up
RUN apt-get clean

# Start a bash
CMD bash --login
