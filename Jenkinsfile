pipeline {
    agent any

    stages {
        stage('Test stage 1') {
            steps {
                sh 'cd SampleWebApp mvn test'
            }
        }
        stage('Compile the Java Code stage 2') {
            steps {
                sh 'cd SampleWebApp && mvn clean package'
            }
        }
     
        
        stage('Deploy to Tomcat Web Server') {
            steps {
                deploy adapters: [tomcat9(alternativeDeploymentContext: '', credentialsId: '19c29f81-028f-4dc5-a77d-732d2afbf2bd', path: '', url: 'http://54.82.85.148:8080/')], contextPath: 'webapp', war: '**/*.war'
            }
        }

    }
}