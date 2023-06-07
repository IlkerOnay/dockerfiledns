FROM alpine:latest

# Install necessary packages
RUN apk --update add bind

# Copy the DNS zone file from GitHub
ADD https://github.com/IlkerOnay/dnsfile/blob/main/named.conf.options /etc/bind/named.conf.options
ADD https://github.com/IlkerOnay/dnsfile/blob/main/named.conf.local /etc/bind/named.conf.local
ADD https://github.com/IlkerOnay/dnsfile/blob/main/db.sae.jing.fr /etc/bind/db.sae.jing.fr

# Expose DNS port
EXPOSE 53/udp

# Start the DNS server
CMD ["named", "-g"]
