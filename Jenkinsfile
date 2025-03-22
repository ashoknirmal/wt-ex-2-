pipeline {
    agent any

    environment {
        IMAGE_NAME = 'ashok3182004/wt-ex-2'
        CONTAINER_NAME = 'wt-ex-2-container'
        KUBE_DEPLOYMENT = 'wt-ex-2-deployment'
        KUBE_NAMESPACE = 'default'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/ashoknirmal/wt-ex-2-.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                    sh 'docker push $IMAGE_NAME'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s-deployment.yaml'
            }
        }
    }
}
