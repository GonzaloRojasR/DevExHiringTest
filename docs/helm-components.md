# Pipeline - Componentes Helm (cert-manager / ingress-nginx)

## Descripción  
Este pipeline instala y configura los componentes base del clúster necesarios para el funcionamiento de servicios web expuestos al exterior. Se despliegan:

- `cert-manager`: para la gestión de certificados SSL.
- `ingress-nginx`: como controlador de ingreso HTTP al clúster.
- Se configura un **ClusterIssuer con certificados autofirmados** (`self-signed`) para entornos sin dominio personalizado.

---

## Configuración

- Pipeline: `.github/workflows/ci-cd-plataform-setup.yaml`
- Se ejecuta desde la carpeta: `infra/helm-components/`
- Archivos relevantes:
  - `deploy.sh`: ejecuta la instalación de los charts y aplica el issuer.
  - `utils.sh`: incluye funciones auxiliares como la verificación y creación de namespaces.
  - `selfsigned-cluster-issuer.yaml`: define el `ClusterIssuer` autofirmado.
- Se requiere una cuenta de servicio con permisos adecuados. [Ver requisitos de cuenta y permisos](./sa-policy.md)
- Los siguientes secretos deben estar configurados en GitHub Actions:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `AWS_ACCOUNT_ID`

---

## Mejoras futuras

- Migrar el uso de certificados **self-signed** a certificados válidos de **Let's Encrypt** usando ACME, una vez que se disponga de un dominio público.
- Incluir el despliegue automatizado de herramientas de observabilidad como **Prometheus** y **Grafana**.
- Considerar la integración de **ArgoCD** para una gestión declarativa y visual de los componentes Helm.
