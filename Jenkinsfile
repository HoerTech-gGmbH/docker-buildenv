pipeline {
   agent {label "jenkinsmaster"}
   stages {
      stage('env') {
         steps {
            sh "env"
         }
      }
            
      stage('docker images') {
         parallel {
            stage('docker x86_64') {
               agent {label "x86_64 && dockerbld"}
               steps {
                  checkout scm
                  sh "env"
                  sh "id && stat /var/run/docker.sock && ls -la /var/ && ls -la /var/run"
                  sh "docker build --no-cache --pull -t hoertech/docker-buildenv:docker_x86_64 docker"
                  sh "docker push hoertech/docker-buildenv:docker_x86_64"
               }
            }
            stage('docker armv7') {
               agent {label "armv7 && dockerbld"}
               steps {
                  checkout scm
                  sh "id && stat /var/run/docker.sock && ls -la /var/ && ls -la /var/run"
                  sh "docker build --no-cache --pull -t hoertech/docker-buildenv:docker_armv7 docker"
                  sh "docker push hoertech/docker-buildenv:docker_armv7"
               }
            }
         }
      }
      stage('base images') {
         parallel {
            stage("xenial base") {
               agent {label "x86_64 && dockerbld"}
                 steps {
                    checkout scm
                    sh "docker build --no-cache --pull -t hoertech/docker-buildenv:mha_x86_64-linux-gcc-5  mha_x86_64-linux-gcc-5"
                    sh "docker push hoertech/docker-buildenv:mha_x86_64-linux-gcc-5"
                 }
            }
            stage("bionic base x86_64") {
               agent {label "x86_64 && dockerbld"}
                 steps {
                    checkout scm
                    sh "docker build --no-cache --pull -t hoertech/docker-buildenv:mha_x86_64-linux-gcc-7  mha_x86_64-linux-gcc-7"
                    sh "docker push hoertech/docker-buildenv:mha_x86_64-linux-gcc-7"
                 }
            }
            stage("bionic base armv7") {
               agent {label "armv7 && dockerbld"}
                 steps {
                    checkout scm
                    sh "docker build --no-cache --pull -t hoertech/docker-buildenv:mha_armv7-linux-gcc-7  mha_armv7-linux-gcc-7"
                    sh "docker push hoertech/docker-buildenv:mha_armv7-linux-gcc-7"
                 }
            }
            stage("focal base") {
               agent {label "x86_64 && dockerbld"}
                 steps {
                    checkout scm
                    sh "docker build --no-cache --pull -t hoertech/docker-buildenv:mha_x86_64-linux-gcc-9  mha_x86_64-linux-gcc-9"
                    sh "docker push hoertech/docker-buildenv:mha_x86_64-linux-gcc-9"
                 }
            }
         }
      }
      stage('doc images') {
         parallel {
            stage("bionic doc") {
               agent {label "x86_64 && dockerbld"}
                 steps {
                    checkout scm
                    sh "docker build --no-cache --pull -t hoertech/docker-buildenv:mha_x86_64-linux-gcc-7-doc  mha_x86_64-linux-gcc-7-doc"
                    sh "docker push hoertech/docker-buildenv:mha_x86_64-linux-gcc-7-doc"
                 }
            }
            stage("focal doc") {
               agent {label "x86_64 && dockerbld"}
                 steps {
                    checkout scm
                    sh "docker build --no-cache --pull -t hoertech/docker-buildenv:mha_x86_64-linux-gcc-9-doc  mha_x86_64-linux-gcc-9-doc"
                    sh "docker push hoertech/docker-buildenv:mha_x86_64-linux-gcc-9-doc"
                 }
            }
         }
      }
   }
}
