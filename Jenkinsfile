pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '''docker run -d --rm --name test.nginx alpine sh -c \'while sleep 3600; do :; done\'
'''
        sh '''docker exec test.nginx apk update
docker exec test.nginx apk add python3
docker exec test.nginx ln -sf /usr/bin/python3 /usr/bin/python'''
      }
    }
  }
}