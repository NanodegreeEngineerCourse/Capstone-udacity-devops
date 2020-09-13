pipeline {
  agent any
  stages {
    stage('Lint') {
      steps {
        sh 'tidy -q -e *.html'
        sh 'sudo docker run --rm -i hadolint/hadolint < Dockerfile'
      }
    }

    stage('Docker build') {
      steps {
        script {
            dockerImage = docker.build registry + ":latest"
        }
      }
    }

    stage('Push Image') {
      steps {
        
        script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
        }
        }
      }
    }

    stage('Scan Dockerfile to find vulnerabilities') {
      steps {
        aquaMicroscanner(imageName: "nenefox/capstone:latest", notCompliesCmd: 'exit 4', onDisallowed: 'fail', outputFormat: 'html')
      }
    }

    stage('K8S Deploy Pods') {
      steps {
        withAWS(credentials: 'aws-credentials', region: eksRegion) {
          sh 'aws eks --region=${eksRegion} update-kubeconfig --name ${eksClusterName}'
          sh 'kubectl apply -f k8s/deployment.yaml'
          sh 'kubectl get pods'
        }

      }
    }

    stage('K8S Check Pods Status') {
      steps {
        withAWS(credentials: 'aws-credentials', region: eksRegion) {
          sh 'aws eks --region=${eksRegion} update-kubeconfig --name ${eksClusterName}'
          sh 'kubectl get pods'
  
        }

      }
    }

    

  }
  environment {
    eksClusterName = 'capstonenenefox'
    eksRegion = 'eu-west-1'
    dockerHub = 'nenefox'
    dockerImage = 'capstone'
    registry = 'nenefox/capstone'
    registryCredential = 'dockerhub_credentials'
  }
}