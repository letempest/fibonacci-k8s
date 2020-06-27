docker build -t lemillion/fibonacci-client-k8s:latest -t lemillion/fibonacci-client-k8s:$SHA -f ./client/Dockerfile ./client
docker build -t lemillion/fibonacci-server-k8s:latest -t lemillion/fibonacci-server-k8s:$SHA -f ./server/Dockerfile ./server
docker build -t lemillion/fibonacci-worker-k8s:latest -t lemillion/fibonacci-worker-k8s:$SHA -f ./worker/Dockerfile ./worker
docker push lemillion/fibonacci-client-k8s:latest
docker push lemillion/fibonacci-server-k8s:latest
docker push lemillion/fibonacci-worker-k8s:latest

docker push lemillion/fibonacci-client-k8s:$SHA
docker push lemillion/fibonacci-server-k8s:$SHA
docker push lemillion/fibonacci-worker-k8s:$SHA

kubectl apply -f k8s
kubectl set image deployment/client-deployment client=lemillion/fibonacci-client-k8s:$SHA
kubectl set image deployment/server-deployment server=lemillion/fibonacci-server-k8s:$SHA
kubectl set image deployment/worker-deployment worker=lemillion/fibonacci-worker-k8s:$SHA
