# Pipeline - Kustomize

## Descripción
Aplica los manifiestos de Kustomize sobre el clúster de EKS para el entorno correspondiente.

---

## Configuración
- Requiere acceso al clúster a través de `aws eks update-kubeconfig`.
- El namespace se crea automáticamente si no existe.
- Los manifiestos están en la carpeta `k8s/`.

---

## Mejoras futuras
- Validación post-deploy con `kubectl rollout status`.
