# LIBRXTX Docker

A Docker Image providing java with LIBRXTX. Typically an extending image will
add a java application and will have to be invoked something like

    docker -v /dev/ttyUSB0:/dev/ttyUSB0 -privileged <image-name>
