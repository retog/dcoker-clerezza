# Clerezza Docker

A Docker Image for Apache Clerezza.


    docker run -ti -p 8080:8080 -p 8443:8443 -p 8022:8022 -v $HOME/.clerezza:/home/clerezza/.clerezza -v `pwd`/workspace:/home/clerezza/workspace reto/clerezza
