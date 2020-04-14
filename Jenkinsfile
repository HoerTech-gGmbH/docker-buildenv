pipeline {
   agent {label "jenkinsmaster"}
   stages {
      stage('parallel builds') {
         parallel {
            stage('arm') {
               agent {label "armv7 && dockerbld"}
               steps {
                  checkout scm

                  sh """
if ./has_directory_changed_since . $GIT_PREVIOUS_SUCCESSFUL_COMMIT \
|| ./has_directory_changed_since ./docker $GIT_PREVIOUS_SUCCESSFUL_COMMIT ; \
then \
docker build --no-cache --pull -t hoertech/docker-buildenv:docker_armv7 docker \
&& docker push                    hoertech/docker-buildenv:docker_armv7 \
fi"""
                  sh """
if ./has_directory_changed_since . $GIT_PREVIOUS_SUCCESSFUL_COMMIT \
|| ./has_directory_changed_since ./mha_armv7-linux-gcc-7 \
                                 $GIT_PREVIOUS_SUCCESSFUL_COMMIT ; \
then \
docker build --no-cache --pull \
             -t  hoertech/docker-buildenv:mha_armv7-linux-gcc-7 docker \
&& docker push   hoertech/docker-buildenv:mha_armv7-linux-gcc-7 \
fi"""

               }
            }
            stage('docker xenial') {
               agent {label "x86_64 && dockerbld"}
               steps {
                  checkout scm
                  sh "env"
                  sh "id && stat /var/run/docker.sock && ls -la /var/ && ls -la /var/run"
                  sh "docker build --no-cache --pull -t hoertech/docker-buildenv:docker_x86_64 docker"
                  sh "docker push hoertech/docker-buildenv:docker_x86_64"


                  sh "docker build --no-cache --pull -t hoertech/docker-buildenv:mha_x86_64-linux-gcc-5  mha_x86_64-linux-gcc-5"
                  sh "docker push hoertech/docker-buildenv:mha_x86_64-linux-gcc-5"
               }
            }
            stage("bionic") {
               agent {label "x86_64 && dockerbld"}
                 steps {
                    checkout scm
                    sh "docker build --no-cache --pull -t hoertech/docker-buildenv:mha_x86_64-linux-gcc-7  mha_x86_64-linux-gcc-7"
                    sh "docker push hoertech/docker-buildenv:mha_x86_64-linux-gcc-7"

                    sh "docker build --no-cache --pull -t hoertech/docker-buildenv:mha_x86_64-linux-gcc-7-doc  mha_x86_64-linux-gcc-7-doc"
                    sh "docker push hoertech/docker-buildenv:mha_x86_64-linux-gcc-7-doc"

                 }
            }
            stage("focal") {
               agent {label "x86_64 && dockerbld"}
                 steps {
                    checkout scm
                    sh "docker build --no-cache --pull -t hoertech/docker-buildenv:mha_x86_64-linux-gcc-9  mha_x86_64-linux-gcc-9"
                    sh "docker push hoertech/docker-buildenv:mha_x86_64-linux-gcc-9"

                    sh "docker build --no-cache --pull -t hoertech/docker-buildenv:mha_x86_64-linux-gcc-9-doc  mha_x86_64-linux-gcc-9-doc"
                    sh "docker push hoertech/docker-buildenv:mha_x86_64-linux-gcc-9-doc"

                 }
            }
         }
      }
   }
}
