#!/usr/bin/env groovy

pipeline {
    agent {
        docker {
            image 'alpine:latest'
        }
    }
    
    stages {
        stage ('Build') {
            steps {
                echo "building . . ."
                ansiblePlaybook playbook: 'tests/test.yml',
                  installation: 'ansible',
                  inventory: 'tests/inventory',
                  limit: 'test-nginx',
                  extraVars: []
            }
        }
    }
}
