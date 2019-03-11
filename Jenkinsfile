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
          sh 'aws devicefarm create-upload --project-arn arn:aws:devicefarm:us-west-2:340227591783:project:504e5963-4069-4ad1-98cc-2067cf0185f0 --name app-debug-unaligned.apk  --type ANDROID_APP  && sleep 600'
        
      }
    }

  }//end stages
   post {
    always {
      cleanWs()
    }
  }
}//end pipeline


