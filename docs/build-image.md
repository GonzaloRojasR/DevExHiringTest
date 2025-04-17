# Template - Construcción de Imagen Docker

## Descripción
Construye la imagen Docker de la aplicación, etiqueta la imagen y la sube a Amazon ECR.

---

## Configuración
- Se requiere cuenta de servicio. [Ver requisitos de cuenta y permisos](./sa-policy.md).
- Requiere los siguientes secretos en GitHub Actions:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `AWS_ACCOUNT_ID`
- Lee el nombre del proyecto desde `package.json`.

---

## Mejoras futuras
- Escaneo de seguridad de imágenes con **Trivy**.
- Versionado automático con tags Git.
