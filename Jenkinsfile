def gv

pipeline {
  agent any
  parameters {
    string(name: "Application Name", description: "Enter the name of your application", defaultValue: "")
    choice(name: "Version", choices: ["0.1.0", "0.1.1", "0.1.2"], description: "Specify the version to deploy")
  }
  stages {
    stage ("init") {
      steps {
        script {
          gv = load "script.groovy"
        }
      }
    }
    stage ("build") {
      steps {
        script {
        gv.build()
      }
      }
    }
    stage ("test") {
      steps {
        script {
        gv.test()
      }
      }
    }
    stage ("deploy") {
      when {
        expression {
          params.Version == "0.1.1"
        }
      }
      input {
        message "What is the programming language used in this project?"
        ok "Language selected"
        parameters {
          choice(name: "Language", choices: ["Python", "Typescript", "Dart"], description: "")
        }
      }
      steps {
        script {
        gv.deploy()
        echo "Deploying as ${Language} project..."
      }
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


