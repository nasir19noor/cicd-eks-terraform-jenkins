#!/usr/bin/env grrovy
pipeline {
    agent any
	environment {
	    AWS_ACCESS_KEY_ID = credentials('AWS_SECRET_ACCESS_KEY')
            AWS_SECRET_ACCESS_KEY = credentials('AWS_ACCESS_KEY_ID')
	    AWS_DEFAULT_REGION = "ap-southeast-1"
	}
	stages{ 
	    stage("create an EKS Cluster") {
		steps {
			script {
				dir('terraform/eks') {
					sh "terraform init"
					sh "terraform apply -auto-approve"
					}	
				}	
			}
		}
	    stage("Deploy to EKS") {
		steps {
			script {
				dir('kubernetes') {
					sh "aws eks update-kubeconfig --name nasir-cicd-eks-cluster"
					sh "kubectl apply -f nginx-deplyment.yaml"
						sh "kubectl apply -f nginx-service.yaml"
					}
				}
			}
		}
	}
}	
