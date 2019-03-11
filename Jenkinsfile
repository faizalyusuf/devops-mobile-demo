pipeline {

  agent {label 'macagent'}
  
  stages {
    stage('Build') {
      steps {
        sh 'chmod +x gradlew && ./gradlew clean && ./gradlew assembleDebug'
      }
    }
    /*stage('Code Scan'){
      steps{
        script{
              def scannerHome = tool 'sonar-scanner';
                withSonarQubeEnv('sonarqube') {
                  sh "${scannerHome}/bin/sonar-scanner"
                }
        }
      }
    }*/
    //Installs the apk to the test device and runs the appium tests
    stage('Install & Test'){
      steps{
          dir('appium-test'){
            sh 'sh test.sh'
            sh './gradlew clean && ./gradlew test'
          }
      }
    }
    //Archives the built apk in Jenkins so it can be downloaded
    stage('Archive artifacts'){
      steps{
        archiveArtifacts artifacts: '**/apk/app-debug.apk', onlyIfSuccessful: false
      }
    }
    //Push APK to cloud for testing on multiple devices

    stage('Proceed to Cloud Testing'){
        steps{
          input 'Promote to Cloud For Testing'
        }
    } 

    stage('Uploading APK'){

      steps{
        get_project_arn{
          sh "arn=aws devicefarm list-projects | jq '.projects[0].arn'"
          sh 'echo $arn'
        }  


      }
    }

  }//end stages
  /* post {
    always {
      cleanWs()
    }
  }*/
}//end pipeline


