# Blog using Laravel 9, Inertia, Vue.js, and Docker

This repository contains the source code and configuration files for a simple blog built with Laravel 9, Inertia, Vue.js, and Docker. It allows you to quickly set up a local development environment for running the blog and making modifications as needed.

## Requirements

- Docker and Docker Compose installed on your system
- Basic knowledge of Docker and Docker Compose

## Getting Started

1. Clone this repository to your local machine
2. Navigate to the project directory in your terminal
3. Run the following command to build and start the Docker containers:
   
    ```
    docker-compose up -d --build
    ```

4. Once the containers have started, run the following command to install the required dependencies:
   
    ```
    docker-compose exec app composer install
    ```

5. Generate a new application key by running the following command:

    ```
    docker-compose exec app php artisan key:generate
    ```

6. Finally, run the database migrations to set up the database tables:

    ```
    docker-compose exec app php artisan migrate
    ```

7. The blog should now be up and running at http://localhost:8000.

## Docker Configuration

The `docker-compose.yml` file defines the configuration for the Docker containers. You can modify this file to change the configuration as needed. By default, the following containers are included:

- `app`: This container runs the Laravel application using PHP-FPM and Nginx.
- `db`: This container runs a MySQL database server.
- `redis`: This container runs a Redis server.

## Laravel Configuration

The Laravel application is configured to use the Inertia.js front-end framework and Vue.js. The front-end code is located in the `resources/js` directory. The Laravel back-end code is located in the `app` directory.

## Contributing

If you find any issues with the blog or have suggestions for improvement, feel free to create a pull request or open an issue.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
