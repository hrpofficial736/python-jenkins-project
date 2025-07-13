pipeline {
  agent any
  parameters {
    string(name: "Application Name", description: "Enter the name of your application", defaultValue: "")
    choice(name: "Version", choices: ["0.1.0", "0.1.1", "0.1.2"], description: "Specify the version to deploy")
  }
  stages {
    stage ("build") {
      steps {
        echo "Building app..."
      }
    }
    stage ("test") {
      steps {
        echo "Testing app..."
      }
    }
    stage ("deploy") {
      when {
        expression {
          params.Version == "0.1.1"
        }
      }
      steps {
        echo "Deploying app as ${params.Version}..."
      }
    }
  }
  post {
    always {
      echo "Completed process..."
    }
    failure {
      echo "Damn it Harry, process failed!"
    }
    success {
      echo "Well done Harry!"
    }
  }
}


