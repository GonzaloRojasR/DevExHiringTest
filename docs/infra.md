# Pipeline - Infraestructura (Terraform)

## Descripción
Este pipeline realiza la provisión completa de la infraestructura necesaria para la aplicación, incluyendo la red (VPC), clúster EKS, repositorio ECR y configuración básica de monitoreo con CloudWatch.

---

## Configuración
- pipeline `.github\workflows\ci-cd-infra.yaml`
- Los módulos de Terraform están ubicados en: `infra/terraform/modules/`
- Los entornos (ej. dev, prod) están en: `infra/terraform/environments/`
- Se recomienda usar backend remoto en entornos productivos.
- Se requiere una cuenta de servicio con permisos adecuados. [Ver requisitos de cuenta y permisos](./sa-policy.md)
- Los siguientes secretos deben estar configurados en GitHub Actions:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `AWS_ACCOUNT_ID`
- Comando de despliegue:
    ``` 
    terraform apply -var-file="environments/dev/dev.tfvars"

    ``` 

---

## Mejoras futuras
- Separar los módulos de infraestructura crítica (VPC, EKS) de los componentes de plataforma (cert-manager, ingress-nginx).
- Limitar los permisos del usuario de Terraform mediante políticas mínimas necesarias.
- Agregar validación automática de estado de recursos críticos post-aplicación (terraform plan + health check).
- Automatizar el versionado de infraestructura en ambientes controlados.

