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
          sh 'aws devicefarm list-projects'
          
        
      }
    }

  }//end stages
   post {
    always {
      cleanWs()
    }
  }
}//end pipeline


