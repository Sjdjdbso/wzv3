FROM mysterysd/wzmlx:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

COPY requirements.txt .
RUN pip3 install --upgrade setuptools wheel

# Mencegah fetcher lawas menarik versi setuptools-scm yang merusak build
RUN pip3 install "setuptools-scm<10"

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
