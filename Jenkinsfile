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
        get_project_arn {
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


