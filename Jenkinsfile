pipeline {
    agent any

    environment {
        IMAGE_NAME = 'mnshkumr/node-js-sample'
        IMAGE_TAG = 'latest'
        KUBE_DEPLOYMENT = 'node-app-deployment'
        NAMESPACE = 'default'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/mnsh37/node-js-sample.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                        sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh """
                    kubectl apply -f deployment.yaml
                    kubectl apply -f service.yaml
                    """
                }
            }
        }
    }
}
