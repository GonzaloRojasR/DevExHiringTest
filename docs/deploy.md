# Template - Despliegue

## Descripción
Este pipeline es responsable del despliegue final de la aplicación luego de aplicar Kustomize.

---

## Configuración
- Recibe el entorno (`dev`, `prod`) desde `ci-cd.yaml`.
- Se parametriza el namespace y ruta a los manifiestos.
- Se requiere cuenta de servicio. [Ver requisitos de cuenta y permisos](./sa-policy.md).
- Requiere los siguientes secretos en GitHub Actions:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `AWS_ACCOUNT_ID`

---

## Mejoras futuras
- Automatizar rollback si el deployment falla.
- Considerar la integración de **ArgoCD** para una gestión declarativa y visual de los componentes Helm.

---

[Volver al README](../README.md)
