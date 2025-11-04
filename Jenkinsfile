pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                echo '✅ Checking out code from GitHub...'
                checkout scm
                sh 'ls -la'   // 👈 This will confirm package.json exists
            }
        }

        stage('Build App') {
            steps {
                echo '🛠️ Installing dependencies using Node.js...'
                sh '''
                    echo "📁 Current directory contents:"
                    ls -la
                    echo "🧱 Running npm install..."
                    docker run --rm -v "$(pwd)":/app -w /app node:18 npm install
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
