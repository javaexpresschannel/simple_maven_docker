pipeline {
    agent any 
   tools {
        maven "MAVEN"
     
    }
    stages {
	stage('Checkout') { 
            steps {
                git 'https://github.com/javaexpresschannel/simple_maven_sonar.git'
            }
        }

        stage('Compile') { 
            steps {
                sh "mvn clean compile"
            }
        }
        stage('Build') { 
            
            steps {
                sh "mvn package"
            }
        }   
        stage('Docker Build'){
            steps {
                sh 'docker build -t javaexpress/springboot-docker:${BUILD_NUMBER} .'
            }
        }   
          
        stage('Docker Push'){
            steps {
                sh 'docker push javaexpress/springboot-docker:${BUILD_NUMBER}'
            }
        }   
        stage('Archving') { 
            steps {
                 archiveArtifacts '**/target/*.jar'
            }
        }
    }
}
