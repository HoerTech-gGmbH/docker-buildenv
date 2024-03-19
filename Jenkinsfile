pipeline {
   agent any
   stages {
      stage('parallel builds') {
         parallel {

            // update images for docker_armv7 and liblsl_armv7 
            stage('armv7 docker liblsl') {
               agent {label "armv7 && dockerbld"}
               steps {
                  checkout scm
                  //sh "git clean -fdx ."

                  // Dockerfile in directory docker can be used to build docker
                  // images for armv7, aarch64, or x86_64.  Here we use it for
                  // armv7.
                  //sh "ln -s docker/ docker_armv7"

                  // """ starts a multi-line string, newlines are passed to sh
                  //sh """if sh/changed . docker
                  //      then sh/build_and_push docker_armv7
                  //      fi"""

                  //sh """if sh/changed . liblsl_armv7-linux-gcc-7
                  //      then sh/build_and_push liblsl_armv7-linux-gcc-7
                  //      fi"""

                  //sh """if sh/changed . liblsl_armv7-linux-gcc-10
                  //      then sh/build_and_push liblsl_armv7-linux-gcc-10
                  //      fi"""

                  // We have just obsoleted docker images, save disk space
                  //sh "docker system prune -f || true"
               }
            }

            // update images for mha_armv7 and tascar_armv7
            stage('armv7 mha tascar') {
               agent {label "armv7 && dockerbld"}
               steps {
                  checkout scm
                  sh "git clean -fdx ."

                  sh """if sh/changed . mha_armv7-linux-gcc-10
                        then sh/build_and_push mha_armv7-linux-gcc-10
                        fi"""

                  sh """if sh/changed . mha_armv7-linux-gcc-7
                        then sh/build_and_push mha_armv7-linux-gcc-7
                        fi"""

                  sh """if sh/changed . tascar_armv7-linux-gcc-10
                        then sh/build_and_push tascar_armv7-linux-gcc-10
                        fi"""

                  sh """if sh/changed . tascar_armv7-linux-gcc-7
                        then sh/build_and_push tascar_armv7-linux-gcc-7
                        fi"""

                  // We have just obsoleted docker images, save disk space
                  sh "docker system prune -f || true"
               }
            }

            // update image for docker_aarch64, liblsl_aarch64 and mha_aarch64
            stage('aarch64 docker liblsl') {
               agent {label "dockerARM64"}
               steps {
                  checkout scm
                  sh "git clean -fdx ."

                  // Dockerfile in directory docker can be used to build docker
                  // images for armv7, aarch64, or x86_64.  Here we use it for
                  // aarch64.
                  sh "ln -s docker/ docker_aarch64"

                  // Use dockerhub auth token with ensured deletion after usage
                  sh "mkdir -p ~/.docker"
                  sh "rm -f ~/.docker/config.json"
                  withCredentials([file(credentialsId: 'dockerhub_hoertech',
                                        variable: 'config_json')]) {
                      sh 'ln -s $config_json ~/.docker/config.json'

                      sh """if sh/changed . docker
                            then sh/build_and_push docker_aarch64
                            fi"""

                      sh """if sh/changed . liblsl_aarch64-linux-gcc-7
                            then sh/build_and_push liblsl_aarch64-linux-gcc-7
                            fi"""

                      sh """if sh/changed . liblsl_aarch64-linux-gcc-10
                            then sh/build_and_push liblsl_aarch64-linux-gcc-10
                            fi"""

                  }
                  // remove dangling link
                  sh "rm -f ~/.docker/config.json"

                  // We have just obsoleted docker images, save disk space
                  sh "docker system prune -f || true"
               }
            }

            // update image for docker_aarch64, liblsl_aarch64 and mha_aarch64
            stage('aarch64 mha tascar') {
               agent {label "aarch64 && dockerbld"}
               steps {
                  checkout scm
                  sh "git clean -fdx ."

                  sh """if sh/changed . mha_aarch64-linux-gcc-10
                        then sh/build_and_push mha_aarch64-linux-gcc-10
                        fi"""

                  sh """if sh/changed . mha_aarch64-linux-gcc-7
                        then sh/build_and_push mha_aarch64-linux-gcc-7
                        fi"""

                  sh """if sh/changed . tascar_aarch64-linux-gcc-10
                        then sh/build_and_push tascar_aarch64-linux-gcc-10
                        fi"""

                  // We have just obsoleted docker images, save disk space
                  sh "docker system prune -f || true"
               }
            }

            // update the x86_64 docker builder
            stage('x86_64 docker') {
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

                  // We have just obsoleted docker images, save disk space
                  sh "docker system prune -f || true"
               }
            }

            // update all x86_64 images for bionic
            stage("x86_64 bionic") {
               agent {label "x86_64 && dockerbld"}
               steps {
                  checkout scm
                  //sh "git clean -fdx ."

                  //sh """if sh/changed . tascar_x86_64-linux-gcc-7
                  //      then sh/build_and_push tascar_x86_64-linux-gcc-7
                  //      fi"""

                  //sh """if sh/changed . aptly
                  //      then sh/build_and_push aptly
                  //      fi"""

                  // We have just obsoleted docker images, save disk space
                  //sh "docker system prune -f || true"
               }
            }

            // update all x86_64 images for focal
            stage("x86_64 focal") {
               agent {label "x86_64 && dockerbld"}
               steps {
                  checkout scm
                  sh "git clean -fdx ."
                  
                  sh """if sh/changed . octave_x86_64-linux-gcc-9
                        then sh/build_and_push octave_x86_64-linux-gcc-9
                        fi"""

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

            // update all x86_64 images for jammy
            stage("x86_64 jammy") {
               agent {label "x86_64 && dockerbld"}
               steps {
                  checkout scm
                  sh "git clean -fdx ."

                  sh """if sh/changed . octave_x86_64-linux-gcc-11
                        then sh/build_and_push octave_x86_64-linux-gcc-11
                        fi"""

                  sh """if sh/changed . mha_x86_64-linux-gcc-11 mha_x86_64-linux-gcc-11-doc
                        then sh/build_and_push mha_x86_64-linux-gcc-11 mha_x86_64-linux-gcc-11-doc
                        fi"""

                  sh """if sh/changed . liblsl_x86_64-linux-gcc-11
                        then sh/build_and_push liblsl_x86_64-linux-gcc-11
                        fi"""

                  sh """if sh/changed . tascar_x86_64-linux-gcc-11
                        then sh/build_and_push tascar_x86_64-linux-gcc-11
                        fi"""

                  // We have just obsoleted docker images, save disk space
                  sh "docker system prune -f || true"
               }
            }

            // update all x86_64 images for noble
            stage("x86_64 noble") {
               agent {label "x86_64 && dockerbld"}
               steps {
                  checkout scm
                  sh "git clean -fdx ."

                  sh """if sh/changed . octave_x86_64-linux-gcc-13
                        then sh/build_and_push octave_x86_64-linux-gcc-13
                        fi"""

                  sh """if sh/changed . mha_x86_64-linux-gcc-13 mha_x86_64-linux-gcc-13-doc
                        then sh/build_and_push mha_x86_64-linux-gcc-13 mha_x86_64-linux-gcc-13-doc
                        fi"""

                  sh """if sh/changed . liblsl_x86_64-linux-gcc-13
                        then sh/build_and_push liblsl_x86_64-linux-gcc-13
                        fi"""

                  //sh """if sh/changed . tascar_x86_64-linux-gcc-13
                  //      then sh/build_and_push tascar_x86_64-linux-gcc-13
                  //      fi"""

                  // We have just obsoleted docker images, save disk space
                  sh "docker system prune -f || true"
               }
            }
         }
      }
   }
}
