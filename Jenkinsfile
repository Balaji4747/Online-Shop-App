pipeline {
    agent any

    stages {
        stage("Code Clone") {
            steps {
                git url: "https://github.com/Balaji4747/Online-Shop-App.git", branch: "main"
            }
        }

        stage("Build") {
            steps {
                sh "docker build -t online-shop ."
            }
        }

        stage("Test") {
            steps {
                echo "Test the code"
            }
        }

        stage("Push to Docker Hub") {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "dockerHubCreds",
                    passwordVariable: "dockerHubPass",
                    usernameVariable: "dockerHubUser"
                )]) {
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    sh "docker image tag online-shop ${env.dockerHubUser}/online-shop"
                    sh "docker push ${env.dockerHubUser}/online-shop"
                }
            }
        }

    }
}
