# Cuenta de Servicio

## Descripción  
Esta cuenta de servicio es utilizada para la automatización del despliegue de aplicaciones, la provisión de infraestructura (EKS, VPC, ECR, etc.) y la configuración del clúster.

---

## Configuración

Se debe crear una cuenta de servicio (por ejemplo: `gr-sa-terraform-ci`) y asignarle los siguientes permisos para permitir la operación de los distintos pipelines de CI/CD.

### Políticas administradas (AWS Managed Policies)

Estas políticas permiten acceso amplio a los recursos más utilizados por Terraform y GitHub Actions:

- `AmazonEC2ContainerRegistryFullAccess`
- `AmazonEC2ReadOnlyAccess`
- `AmazonEKSClusterPolicy`
- `AmazonEKSServicePolicy`
- `AmazonEKSWorkerNodePolicy`
- `AmazonS3FullAccess`
- `AWSKeyManagementServicePowerUser`
- `CloudWatchFullAccess`
- `CloudWatchLogsFullAccess`
- `IAMReadOnlyAccess`

---

### Permisos adicionales (inline o personalizados)

Para una operación completa, especialmente con recursos de EKS, IAM y KMS, es necesario conceder los siguientes permisos adicionales:

```json
[
  "eks:CreateCluster",
  "eks:DescribeCluster",
  "eks:DeleteCluster",
  "eks:ListClusters",
  "eks:UpdateClusterConfig",
  "eks:UpdateClusterVersion",
  "eks:TagResource",
  "eks:UntagResource",
  "iam:GetRole",
  "iam:PassRole",
  "iam:CreateServiceLinkedRole",
  "iam:TagRole",
  "ec2:*",
  "kms:CreateKey",
  "kms:DescribeKey",
  "kms:ListKeys",
  "kms:TagResource",
  "kms:ScheduleKeyDeletion",
  "kms:EnableKeyRotation",
  "logs:CreateLogGroup",
  "logs:PutRetentionPolicy",
  "logs:TagResource",
  "ecr:*"
]
```
---

## Mejoras futuras
- Dividir responsabilidades en múltiples cuentas:
    - Una cuenta exclusiva para provisión de infraestructura (Terraform).
    - Otra cuenta dedicada para el despliegue de servicios (CI/CD).
    - Una cuenta con acceso temporal o de emergencia para configuraciones avanzadas.
- Automatizar la rotación de credenciales o adoptar OIDC con IRSA para despliegues desde GitHub Actions sin necesidad de claves secretas.

---

[Volver al README](../README.md)
