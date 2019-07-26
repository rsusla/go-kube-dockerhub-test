
    sudo su
    
    export TEST_DOCKER_IMAGE_LOCALNAME='rs-docker-project'
    export TEST_DOCKER_IMAGE_TAGNAME='catmorte/test-docker-project'
    export TEST_DOCKER_IMAGE_VERSION='v1'
    
    docker build -t $TEST_DOCKER_IMAGE_LOCALNAME .
    docker images
    
    #uncomment to run test localy
    #docker run -p 4000:8081 $TEST_DOCKER_IMAGE_LOCALNAME
    
    
    docker login
    
    docker tag $TEST_DOCKER_IMAGE_LOCALNAME $TEST_DOCKER_IMAGE_TAGNAME:$TEST_DOCKER_IMAGE_VERSION
    docker push $TEST_DOCKER_IMAGE_TAGNAME:$TEST_DOCKER_IMAGE_VERSION
    
    #-d -detached
    #-i interactive
    #-t pseudo-tty
    docker container run -d -it --name testdocker $TEST_DOCKER_IMAGE_TAGNAME:$TEST_DOCKER_IMAGE_VERSION
    docker container list
   
   
    kubectl create -f kub-manifest.yaml
    kubectl get pods
    
    unset TEST_DOCKER_IMAGE_VERSION
    
    kubectl port-forward testdocker-pod 8081

[kub-manifest.yaml] spec.containers.image = (result of $TEST_DOCKER_IMAGE_TAGNAME:$TEST_DOCKER_IMAGE_VERSION e.g. catmorte/test-docker-project:v1)