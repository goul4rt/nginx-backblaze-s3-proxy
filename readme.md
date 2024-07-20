# nginx-backblaze-s3-proxy

This project sets up an Nginx proxy to interact with Backblaze B2 storage using Docker. 
It provides a convenient way to manage and serve files from a Backblaze B2 bucket through an Nginx proxy. 
This setup is idealized to act as a cache layer between your machines and the Backblaze B2 buckets, reducing costs by handling only GET requests.

## How to Use

### Construct In

1. **Docker**: Ensure Docker is installed on your machine. [Get Docker](https://docs.docker.com/get-docker/).
2. **Docker Compose**: Make sure Docker Compose is installed. [Install Docker Compose](https://docs.docker.com/compose/install/).

### Configuration

1. **Create a `.env` file**: Copy the `.env.example` file to `.env` and update the values with your Backblaze B2 credentials and bucket information:

   ```bash
   cp .env.example .env
   ```

   Edit `.env` and set the following variables:

   ```env
   B2_KEY_ID=your-key-id
   B2_ACCESS_KEY=your-access-key
   B2_BUCKET=your-bucket-name
   B2_REGION=your-region
   ```

   To create and manage your Backblaze B2 application keys, follow the instructions at [Backblaze - Create and Manage Application Keys](https://www.backblaze.com/docs/cloud-storage-create-and-manage-app-keys).

2. **Configure Nginx**: The `nginx.conf.template` file is used for variable replacement. It will be processed to generate the final `nginx.conf` used by Nginx.

3. **Build and Start the Project**:

   Use Docker Compose to build the Docker image and start the Nginx proxy:

   ```bash
   docker-compose up --build
   ```

   This command builds the Docker image according to the `Dockerfile` and starts the services defined in `docker-compose.yml`.

### Project Structure

- `Dockerfile`: Contains the instructions for building the Docker image.
- `nginx.conf`: The Nginx configuration file used by the Nginx server.
- `nginx.conf.template`: Template for Nginx configuration with placeholder variables.
- `docker-compose.yml`: Defines the Docker services, networks, and volumes.
- `.env.example`: Example environment variable file. Rename and customize it to `.env` for actual usage.

### API Coverage

This project is designed to act as a caching proxy for GET requests only. It serves as a cache layer to reduce costs associated with direct interactions with Backblaze B2 buckets.

For more details about the Backblaze B2 S3-compatible API, refer to the [Backblaze - Introduction to the S3-Compatible API](https://www.backblaze.com/apidocs/introduction-to-the-s3-compatible-api).

### Reference

For similar projects, you can refer to the [nginx-s3-gateway](https://github.com/nginxinc/nginx-s3-gateway) repository by NGINX Inc., which provides a similar setup for S3-compatible storage.

### Troubleshooting

- **Error with environment variables**: Ensure your `.env` file is correctly configured and located in the same directory as `docker-compose.yml`.
- **Build or runtime issues**: Check Docker and Nginx logs for detailed error messages.

Feel free to open issues or submit pull requests if you encounter any problems or have suggestions for improvements.

## Extra
Some references to studie:
https://docs.nginx.com/nginx/admin-guide/content-cache/content-caching/