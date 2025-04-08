# Desafío Técnico DevEx

Gracias por tu interés en nuestra posición de Experiencia del Desarrollador (DevEx). Como parte del proceso de selección, te pedimos completar el siguiente desafío técnico.

## Objetivo del Desafío

Diseña y desarrolla una aplicación simple utilizando Node o Java. Esta aplicación deberá exponer un endpoint HTTP/HTTPS que retorne el mensaje "¡Hola Mundo!". La aplicación debe ser desplegada en un clúster de Kubernetes utilizando un pipeline de CI/CD con GitHub Actions y debe estar accesible públicamente desde internet.

> Puede ser solo http.

## Requerimientos

1. Aplicación
- Debe responder a una solicitud HTTP GET en un endpoint definido por ti con el mensaje "¡Hola Mundo!".
- Dockeriza la aplicación utilizando un Dockerfile.

2. Infraestructura (IaC)
- Construye la infraestructura utilizando Terraform.
- Utiliza módulos Terraform, preferentemente creados por ti, y aplica buenas prácticas en tu implementación.
- La infraestructura mínima debe incluir:
  - Un clúster Kubernetes (EKS).
  - Registro privado de contenedores (ECR).
 
3. Pipeline de CI/CD (GitHub Actions)
Tu pipeline deberá contener al menos estas etapas:
- Pruebas: Ejecuta pruebas unitarias básicas sobre tu aplicación.
- Linting (Opcional): Utiliza linters como ESLint (Node) o Checkstyle (Java).
- Build: Construye la imagen Docker y súbela al registro privado ECR.
- Deploy: Despliega la aplicación automáticamente en el clúster de Kubernetes.

4. Seguridad y Buenas Prácticas (Opcional, altamente valorado)
- Implementa IAM roles mínimos para tu infraestructura.
- Gestiona secretos utilizando AWS Secrets Manager o Vault.
- Configura certificados SSL para acceso HTTPS.

5. Monitoreo y Logging
- Configura monitoreo básico y logging para la aplicación utilizando herramientas como CloudWatch, Datadog o similares.

6. Documentación
Tu documentación debe incluir:
- Pasos para desplegar la infraestructura desde cero.
- Instrucciones para ejecutar la aplicación y pruebas.
- Explicación clara de cómo configurar credenciales y secretos (si aplica).
- Descripción de cada etapa del pipeline CI/CD.

## Estructura de sugerencia del repositorio.
```
/
├── app/
│   ├── src/
│   ├── Dockerfile
│   └── tests/
├── infra/
│   └── terraform/
│       ├── modules/
│       └── environments/
├── pipelines/
│   └── ci-cd.yaml
└── docs/
    └── README.md
```

## Entrega
1. Haz un fork del repositorio GitHub actual.
2. Crea una rama con tu nombre en el repositorio forked.
3. Realiza los cambios necesarios.
4. Genera un Pull Request hacia tu repositorio con los cambios.
5. Comparte por correo el enlace a tu repositorio y el PR generado.

# Plazos
Completa el desafío en un plazo de una semana desde que recibes este documento. Si necesitas más tiempo, por favor comentame.

Criterios de Evaluación

| Aspecto | Evaluación |
|----------|----------|
| Aplicación    | Funcionalidad correcta, calidad del código y estructura.  |
| Docker    | Imagen optimizada y correctamente configurada.   |
| CI/CD    | Automatización efectiva con GitHub Actions.   |
| Kubernetes    | Calidad en configuración, escalabilidad y seguridad.   |
| Terraform (IaC)    | Implementación clara y uso efectivo de módulos y prácticas recomendadas.   |
| Seguridad (Opcional)    | Aplicación de roles IAM mínimos y gestión segura de secretos.  |
| Monitoreo y Logging    | Solución práctica y funcional.   |
| Documentación   | Claridad y utilidad para reproducir y operar la solución.   |
| Extras (Opcionales)   | Certificados SSL, linters y escalado automático (valorizados positivamente).   |
