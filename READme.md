**Conditional Build with Arguments**

1. **For Build with Arguments:**

   - Set the `PROJECT_NAME` argument to your desired project name (e.g., `go-docker`).
   - Run the following command:

     ```bash
     docker-compose -f <docker-compose.yml> build --build-arg "PROJECT_NAME=go-docker" --no-cache
     ```

   - This will:
     - Uncomment the `args` section under the `build` section in your `docker-compose.yml` file.
     - Uncomment the `ARG` directive in your `Dockerfile`.
     - Build the image with the specified `PROJECT_NAME`.
     - Use `--no-cache` to force a rebuild from scratch (optional).

2. **For Build without Arguments (Standard Build):**

   ```bash
   docker-compose -f <docker-compose.yml> build
   ```

   - This will build the image using the default settings in your `docker-compose.yml` file.

**Accessing the Container and Initializing Go Project**

1. **Enter the Container Shell:**

   ```bash
   docker exec -it go_gen sh  # Assuming your container name is "go_gen"
   ```

2. **Initialize Go Project:**

   ```bash
   go mod init <project-name>  # Replace "<project-name>" with your desired name (e.g., example.com/go-test [invalid URL removed])
   ```

   - This creates the `go.mod` file within the container, which will be reflected in your local directory (if volume mounts are configured).

**Building Cross-Platform Executable**

1. **Set Build Environment:**

   ```bash
   GOOD=windows GOARCH=amd64
   ```

   - This specifies that you want to build a Windows-compatible executable using the 64-bit architecture.

2. **Build the Executable:**

   ```bash
   go build  # This will create an executable suitable for Windows
   ```

   - The resulting executable will be located within your project directory inside the container.

**Recommended build && run**

The method will using Dev Container which is an Extension

- open command `ctrl + shift + p` and type `Dev Containers Add dev container configuration file`
- choose `Add Configuration to user data folder` and choose `From docker-compose.yml`
- vscode will proceed the necessary setup and config
- after some times vscode will run the container on defined image from docker compose file

**Next(?)**

    - Installing Modules or Frameworks:
        - Use go get commands within the container to install dependencies.
        - Consider containerizing dependencies for a more portable approach.

    - Integrating with Database Service Container:
        - Define your database service in the `docker-compose.yml` file.
        - Set environment variables or use service discovery mechanisms to connect from your Go application to the database container.
