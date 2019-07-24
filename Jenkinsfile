def nginxImage

node('worker') {
  stage('build') {
    nginxImage = docker.build("gcr.io/xander-the-harris-jenkins/nginx")
  }
  stage('push') {
    withCredentials('') {
      docker.withRegistry('gcr.io') {
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
