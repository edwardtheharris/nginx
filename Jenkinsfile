pipeline {
    agent any;
    
    stages {
        stage ('Build') {
            steps {
                echo "building . . ."
                ansiblePlaybook {
                  installation: 'ansible',
                  inventory: 'tests/inventory',
                  limit: 'test-nginx',
                  playbook: 'tests/test.yml',
                  extraVars: []
                }
            }
        }
    }
}
