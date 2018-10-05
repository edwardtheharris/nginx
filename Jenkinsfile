pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'building . . .'
        ansiblePlaybook(installation: 'ansible', inventory: 'tests/inventory', limit: 'all', playbook: 'tests/test.yml', extraVars: 'host=wat')
      }
    }
  }
}