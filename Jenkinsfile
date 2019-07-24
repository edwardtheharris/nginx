def nginxImage

node('worker') {
  stage('checkout' ) {
    checkout scm
  }
  stage('build') {
    nginxImage = docker.build("gcr.io/xander-the-harris-jenkins/nginx")
  }
  stage('push') {
    withCredentials([
      usernamePassword(credentialsId: 'gcr:xander-the-harris-jenkins',
											 passwordVariable: 'gcr_pass',
											 usernameVariable: 'gcr_user')
    ]) {
      docker.withRegistry('https://gcr.io',
                          'gcr:xander-the-harris-jenkins') {
        nginxImage.push("v${env.BUILD_NUMBER}")
      }
    }
  }
}
//     stage('Run Playbook') {
//       steps {
//         sh '''#!/bin/bash
// /usr/bin/ansible-playbook -vv --vault-password-file /var/jenkins_home/secrets/vault -i tests/inventory tests/test.yml'''
//       }
//     }
    // stage('Test') {
    //   steps {
    //     sh 'pytest --hosts "docker://root@test.nginx" --junit-xml results.xml'
    //     junit(testResults: 'results.xml', allowEmptyResults: true, keepLongStdio: true)
    //   }
    // }
    // stage('Teardown') {
    //   steps {
    //     sh 'docker rm -f test.nginx'
    //   }
    // }
