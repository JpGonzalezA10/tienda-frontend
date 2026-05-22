# Tienda Innovatech — Frontend

Aplicación web Frontend de Tienda Innovatech Chile, desplegada en AWS EC2 mediante contenedores Docker.

## Tecnologías
- Nginx Alpine
- Docker multi-stage build
- GitHub Actions CI/CD

## Estructura del proyecto
web/
├── Dockerfile          # Multi-stage: Node builder + Nginx runtime
├── docker-compose.yml  # Stack de servicios
├── nginx.conf          # Configuración del servidor web
├── html/
│   └── index.html      # Aplicación web
└── .github/
└── workflows/
└── deploy.yml  # Pipeline CI/CD
## Cómo ejecutar localmente
```bash
docker build -t tienda-frontend .
docker run -d --name tienda-frontend -p 80:80 tienda-frontend
```

## Pipeline CI/CD
El pipeline se activa automáticamente al hacer push en la rama `deploy`:
1. Construye la imagen Docker
2. Publica en Docker Hub
3. Despliega en instancia WEB EC2

## Variables de entorno
| Variable | Descripción |
|----------|-------------|
| DOCKERHUB_USERNAME | Usuario de Docker Hub |
| DOCKERHUB_TOKEN | Token de acceso Docker Hub |
| EC2_HOST | IP pública de WEB EC2 |
| EC2_SSH_KEY | Clave privada SSH para acceso a EC2 |

## Acceso
La aplicación es accesible desde Internet mediante la IP pública de WEB EC2 en el puerto 80.
