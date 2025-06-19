pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION   = 'us-east-1'
        AWS_ACCOUNT_ID       = '803767876973'
        ECR_REPOSITORY       = 'my-application-repo'
        FRONTEND_SERVICE_NAME = 'frontend-service'
        BACKEND_SERVICE_NAME  = 'backend-service'
        ECS_CLUSTER_NAME      = 'my-cluster'
    }

    stages {
        stage('Build Docker Images') {
            steps {
                script {
                    sh 'docker build -t $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$ECR_REPOSITORY:frontend ./frontend'
                    sh 'docker build -t $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$ECR_REPOSITORY:backend ./backend'
                }
            }
        }

        stage('Push to ECR') {
            steps {
                script {
                    // Login to ECR
                    sh '''
                        aws ecr get-login-password --region $AWS_DEFAULT_REGION | \
                        docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com
                    '''

                    // Push images to ECR
                    sh 'docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$ECR_REPOSITORY:frontend'
                    sh 'docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$ECR_REPOSITORY:backend'
                }
            }
        }

        stage('Update ECS Services') {
            steps {
                script {
                    sh "aws ecs update-service --cluster $ECS_CLUSTER_NAME --service $FRONTEND_SERVICE_NAME --force-new-deployment --region $AWS_DEFAULT_REGION"
                    sh "aws ecs update-service --cluster $ECS_CLUSTER_NAME --service $BACKEND_SERVICE_NAME --force-new-deployment --region $AWS_DEFAULT_REGION"
                }
            }
        }
    }
}

