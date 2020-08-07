pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven3"
        dockerTool "docker"

    }

    stages {
        stage('VCS') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/vibhor98/hello-world-webapp.git'

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
        stage('Deploy') {
            steps {
                script {
                    withDockerRegistry(
                        credentialsId: 'c01a453f-fe69-47d4-ad63-81dfaa273d7c',
                        toolName: 'docker') {

                        // Build and Push
                        def webAppImage = docker.build("vibhor987/hello-world-webapp:latest");
                        webAppImage.push();
                    }
                }
            }
        }
    }
    post {
        // If Maven was able to run the tests, even if some of the test
        // failed, record the test results and archive the jar file.
        success {
            echo "Success"
        }
        failure {
            echo "Failure! Duh!"
        }
    }
}
