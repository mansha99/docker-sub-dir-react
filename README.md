#build
docker build -t docker-sub-sir-react .
#run docker
docker run -p 3000:80 docker-sub-sir-react
#run app
Open http://127.0.0.1/app1
