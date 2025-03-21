pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'agmcicdskillupjava',  
                    url: 'https://github.com/AananthGopalan965/skillupjava.git'
            }
        }

        stage('Build and Test') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Build & publish Docker Image') {
            steps {
                sh 'docker build -t aananthgopalan965/skillupjava-cicd:1.0.0 .'
                sh 'docker push aananthgopalan965/skillupjava-cicd:1.0.0'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh """
                kubectl create deployment skillupjava-cicd-service --image=aananthgopalan965/skillupjava-cicd:1.0.0 || \
                kubectl set image deployment/skillupjava-cicd java-microservice=aananthgopalan965/skillupjava-cicd:1.0.0
                """
            }
        }

        stage('Create Additional Pod') {
            steps {
                sh 'kubectl run extra-pod --image=aananthgopalan965/skillupjava-cicd:1.0.0 --port=8786'
            }
        }
    }
}
