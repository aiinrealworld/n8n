# n8n Docker Compose Setup

This project provides a simple and easy way to run n8n locally using Docker Compose, complete with a PostgreSQL database for persistent data storage.

## Prerequisites

*   Docker: [https://www.docker.com/get-started/](https://www.docker.com/get-started/)
*   Docker Compose: Generally installed with Docker Desktop, or install separately if needed.

## Installation

1.  **Clone the repository** (if applicable, otherwise just download the files).

2.  **Configure the Environment:**
    *   Create a `.env` file in the same directory as the `docker-compose.yml` file. You can use the provided `.env.example` as a template:
        ```bash
        cp .env.example .env
        ```
    *   Open the `.env` file in a text editor and replace the placeholder values with your desired credentials. Ensure you set these environment variables:
        *   `POSTGRES_USER`: The PostgreSQL username.
        *   `POSTGRES_PASSWORD`: The PostgreSQL password.
        *   `N8N_BASIC_AUTH_USER`: The n8n web UI username.
        *   `N8N_BASIC_AUTH_PASSWORD`: The n8n web UI password.
        **Important:** Never commit the `.env` file to your source control! This file contains sensitive information. Add `.env` to your `.gitignore` file.

3.  **Start the environment:**
    *   Open a terminal or command prompt and navigate to the directory containing the `docker-compose.yml` file.
    *   Run the following command:
        ```bash
        docker-compose up -d
        ```
        This will start the n8n and PostgreSQL containers in detached mode (in the background).  Docker Compose will automatically load the environment variables from your `.env` file.

## Accessing n8n

Once the containers are running, you can access the n8n UI in your web browser at:

[http://localhost:5678](http://localhost:5678)

Use the username and password you configured in the `.env` file (`N8N_BASIC_AUTH_USER` and `N8N_BASIC_AUTH_PASSWORD`) to log in.

## Stopping and Resetting the Environment

*   **Stopping the containers:** To stop the n8n and PostgreSQL containers, run the following command in the same directory as the `docker-compose.yml` file:
    ```bash
    docker-compose down
    ```

*   **Resetting the environment (removing data):** To stop the containers and also remove the persistent data volumes (effectively resetting the environment to a clean state), run:
    ```bash
    docker-compose down -v
    ```
    **Warning:** This will delete all your n8n workflows, credentials, and PostgreSQL database data.  Use with caution!

## Troubleshooting

*   **Database Connection Issues:** If you encounter errors related to connecting to the database, ensure that the PostgreSQL container is running (check `docker ps`) and that the database credentials in your `.env` file are correct. Also verify that `DB_POSTGRESDB_HOST` is set to `db` in the n8n environment configuration.

*   **Port Conflicts:** If port 5678 or 5432 are already in use on your system, you will need to either stop the conflicting process or change the port mappings in the `docker-compose.yml` file. To change the ports, edit the `ports` section of the `n8n` and `db` services respectively.

*   **n8n UI Not Accessible:** If the n8n UI is not accessible at `http://localhost:5678`, double-check that the n8n container is running correctly (use `docker ps`) and that there are no errors in its logs (use `docker logs n8n-app` or the container name you configured).