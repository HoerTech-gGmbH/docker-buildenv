pipeline {
   agent {label "jenkinsmaster"}
   stages {
      stage('docker && x86_64') {
         agent {label "x86_64 && dockerbld"}
         steps {
            checkout scm
            sh "docker build -t hoertech/docker-buildenv:docker_x86_64 docker"
            sh "docker push hoertech/docker-buildenv:docker_x86_64"
         }
      }
   }
}
