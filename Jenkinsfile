pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                echo '✅ Checking out code from GitHub...'
                checkout scm
            }
        }

        stage('Build App') {
            steps {
                echo '🛠️ Installing dependencies using Node.js...'
                // Adjust working directory to your repo folder
                sh '''
                    REPO_DIR=$(ls | grep jenkins-pipeline-demo)
                    docker run --rm -v "$PWD":/app -w /app/$REPO_DIR node:18 npm install
                '''
            }
        }

        stage('Deploy (Simulated)') {
            steps {
                echo '🚀 Simulating deployment...'
                sh '''
                    REPO_DIR=$(ls | grep jenkins-pipeline-demo)
                    cd $REPO_DIR
                    bash restart_app.sh
                '''
            }
        }
    }

    post {
        success {
            echo '🎉 Build succeeded!'
        }
        failure {
            echo '❌ Build failed. Check logs for details.'
        }
    }
}
