docker build -t jwaterknight1/multi-client -f ./client/Dockerfile ./client
docker build -t jwaterknight1/multi-server -f ./server/Dockerfile ./server 
docker build -t jwaterknight1/multi-worker -f ./worker/Dockerfile ./worker

docker push jwaterknight1/multi-client
docker push jwaterknight1/multi-server
docker push jwaterknight1/multi-worker

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=jwaterknight1/multi-server
kubectl set image deployments/client-deployment client=jwaterknight1/multi-client
kubectl set image deployments/worker-deployment worker=jwaterknight1/multi-worker