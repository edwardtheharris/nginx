pipeline {
  agent any
  stages {
    stage('Build Container') {
      steps {
        sh '''docker rm -f test.nginx || true
docker run -d --rm --name test.nginx alpine sh -c \'while sleep 3600; do :; done\';
docker exec test.nginx apk update; 
wait;
docker exec test.nginx apk add python3 ca-certificates;
wait;
docker exec test.nginx ln -sf /usr/bin/python3 /usr/bin/python;
docker exec test.nginx mkdir -p /etc/ssl/private
          '''
      }
    }
    stage('Run Playbook') {
      environment {
        DOCKER_HOST = 'tcp://socat:2375'
      }
      steps {
        sh 'ansible-playbook --vault-password-file /var/jenkins_home/secrets/vault -i tests/inventory tests/test.yml'
      }
    }
    stage('Test') {
      steps {
        sh 'pytest --hosts "docker://root@test.nginx" --junit-xml results.xml'
        junit(testResults: 'results.xml', allowEmptyResults: true, keepLongStdio: true)
      }
    }
    stage('Teardown') {
      steps {
        sh 'docker rm -f test.nginx'
      }
    }
  }
}