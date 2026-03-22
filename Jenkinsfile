pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "yourdockerhubusername/flight-app"
        TAG = "latest"
        GIT_REPO = "https://github.com/Mahesh1-code141/Flight_project.git"
    }

    stages {

        stage('Clone Code') {
            steps {
                git branch: 'main',
                    url: "${GIT_REPO}",
                    credentialsId: 'Github'
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:$TAG .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'Dockerhub_CRED',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh 'docker push $DOCKER_IMAGE:$TAG'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s-deployment.yaml'
                sh 'kubectl apply -f k8s-service.yaml'
            }
        }
    }
}
