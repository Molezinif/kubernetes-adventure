CLUSTER := k8s-adventure

cluster:
	kind create cluster --name $(CLUSTER)

deploy:
	kubectl apply -f k8s/
	kubectl expose deployment express --port 8080

metric-server:
	kubectl apply -f k8s/0-metric-server.yaml

metric-status:
	kubectl get deployments metrics-server -n kube-system

expose-express:
	kubectl port-forward deployment/express 8080

load:
	kubectl run load --image=busybox:1.36 --restart=Never -- /bin/sh -c \
		'while true; do wget -q -O /dev/null "http://express:8080/fibonacci?n=3000000"; done'

stop-load:
	kubectl delete pod load

watch-all:
	watch -n1 kubectl get all

watch-hpa:
	kubectl get hpa fibonacci-express-hpa --watch

clean:
	kind delete cluster --name $(CLUSTER)
