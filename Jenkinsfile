pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '''docker run -d --rm --name test.nginx alpine sh -c \'while sleep 3600; do :; done\'
'''
      }
    }
  }
}