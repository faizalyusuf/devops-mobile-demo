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
          sh 'aws devicefarm create-upload --project-arn arn:aws:devicefarm:us-west-2:340227591783:project:6d97c28e-0444-4eca-ad1f-79dc5dd9e927 --name app-debug-unaligned.apk  --type ANDROID_APP  && sleep 600'      
      }
    }

  }//end stages
   /*post {
    always {
      cleanWs()
    }
  }*/
}//end pipeline


