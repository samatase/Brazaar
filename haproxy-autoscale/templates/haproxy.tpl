global  
    daemon
    maxconn 25000

defaults
    mode http
    timeout connect 5000ms
    timeout client 5000ms
    timeout server 5000ms

frontend www *:80
    mode http
    maxconn 50000
    default_backend servers

backend servers
    mode http
    balance roundrobin
    % for instance in instances['default']:
    server ${ instance.id } ${ instance.private_dns_name }
    % endfor