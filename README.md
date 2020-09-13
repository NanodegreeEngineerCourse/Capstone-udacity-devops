# Capstone-udacity-devops
Capstone Project for Udacity Cloud DevOps Engineers Nanodegree. Septembre 2020
Luis Alejandro Pérez Mínguez


# Deployment
On Infra.

    1 network.yml: contains the network definition (capstone1 in screenshots)
    2 capstone-cluster.yaml: contains de cluster definition (capstone2 in screenshots)
    3 nodegroup-final.yaml: contains cluster nodegroup definition (capstone3 in screenshots)
    4 capstone-jenkins.yaml: contains the jenkins EC2 definition (capstone4 in screenshots)

# Known Issues
Pods are pending because there is not enough resources for all

# Jenkins Machine
Added screenshot to visualize the public DNS address

I used a deployment file as guide for my pods  from [link](https://github.com/valentinburk/udacity-devops-capstone/blob/master/k8s/uc-capstone-deployment.yml)

To create the connection between some components i used the CloudFormation Designer to get the specific code of the component and connection with others. There is not to much information of this in the AWS documentation, i mena, it's not clear and easy to understand how the components interaction must be confiured in cloudformation 
