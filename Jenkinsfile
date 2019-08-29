node {
    stage('Source') {
            git credentialsId: 'mo',
            url: 'https://localhost:8080/sysadmin/quantum_complete_setup.git'
        }
    stage('setup') {
        sh './change_name.sh quantumQA'
    }
    stage('build') {
        sh './aws_packer.sh'
    }
    stage('deploy') {
        sh './terraform.sh'
        }
    }
    }
