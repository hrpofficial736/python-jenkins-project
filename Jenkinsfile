
pipeline {
  agent any 
  
  stages {
    stage ("create env") {
      steps {
        script {
          echo "Creating virtual environment"
          bash "python3 -m venv env"
          bash "source env/bin/activate"
        }
      }
    }


    stage ("test") {
      steps {
        script {
          bash "pytest tests/"
        }
      }
    }

    stage ("build docker image") {
      steps {
        echo "Building docker image..."
        withCredentials ([usernamePassword(credentialsId: "docker-hub-repo", passwordVariable: "PASSWORD", usernameVariable: "USERNAME")]) {
          bash "docker build -t harshit736/my-jenkins-repo:fapi-app-1.2 ."
          bash "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
          bash "docker push harshit736/my-jenkins-repo:fapi-app-1.2"
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