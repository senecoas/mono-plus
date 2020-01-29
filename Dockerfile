FROM mono
FROM python:3

# ODBC packages for debian 10
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
	curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list

RUN apt update && ACCEPT_EULA=Y apt install -y --no-install-recommends \
	apt-utils \
	zip \
	jq \
	ssh \
	sshpass \
	msodbcsql17 \
	mssql-tools \
	unixodbc-dev \
	libgssapi-krb5-2

# ODBC driver setup
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile && \
	echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc && \
	/bin/bash -c "source ~/.bashrc"

RUN pip3 install \
	pyserial \
	pyodbc

# Clean up
RUN apt-get clean

# Start a bash
CMD bash --login
