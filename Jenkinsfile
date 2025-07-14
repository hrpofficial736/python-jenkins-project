
pipeline {
  agent any 
  
  stages {
    stage ("create env") {
      steps {
        script {
          echo "Creating virtual environment"
          sh '''python3 -m venv env
          . env/bin/activate
          pip install -r requirements.txt
          '''
        }
      }
    }


    stage ("test") {
      steps {
        script {
          echo "Testing app..."
        }
      }
    }

    stage ("build docker image") {
      steps {
        echo "Building docker image..."
        withCredentials ([usernamePassword(credentialsId: "docker-hub-creds", passwordVariable: "PASSWORD", usernameVariable: "USERNAME")]) {
          sh "groups"
          sh "newgrp"
          sh "docker ps"
          sh "docker build -t harshit736/my-jenkins-repo:fapi-app-1.2 ."
          sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
          sh "docker push harshit736/my-jenkins-repo:fapi-app-1.2"
        }
      }
    }


    stage ("deploy") {
      steps {
        echo "Deploying app..."
      }
    }
  }
}