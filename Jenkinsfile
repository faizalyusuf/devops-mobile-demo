pipeline {

  agent {label 'macagent'}
  stages {
    
    //Push APK to cloud for testing on multiple devices

    stage('Proceed to Cloud Testing'){
        steps{
          input 'Promote to Cloud For Testing'
        }
    } 

    stage('Uploading APK'){
      steps{
          sh 'aws devicefarm create-upload --project-arn arn:aws:devicefarm:us-west-2:705582597265:project:2c21a412-bb7b-4657-a28c-d7d78b3888f7 --name app-debug-unaligned.apk  --type ANDROID_APP  && sleep 600'
        
      }
    }

  }//end stages
   post {
    always {
      cleanWs()
    }
  }
}//end pipeline


