pipeline {
  agent any
  stages {
    stage('Build Container') {
      steps {
        sh '''docker rm -f test.nginx || true;
          docker run -d --rm --name test.nginx alpine sh -c \'while sleep 3600; do :; done\';
          docker exec test.nginx apk update; 
          wait;
          docker exec test.nginx apk add python3;
          wait;
          docker exec test.nginx ln -sf /usr/bin/python3 /usr/bin/python;
          '''
      }
    }
    stage('Run Playbook') {
      steps {
        ansiblePlaybook(playbook: 'tests/test.yml', colorized: true, disableHostKeyChecking: true, installation: 'ansible', inventory: 'tests/inventory', vaultCredentialsId: 'vault', extras: '--vault-password-file /var/jenkins_home/secrets/vault')
      }
    }
  }
}