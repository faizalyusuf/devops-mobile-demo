@Library('jenkins-library') _

pipeline {
  
  agent {label 'macagent'}
  
  stages {
        
    stage('Build') {
      steps {
        sh 'chmod +x gradlew && ./gradlew clean && ./gradlew assembleDebug'
      }
    }
    stage('Code Scan'){
      steps{
        script{
              def scannerHome = tool 'sonar-scanner';
                withSonarQubeEnv('sonarqube') {
                  sh "${scannerHome}/bin/sonar-scanner"
                }   
        }
      }
    }
    stage('Install & Test'){
      steps{
          dir('appium-test'){
            sh 'sh test.sh'
            sh './gradlew clean && ./gradlew test'
          }
      }
    }
    /*stage('Upload to HockeyApp'){
      steps{
            hockeyApp applications: [[apiToken: 'be4b411ba7de42d3b64b8ffd5b464ff7', downloadAllowed: false, filePath: '**//*apk/app-debug.apk', mandatory: false, notifyTeam: false, releaseNotesMethod: none(), uploadMethod: appCreation(false)]], debugMode: false, failGracefully: false
      }
    }*/
    stage('Upload to Artifactory'){
      steps{
        script {
          		  def server = Artifactory.server('artifactory')
                  def uploadSpec = """{
                      "files":[
                                {
                                "pattern": "**/apk/app-debug.apk",
                                "target": "mobile-demo/app-debug-${BUILD_NUMBER}.apk"
                                }
                      ]
                  }"""                    
                      server.upload(uploadSpec)
                      def buildInfo = server.upload(uploadSpec)
                      server.publishBuildInfo(buildInfo)
        }
     }
    }
    /*stage('Archive artifacts'){
      steps{
        archiveArtifacts artifacts: '**//*apk/app-debug.apk', onlyIfSuccessful: true
      }
    }*/
  }//end stages
  post {
    always {
      script {
      	try {
          // Use slackNotifier.groovy from shared library and provide current build result as parameter    
          slackNotifier(currentBuild.currentResult)
            cleanWs()
        }catch (err){
            echo "All good"
         }
      }//end script 
      cleanWs()
    }
  }
}//end pipeline
