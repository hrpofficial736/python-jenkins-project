
pipeline {
  agent any 
  
  stages {
    stage ("create env") {
      steps {
        script {
          echo "Creating virtual environment"
          sh "python3 -m venv env"
          sh "source env/bin/activate"
        }
      }
    }


    stage ("test") {
      steps {
        script {
          sh "pytest tests/"
        }
      }
    }

    stage ("build docker image") {
      steps {
        echo "Building docker image..."
        withCredentials ([usernamePassword(credentialsId: "docker-hub-repo", passwordVariable: "PASSWORD", usernameVariable: "USERNAME")]) {
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