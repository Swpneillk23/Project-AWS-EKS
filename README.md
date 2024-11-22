# Project-AWS-EKS

1. Install Kubectl CLI by using the below commands :

    a. Install kubectl binary with curl on Linux :

       curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

    b. Validate the binary (optional):
       
       curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
       
       Validate the kubectl binary against the checksum file:
     
       echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

       If valid, the output is:
       
       kubectl: OK

    c. Install kubectl: 
  
       sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

    d. Ensure /usr/local/bin is included in your PATH. You can do this by running:

       echo $PATH

       If /usr/local/bin is not in the output, you can add it by running:

       echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
       source ~/.bashrc

       Verify that the kubectl binary is properly installed in /usr/local/bin:

       ls /usr/local/bin/kubectl

    e. Test to ensure the version you installed is up-to-date:

       kubectl version --client


2. Install AWS CLI – A command line tool for working with AWS services, including Amazon EKS :
   
  
    a. To install the latest version of the AWS CLI, you must uninstall the pre-installed yum version using the following command:

       sudo yum remove awscli

    b. To install the AWS CLI, run the following commands:

       curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
       unzip awscliv2.zip
       sudo ./aws/install

3. After installing AWS CLI, we need to configure aws by running the below command :

      aws configure

      AWS Access Key ID [None]: 
      AWS Secret Access Key [None]: 
      Default region name [None]: us-east-1
      Default output format [None]: 


4. Install docker by running the command :

   sudo yum install docker -y 

   start service by the command : sudo service docker start

   Check Status of docker by the command : sudo service docker status

5. Install terraform :

   a. Use yum-config-manager to add the official HashiCorp Linux repository :

      sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

   b. Install Terraform from the new repository :

      sudo yum -y install terraform


