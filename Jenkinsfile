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


 }
 
}
