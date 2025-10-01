# Home Assistant Technitium DNS Server Add-on

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield]

An open source authoritative as well as recursive DNS server that can be used for self hosting a DNS server for privacy & security.

## About

Technitium DNS Server is an open source recursive DNS server that can be used for hosting authoritative domain names as well as providing a recursive DNS service. It can be configured to block ads, phishing, and malware domains using DNS blocking lists.

## Features

- **Recursive DNS Server**: Full recursive DNS resolver with caching
- **Authoritative DNS Server**: Host your own domain names
- **DNS Blocking**: Block ads, phishing, and malware domains
- **Web Interface**: Easy-to-use web-based management interface
- **DNS-over-HTTPS**: Support for secure DNS protocols
- **DNS-over-TLS**: Encrypted DNS queries
- **Split-Horizon DNS**: Different responses based on client network
- **Conditional Forwarding**: Forward specific domains to specific servers
- **DHCP Server**: Built-in DHCP server (optional)

## Configuration

### Option: `web_port`

The port for the web administration interface.

### Option: `dns_port`

The port for DNS server (both TCP and UDP).

### Option: `admin_user`

Username for the web administration interface.

### Option: `admin_password`

Password for the web administration interface. **Required on first setup**.

### Option: `enable_blocking`

Enable DNS blocking functionality.

### Option: `enable_logging`

Enable DNS query logging.

### Option: `log_level`

Set the logging level. Available options:
- `Trace`
- `Debug`
- `Info` (default)
- `Warning`
- `Error`
- `Critical`

### Option: `prefer_ipv6`

Prefer IPv6 over IPv4 when both are available.

## Usage

1. Start the add-on
2. Access the web interface at `http://homeassistant.local:5380` (or your Home Assistant IP with port 5380)
3. Log in with the admin credentials you configured
4. Configure your DNS settings through the web interface
5. Point your devices to use your Home Assistant IP as the DNS server

## Network Configuration

This add-on requires host networking mode to properly handle DNS requests on port 53. Make sure no other DNS services are running on your host system.

## Support

For issues specific to this Home Assistant add-on, please open an issue on the GitHub repository.

For Technitium DNS Server documentation and support, visit: https://technitium.com/dns/

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg