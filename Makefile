metric-server:
	kubectl apply -f k8s/0-metric-server

metric-status:
	kubectl get deployments metrics-server -n kube-system

expose-express:
	kubectl port-forward express-5dbcf89f8-xn6vs 8080

watch-all:
	watch -n1 kubectl get all

