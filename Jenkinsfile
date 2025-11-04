pipeline {
    agent any

    environment {
        WORKSPACE_PATH = "${env.WORKSPACE}"
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo '✅ Checking out code from GitHub...'
                checkout scm
                sh 'ls -la'
            }
        }

        stage('Build App') {
            steps {
                echo '🛠️ Installing dependencies using Node.js...'
                sh '''
                    echo "📁 Current directory contents:"
                    ls -la
                    echo "🧱 Running npm install..."
                    docker run --rm \
                        -v ${WORKSPACE_PATH}:/app \
                        -w /app node:18 \
                        bash -c "ls -la && npm install"
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
