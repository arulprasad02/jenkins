pipeline {

    environment {
        dockerimagename = "arulprasad02/apache2"
        dockerimage = ""
    }

    agent any

    stages {

        stage('Checkout Source') {
            steps {
                git 'https://github.com/arulprasad02/jenkins.git'
            }
        }

        stage ('Build image') {
            steps {
                script {
                    dockerimage = docker.build dockerimagename
                }
            }
        }
    
    stage ('Pushing Image') {
        environment {
            registryCredential = 'dockerhub-credentials'
        }
        steps {
            script {
                docker.withRegistry ('https://registry.hub.docker.com', 'registryCredential') {
                    dockerimage.push("latest")
                }
            }
        }
    }

    Stages ('Deploying apache container to kubernetes') {
        steps {
            script {
                kubernetesDeploy(configs: "deployment.yaml", "service.yaml")
                }
            }
        }
    }
   
}
