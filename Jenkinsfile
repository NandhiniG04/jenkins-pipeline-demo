pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                echo '✅ Checking out code from GitHub...'
                checkout scm
                sh 'ls -la'
            }
        }

        stage('Build App') {
            agent {
                docker {
                    image 'node:18'
                    args '-v $PWD:/app -w /app'
                }
            }
            steps {
                echo '🛠️ Installing dependencies using Node.js...'
                sh '''
                    echo "📁 Current directory contents:"
                    ls -la
                    echo "🧱 Running npm install..."
                    npm install
                '''
            }
        }

        stage('Deploy (Simulated)') {
            steps {
                echo '🚀 Simulating deployment...'
                sh 'bash restart_app.sh'
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
