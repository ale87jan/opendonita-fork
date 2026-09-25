ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base
FROM $BUILD_FROM

# Install requirements for add-on
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 py3-pip py3-pillow py3-netifaces gcc python3-dev libc-dev \
    zlib-dev libjpeg-turbo-dev linux-headers && ln -sf python3 /usr/bin/python
RUN python3 -m pip install --break-system-packages --no-deps ssdp==1.1.1 iot-upnp==1.0.3

WORKDIR /app
COPY init.py .
COPY congaserver.py .
COPY congaModules ./congaModules
COPY html ./html
# upnp 1.0.3 does not correctly work with the stock HTTP.py module
COPY patch/HTTP.py /tmp/upnp-HTTP.py
RUN python3 -c "import shutil, site; from pathlib import Path; src = Path('/tmp/upnp-HTTP.py'); candidates = [Path(path) / 'upnp' / 'HTTP.py' for path in site.getsitepackages()]; dst = next((path for path in candidates if path.exists()), None); assert dst is not None, candidates; shutil.copyfile(src, dst)" \
    && rm /tmp/upnp-HTTP.py

# Web server
EXPOSE 80
# Robot server
EXPOSE 20008
# upnp
EXPOSE 1900/udp
EXPOSE 5000


# Use unbuffered output for the logs
CMD ["python3", "congaserver.py", "80", "20008", "true", "true"]