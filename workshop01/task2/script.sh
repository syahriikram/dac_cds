# create network
docker network create mynet 

# check network
docker create ls

# create volume for the data
docker volume create myvol

# check volume
docker volume ls

# create the database
docker run -d --volume myvol:/var/lib/mysql --network mynet --name mydb stackupiss/northwind-db:v1

# ensure it is running by checking the network under Containers key
docker network inspect mynet

# create the application
docker run -d --network mynet -e DB_USER=root -e DB_HOST=mydb -e DB_PASSWORD=changeit -p 8080:3000 --name myapp stackupiss/northwind-app:v1

# ensure it is running by checking the network under Containers key
docker network inspect mynet

