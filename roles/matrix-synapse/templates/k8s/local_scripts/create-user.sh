#!/bin/bash

POD_NAME=$(kubectl get pods --namespace $NAMESPACE -l "role=matrix-synapse,chat=$FQDN" -o jsonpath="{.items[0].metadata.name}")

if [ $1 == "admin"  ] ; then
	kubectl exec --namespace $NAMESPACE $POD_NAME -- register_new_matrix_user -c /data/homeserver.yaml -u $NEW_USERNAME -p $NEW_PASSWORD --admin http://localhost:8008
else
	kubectl exec --namespace $NAMESPACE $POD_NAME -- register_new_matrix_user -c /data/homeserver.yaml -u $NEW_USERNAME -p $NEW_PASSWORD --no-admin http://localhost:8008
fi
