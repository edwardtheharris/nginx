pipeline {
    agent any;
    
    stages {
        stage ('Build') {
            steps {
                echo "building . . ."
                ansiblePlaybook installation: 'ansible', inventory: 'tests/inventory', limit: 'nginx', playbook: 'tests/test.yml'
            }
        }
    }
}
