pipeline {
    agent any 
   tools {
        maven "MAVEN"
     
    }
    stages {
	stage('Checkout') { 
            steps {
                git 'https://github.com/javaexpresschannel/simple_maven_docker.git'
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
        stage('Docker Login'){
            
            steps {
                 withCredentials([string(credentialsId: 'DockerId', variable: 'Dockerpwd')]) {
                    sh "docker login -u javaexpress -p ${Dockerpwd}"
                }
            }                
        }
          
        stage('Docker Push'){
            steps {
                sh 'docker push javaexpress/springboot-docker:${BUILD_NUMBER}'
            }
        }   
 	stage('Docker deploy in Ec2'){
            steps {
               
                sh 'docker run -itd -p  8087:8080 javaexpress/springboot-docker:${BUILD_NUMBER}'
            }
        }
        stage('Archving') { 
            steps {
                 archiveArtifacts '**/target/*.jar'
            }
        }
    }
}