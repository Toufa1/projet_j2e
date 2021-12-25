pipeline {
    agent any
     tools
    {
       maven "Maven 3.8"
    } 

 stages {
      stage('clone') {
           steps {
             
                git branch: 'master', url: 'https://gitlab.com/Toufa170/projet_j2e.git'
             
          }
        }
 
   stage('Execute war Maven') {
           steps {
             
                sh 'mvn package'             
          }
        }

    stage('Docker Build') {
           steps {
              

                sh 'docker build -t myimage:latest .' 

          }
        }
        stage('Run Docker container on Jenkins') {
             
            steps {
                
                sh "docker rm -f conteneurdocker"
                sh "docker run -d -p 8082:8080 --name conteneurdocker myimage:latest"
 
            }
        }

        stage('Push on dockerhub') {
            
              steps {
                  sh "docker login -u fatoutraore -p Fatoutraore0924"

                  sh "docker tag myimage:latest fatoutraore/repo_projet:latest"
                  sh "docker push fatoutraore/repo_projet:latest"

 
              }
          }
     
        stage ('pull cointainer') {
            
            steps { 
                sh 'docker stop `docker ps | grep 8082 | awk \'{print $1}\'`'
                sh "docker rm /projet1"
                sh "docker pull fatoutraore/repo_projet:latest"
                sh "docker run -d -p 8082:8080 --name projet1 fatoutraore/repo_projet:latest"
                sleep 2
                sh 'curl --connect-timeout 3 http://92.222.24.10:8082'
            }
        }
 }
 
}
//
