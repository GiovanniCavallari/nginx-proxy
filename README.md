# NGINX Proxy Tunnel

## Description

This project allows you to access an application running on localhost from a remote URL. 

This is useful for testing integrations that cannot access localhost and need an application running in the cloud.

If you've used ngrok, it works the same way, but with a little more control.

![Architecture](/architecture.png?raw=true "Architecture")

## Setup

###  1. Clone the repository on your instance

```
git clone https://github.com/GiovanniCavallari/nginx-proxy.git
```

### 2. Run the script

```
sh bin/run.sh TUNNEL_HOST TUNNEL_PATH HOST_PORT TUNNEL_PORT CONTAINER_NAME
```

Params explained:
- **TUNNEL_HOST** is the internal host of your instance.
- **TUNNEL_PATH** is the path you will access to redirect to your localhost.
- **HOST_PORT** is the port to receive browser requests on host.
- **TUNNEL_PORT** is the port that will be used to redirect browser requests to localhost.
- **CONTAINER_NAME** is the container name to make docker cli easy to use.

### 3. Start the sample app on localhost

Start some sample app for the proxy tunnel to access your localhost and return the content. For example, some app using express.

### 4. Open SSH connection

```
ssh -nN -R TUNNEL_PORT:localhost:LOCALHOST_APP_PORT username@yourdomain.com
```

Ports explained:
- **LOCALHOST_APP_PORT** refers to the port that your app is running on localhost.
- **TUNNEL_PORT** is the forwarded port on the host that we use to directly SSH into the container.

### 5. Access the proxy tunnel URL

As long as you keep this SSH connection open, you'll be able to access your app from either http://localhost or http://dev.app.com.