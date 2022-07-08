pipeline{
    agent any
        tools{
            terraform "terraform-bookinglet"
            }

        // docker{
        //     image 'hashicorp/terraform:latest'
        //     args '-u root:root'
        // }

    parameters {
        // booleanParam(name: 'destroy', defaultValue: false, description: 'would u want to destroy this terraform')
        choice(name: 'selection', choices:['apply','destroy'],description:'to select which process gonna pick')

    }

    stages{
        stage('terraform init'){
            steps{
                withAWS(credentials: 'terraform',region: 'ap-southeast-2'){
                echo 'its time to go'
                sh 'terraform init'
                }
            }
        }

        stage('terraform apply/destroy'){
            // when{
            //     equlas expected: apply, actual: params.selection
            //     }
            
            steps{
                withAWS(credentials: 'terraform',region: 'ap-southeast-2'){
                echo params.selection
                echo 'its time to apply'
                sh """terraform '${params.selection}' --auto-approve"""
                // sh 'rm -rf terraform.tfvars'
                // why? tfvaes still stay in github
                }
            }
        }
        
        // stage('terraform destroy'){
        //     when{
        //         equlas expected: destroy, actual: params.selection
        //         }

        //     steps
        //     {
        //         echo 'im so bad that u dont like me anymore'
        //         sh 'terraform destroy --auto-approve'
        //     }
        // }
    }

        post{
            always{
                cleanWs()
            }
        }

}
