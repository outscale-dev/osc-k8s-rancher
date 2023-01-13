# rke2 cluster template

Helm chart that can be used as rke2 cluster template

### how to use

```bash
helm install --namespace fleet-default --value ./your-values.yaml my-cluster ./charts
```

General cluster options are available through [values.yaml](./values.yaml)