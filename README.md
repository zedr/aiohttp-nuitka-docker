# aiohttp container + binary

This project provides a template to build a Docker container that runs
a simple aiohttp web application compiled as a binary using Nuitka. Now, that's
a mouthful...

## Instructions

```bash
# Create the Nuitka binary
make binary
# Create the Docker container
docker build --rm -t aio-demo .
# Run the container
docker run -t aio-demo
# Now open a browser and visit http://localhost:8080
```
