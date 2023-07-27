kubectl create secret generic django-secret-key \
  --from-file=secret-key=secret-key.txt \
  -n devsu-python
