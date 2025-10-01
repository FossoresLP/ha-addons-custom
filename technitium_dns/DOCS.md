# Configuration

This add-on requires some configuration to work properly.

## Example Configuration

```yaml
web_port: 5380
dns_port: 53
admin_user: "admin"
admin_password: "your-secure-password"
enable_blocking: true
enable_logging: true
log_level: "Info"
prefer_ipv6: false
```

## Configuration Options

### `web_port` (Required)
The port for the web administration interface. Default: `5380`

### `dns_port` (Required)  
The port for DNS server (both TCP and UDP). Default: `53`

### `admin_user` (Required)
Username for the web administration interface. Default: `admin`

### `admin_password` (Required)
Password for the web administration interface. This is required for security and must be set on first setup.

### `enable_blocking` (Optional)
Enable DNS blocking functionality for ads, phishing, and malware domains. Default: `true`

### `enable_logging` (Optional)
Enable DNS query logging. Default: `true`

### `log_level` (Optional)
Set the logging level. Available options:
- `Trace` - Most verbose
- `Debug` - Debug information
- `Info` - General information (default)
- `Warning` - Warning messages only
- `Error` - Error messages only  
- `Critical` - Critical errors only

### `prefer_ipv6` (Optional)
Prefer IPv6 over IPv4 when both are available. Default: `false`

## Network Requirements

This add-on uses host networking mode to properly handle DNS requests on port 53. Ensure:

1. No other DNS services are running on your host system on port 53
2. Your router or firewall allows DNS traffic to your Home Assistant instance
3. You may need to configure your devices or router to use your Home Assistant IP as the DNS server

## Initial Setup

1. Configure the add-on with your desired settings
2. Start the add-on
3. Access the web interface at `http://YOUR_HOME_ASSISTANT_IP:5380`
4. Log in with the admin credentials you configured
5. Configure additional DNS settings through the web interface

## Security Notes

- Always use a strong password for the `admin_password` option
- The web interface is not encrypted by default - consider using a VPN or local network access only
- DNS queries will be logged if logging is enabled - be aware of privacy implications