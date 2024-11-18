pipeline {
    agent any

    environment {
        IMAGE_NAME = 'basic-web-app'
        CONTAINER_NAME = 'web-app-container'
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning the repository...'
                git 'https://github.com/Kundan547/Jenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t ${IMAGE_NAME} .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container...'
                sh '''
                docker rm -f ${CONTAINER_NAME} || true
                docker run -d --name ${CONTAINER_NAME} -p 8080:80 ${IMAGE_NAME}
                '''
            }
        }

        stage('Test Web App') {
            steps {
                echo 'Testing web app...'
                sh '''
                curl -s http://localhost:8080 | grep -q 'Welcome to My Basic Web App' && echo "Test Passed!" || exit 1
                '''
            }
        }
    }

    post {
        always {
            echo 'Cleaning up workspace...'
            deleteDir()
        }
        success {
            echo 'Build and deployment successful!'
        }
        failure {
            echo 'Build or deployment failed. Please check the logs.'
        }
    }
}
