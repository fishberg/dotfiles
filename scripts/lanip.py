#!/usr/bin/env python3
import subprocess
import re

def parse_ip_addr_output(output):
    interfaces = []
    current = None

    # Regex patterns
    iface_header_re = re.compile(r'^(\d+): ([^:]+):')
    inet_re = re.compile(r'\s+inet (\S+)')
    inet6_re = re.compile(r'\s+inet6 (\S+)')
    mac_re = re.compile(r'\s+link/\S+ (\S+)')

    for line in output.splitlines():
        # Interface header line
        m = iface_header_re.match(line)
        if m:
            if current:
                interfaces.append(current)
            current = {
                "num": m.group(1),
                "name": m.group(2),
                "mac": None,
                "ipv4": [],
                "ipv6": []
            }
            continue

        # Parse MAC
        m = mac_re.match(line)
        if m and current and current["mac"] is None:
            current["mac"] = m.group(1)

        # Parse IPv4
        m = inet_re.match(line)
        if m and current:
            current["ipv4"].append(m.group(1))

        # Parse IPv6
        m = inet6_re.match(line)
        if m and current:
            current["ipv6"].append(m.group(1))

    # Add last interface if exists
    if current:
        interfaces.append(current)

    return interfaces


def main():
    result = subprocess.run(["ip", "addr"], capture_output=True, text=True, check=True)
    parsed = parse_ip_addr_output(result.stdout)

    for iface in parsed:
        print(f"{iface['num']}: {iface['name']}")
        print(f"    MAC:  {iface['mac'] or 'N/A'}")
        for ip in iface['ipv4']:
            print(f"    IPv4: {ip}")
        for ip in iface['ipv6']:
            print(f"    IPv6: {ip}")
        print()

if __name__ == "__main__":
    main()
