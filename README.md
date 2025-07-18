# Inception - 42 Project

## 📚 Project Description

**Inception** is a project from the 42 curriculum designed to introduce Docker and container orchestration using Docker Compose.  
The goal is to deploy a secure, multi-service web infrastructure running entirely inside containers on a Linux virtual machine.

## 🧱 Architecture Overview

This project sets up the following services using `docker-compose`:

- **Nginx**: HTTPS reverse proxy serving the website with SSL.
- **WordPress**: PHP-based content management system.
- **MariaDB**: Relational database used by WordPress.

### 📁 Project Structure

```
.
├── requirements/
│ ├── nginx/
│ ├── mariadb/
│ └── wordpress/
├── .env
├── docker-compose.yml
└── README.md
```


## ⚙️ Configuration

### 📁 Persistent Volumes

The following host directories are mounted as volumes to ensure data persistence:

- `~/data/mariadb` — stores MariaDB database files
- `~/data/wordpress` — stores WordPress files

### 🔐 `.env` File

Environment variables used by the containers are defined in a `.env` file to ensure security. You can check the env.example file to see what is expected to run the project.