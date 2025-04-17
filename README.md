# Documentación CI/CD - Desafio App

Este repositorio implementa un flujo de CI/CD automatizado para el despliegue de una aplicación en AWS EKS, utilizando GitHub Actions, Helm, Kustomize, Docker y Terraform. Esta documentación se encuentra dividida por pipeline para facilitar su comprensión y mantenimiento.

---

## Tabla de contenidos
- [Pipeline de Build y Test](./docs/build-test.md)
- [Pipeline de Construcción de Imagen Docker](./docs/build-image.md)
- [Pipeline de Despliegue Kustomize](./docs/kustomize.md)
- [Pipeline de Despliegue Final](./docs/deploy.md)
- [Pipeline de Provisionamiento de Infraestructura (Terraform)](./docs/infra.md)
- [Pipeline de Componentes Helm (cert-manager / nginx)](./docs/helm-components.md)

---

## Notas adicionales

- La infraestructura está desplegada mediante Terraform en la carpeta `infra/terraform`.
- Los componentes de clúster (cert-manager, ingress-nginx, etc) se gestionan con Helm en la carpeta `infra/helm-components`.
- Los manifiestos Kubernetes se encuentran en la carpeta `k8s` divididos por entorno (`base`, `dev`, etc).
- Las variables y secretos para los pipelines se configuran en GitHub Actions bajo `Settings > Secrets and variables > Actions`.
- Los templates de workflows (.github/workflows) se dejaron localmente por conveniencia. En un entorno real, se recomienda extraerlos a un repositorio separado para fomentar su reutilización entre múltiples proyectos.
- De igual forma, en un entorno real, la infraestructura debe ser gestionada a nivel de plataforma y no por servicio, para evitar redundancias en los repositorios.
- No se utilizó un dominio personalizado, ya que el objetivo del despliegue es temporal y con fines de demostración. Por lo tanto, se accede directamente a través del endpoint público generado por el LoadBalancer.
- Dado que no se cuenta con un dominio válido, se configuró cert-manager con un certificado autofirmado (self-signed). Esto puede generar advertencias de seguridad en el navegador al acceder mediante HTTPS.
- La aplicación está corriendo y disponible públicamente en el siguiente enlace (vía ingress NGINX + self-signed certificate):
    - https://a33eeca975e3b4093b761e58e04dbb30-155de13d035b4c42.elb.us-east-1.amazonaws.com/desafio

---

¡Gracias por revisar este proyecto! Si tienes sugerencias, escribeme a mi correo gorojas92@gmail.com.

---

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
