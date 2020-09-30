pipeline {
   agent {label "jenkinsmaster"}
   stages {
      stage('parallel builds') {
         parallel {
            stage('arm docker mha') {
               agent {label "armv7 && dockerbld"}
               steps {
                  checkout scm
                  sh "git clean -fdx ."

                  // Dockerfile in directory docker can be used for armv7 and
                  // for x86_64 docker images. Here we use it for armv7.
                  sh "ln -s docker/ docker_armv7"

                  // """ starts a multi-line string, newlines are passed to sh
                  sh """if sh/changed . docker
                        then sh/build_and_push docker_armv7
                        fi"""

                  sh """if sh/changed . mha_armv7-linux-gcc-7
                        then sh/build_and_push mha_armv7-linux-gcc-7
                        fi"""

                  // We have just obsoleted docker images, save disk space
                  sh "docker system prune -f || true"
               }
            }
            stage('arm tascar') {
               agent {label "armv7 && dockerbld"}
               steps {
                  checkout scm
                  sh "git clean -fdx ."

                  sh """if sh/changed . tascar_armv7-linux-gcc-7
                        then sh/build_and_push tascar_armv7-linux-gcc-7
                        fi"""

                  // We have just obsoleted docker images, save disk space
                  sh "docker system prune -f || true"
               }
            }
            stage('docker xenial') {
               agent {label "x86_64 && dockerbld"}
               steps {
                  checkout scm
                  sh "git clean -fdx ."

                  // Dockerfile in directory docker can be used for armv7 and
                  // for x86_64 docker images. Here we use it for x86_64.
                  sh "ln -s docker/ docker_x86_64"
                  
                  sh """if sh/changed . docker
                        then sh/build_and_push docker_x86_64
                        fi"""
                  sh """if sh/changed . mha_x86_64-linux-gcc-5
                        then sh/build_and_push mha_x86_64-linux-gcc-5
                        fi"""

                  sh """if sh/changed . tascar_x86_64-linux-gcc-5
                        then sh/build_and_push tascar_x86_64-linux-gcc-5
                        fi"""

                  // We have just obsoleted docker images, save disk space
                  sh "docker system prune -f || true"
               }
            }
            stage("bionic") {
               agent {label "x86_64 && dockerbld"}
               steps {
                  checkout scm
                  sh "git clean -fdx ."

                  sh """if sh/changed . mha_x86_64-linux-gcc-7 mha_x86_64-linux-gcc-7-doc
                        then sh/build_and_push mha_x86_64-linux-gcc-7 mha_x86_64-linux-gcc-7-doc
                        fi"""

                  sh """if sh/changed . aptly
                        then sh/build_and_push aptly
                        fi"""

                  // We have just obsoleted docker images, save disk space
                  sh "docker system prune -f || true"
               }
            }
            stage("focal") {
               agent {label "x86_64 && dockerbld"}
               steps {
                  checkout scm
                  sh "git clean -fdx ."
                  
                  sh """if sh/changed . mha_x86_64-linux-gcc-9 mha_x86_64-linux-gcc-9-doc
                        then sh/build_and_push mha_x86_64-linux-gcc-9 mha_x86_64-linux-gcc-9-doc
                        fi"""

                  sh """if sh/changed . kernel_cross-gcc-9
                        then sh/build_and_push kernel_cross-gcc-9
                        fi"""

                  // We have just obsoleted docker images, save disk space
                  sh "docker system prune -f || true"
               }
            }
         }
      }
   }
}
