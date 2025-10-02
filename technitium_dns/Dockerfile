ARG BUILD_FROM
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install dependencies
RUN apk add --no-cache \
        wget \
        unzip \
        curl \
        ca-certificates

# Install .NET 8 Runtime
RUN apk add --no-cache \
        aspnetcore8-runtime \
        icu-libs \
        libmsquic

# Create app directory
WORKDIR /opt/technitium

# Download and extract Technitium DNS Server
ARG TECHNITIUM_VERSION=12.2
RUN wget "https://download.technitium.com/dns/archive/${TECHNITIUM_VERSION}/DnsServerPortable.tar.gz" \
    && tar -xzf DnsServerPortable.tar.gz \
    && rm DnsServerPortable.tar.gz \
    && chmod +x start.sh

# Create data directory
RUN mkdir -p /data/config /data/logs /data/zones

# Copy rootfs
COPY rootfs /

# Set environment variables
ENV ASPNETCORE_ENVIRONMENT=Production
ENV ASPNETCORE_URLS=http://+:5380

# Expose ports
EXPOSE 53/udp 53/tcp 5380/tcp

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
    CMD curl -f http://localhost:5380/api/apps/list?token=invalid || exit 1

# Start script
CMD ["/etc/s6-overlay/s6-rc.d/technitium/run"]
