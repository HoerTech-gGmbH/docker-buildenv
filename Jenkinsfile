pipeline {
   agent {label "jenkinsmaster"}
   stages {
      stage('parallel builds') {
         parallel {

            // update images docker_armv7 and mha_armv7-linux-gcc-7
            stage('armv7 docker mha') {
               agent {label "armv7 && dockerbld"}
               steps {
                  checkout scm
                  sh "git clean -fdx ."

                  // Dockerfile in directory docker can be used to build docker
                  // images for armv7, aarch64, or x86_64.  Here we use it for
                  // armv7.
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

            // update image tascar_armv7-linux-gcc-7
            stage('armv7 tascar') {
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

            // update image docker_aarch64
            stage('aarch64 docker') {
               agent {label "arch64 && dockerbld"}
               steps {
                  checkout scm
                  sh "git clean -fdx ."

                  // Dockerfile in directory docker can be used to build docker
                  // images for armv7, aarch64, or x86_64.  Here we use it for
                  // aarch64.
                  sh "ln -s docker/ docker_aarch64"

                  // """ starts a multi-line string, newlines are passed to sh
                  sh """if sh/changed . docker
                        then sh/build_and_push docker_aarch64
                        fi"""

                  // We have just obsoleted docker images, save disk space
                  sh "docker system prune -f || true"
               }
            }

            // update the x86_64 docker builder and all images for xenial
            stage('x86_64 docker xenial') {
               agent {label "x86_64 && dockerbld"}
               steps {
                  checkout scm
                  sh "git clean -fdx ."

                  // Dockerfile in directory docker can be used to buils docker
                  // images for armv7, aarch64, or x86_64.  Here we use it for
                  // x86_64.
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

            // update all x86_64 images for bionic
            stage("x86_64 bionic") {
               agent {label "x86_64 && dockerbld"}
               steps {
                  checkout scm
                  sh "git clean -fdx ."

                  sh """if sh/changed . mha_x86_64-linux-gcc-7 mha_x86_64-linux-gcc-7-doc
                        then sh/build_and_push mha_x86_64-linux-gcc-7 mha_x86_64-linux-gcc-7-doc
                        fi"""

                  sh """if sh/changed . tascar_x86_64-linux-gcc-7
                        then sh/build_and_push tascar_x86_64-linux-gcc-7
                        fi"""
                  
                  sh """if sh/changed . aptly
                        then sh/build_and_push aptly
                        fi"""

                  // We have just obsoleted docker images, save disk space
                  sh "docker system prune -f || true"
               }
            }

            // update all x86_64 images for focal
            stage("x86_64 focal") {
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

                  sh """if sh/changed . tascar_x86_64-linux-gcc-9
                        then sh/build_and_push tascar_x86_64-linux-gcc-9
                        fi"""

                  // We have just obsoleted docker images, save disk space
                  sh "docker system prune -f || true"
               }
            }
         }
      }
   }
}
