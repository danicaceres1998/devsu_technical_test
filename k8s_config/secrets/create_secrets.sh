kubectl create secret generic django-secret-key \
  --from-file=secret-key=secret-key.txt \
  -n devsu-python

kubectl create secret generic database-credentials \
    --from-file=USER=./user.txt \
    --from-file=PASSWORD=./password.txt \
    -n devsu-python
