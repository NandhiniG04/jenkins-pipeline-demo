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
                sh '''
                    docker run --rm -v "$PWD":/app -w /app node:18 npm install
                '''
            }
        }

        stage('Deploy (Simulated)') {
            steps {
                echo '🚀 Simulating deployment...'
                sh '''
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
