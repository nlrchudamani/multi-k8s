docker build -t nlrcmani/multi-client:latest -t nlrcmani/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t nlrcmani/multi-server:latest -t nlrcmani/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t nlrcmani/multi-worker:latest -t nlrcmani/multi-worker:$SHA -f ./worker/Dockerfile ./worker 

docker push nlrcmani/multi-client:latest
docker push nlrcmani/multi-server:latest
docker push nlrcmani/multi-worker:latest

docker push nlrcmani/multi-client:$SHA
docker push nlrcmani/multi-server:$SHA
docker push nlrcmani/multi-worker:$SHA
kubectl apply -f k8s

kubectl set image deployments/client-deployment client=nlrcmani/multi_client:$SHA
kubectl set image deployments/server-deployment server=nlrcmani/multi_server:$SHA
kubectl set image deployments/worker-deployment worker=nlrcmani/multi_worker:$SHA

