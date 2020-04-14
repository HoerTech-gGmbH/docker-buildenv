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
&& docker push                    hoertech/docker-buildenv:docker_armv7 ; \
fi"""
                  sh """
if ./has_directory_changed_since . $GIT_PREVIOUS_SUCCESSFUL_COMMIT \
|| ./has_directory_changed_since ./mha_armv7-linux-gcc-7 \
                                 $GIT_PREVIOUS_SUCCESSFUL_COMMIT ; \
then \
docker build --no-cache --pull \
             -t  hoertech/docker-buildenv:mha_armv7-linux-gcc-7 docker \
&& docker push   hoertech/docker-buildenv:mha_armv7-linux-gcc-7 ; \
fi"""

               }
            }
            stage('docker xenial') {
               agent {label "x86_64 && dockerbld"}
               steps {
                  checkout scm
                  sh """
if ./has_directory_changed_since . $GIT_PREVIOUS_SUCCESSFUL_COMMIT \
|| ./has_directory_changed_since ./docker $GIT_PREVIOUS_SUCCESSFUL_COMMIT ; \
then \
docker build --no-cache --pull \
             -t hoertech/docker-buildenv:docker_x86_64 docker \
&& docker push  hoertech/docker-buildenv:docker_x86_64 ; \
fi"""
                  sh """
if ./has_directory_changed_since . $GIT_PREVIOUS_SUCCESSFUL_COMMIT \
|| ./has_directory_changed_since ./mha_x86_64-linux-gcc-5 \
                                 $GIT_PREVIOUS_SUCCESSFUL_COMMIT ; \
then \
docker build --no-cache --pull \
    -t  hoertech/docker-buildenv:mha_x86_64-linux-gcc-5 mha_x86_64-linux-gcc-5 \
&& docker push hoertech/docker-buildenv:mha_x86_64-linux-gcc-5 ; \
fi"""
               }
            }
            stage("bionic") {
               agent {label "x86_64 && dockerbld"}
               steps {
                  checkout scm
                  sh """
if ./has_directory_changed_since . $GIT_PREVIOUS_SUCCESSFUL_COMMIT \
|| ./has_directory_changed_since ./mha_x86_64-linux-gcc-7 \
                                 $GIT_PREVIOUS_SUCCESSFUL_COMMIT \
|| ./has_directory_changed_since ./mha_x86_64-linux-gcc-7-doc \
                                 $GIT_PREVIOUS_SUCCESSFUL_COMMIT ; \
then \
docker build -t hoertech/docker-buildenv:mha_x86_64-linux-gcc-7 \
             --no-cache --pull           mha_x86_64-linux-gcc-7 \
&& docker push  hoertech/docker-buildenv:mha_x86_64-linux-gcc-7 && \
docker build -t hoertech/docker-buildenv:mha_x86_64-linux-gcc-7-doc \
             --no-cache --pull           mha_x86_64-linux-gcc-7-doc \
&& docker push  hoertech/docker-buildenv:mha_x86_64-linux-gcc-7-doc ; \
fi"""
               }
            }
            stage("focal") {
               agent {label "x86_64 && dockerbld"}
               steps {
                  checkout scm
                  sh """
if ./has_directory_changed_since . $GIT_PREVIOUS_SUCCESSFUL_COMMIT \
|| ./has_directory_changed_since ./mha_x86_64-linux-gcc-9 \
                                 $GIT_PREVIOUS_SUCCESSFUL_COMMIT \
|| ./has_directory_changed_since ./mha_x86_64-linux-gcc-9-doc \
                                 $GIT_PREVIOUS_SUCCESSFUL_COMMIT ; \
then \
docker build -t hoertech/docker-buildenv:mha_x86_64-linux-gcc-9 \
             --no-cache --pull           mha_x86_64-linux-gcc-9 \
&& docker push  hoertech/docker-buildenv:mha_x86_64-linux-gcc-9 && \
docker build -t hoertech/docker-buildenv:mha_x86_64-linux-gcc-9-doc \
             --no-cache --pull           mha_x86_64-linux-gcc-9-doc \
&& docker push  hoertech/docker-buildenv:mha_x86_64-linux-gcc-9-doc ; \
fi"""
               }
            }
         }
      }
   }
}
