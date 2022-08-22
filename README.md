# SSH into EC2

```sh
ssh -i $HOME/Desktop/app-key-pair.pem centos@ec2-18-212-22-13.compute-1.amazonaws.com
```

# Pre-requisites

Install Terraform (Homebrew on OS X)

```
$ brew tap hashicorp/tap
$ brew install hashicorp/tap/terraform
$ terraform -help
```

# Setup

1. Create main.tff
2. Initialize Terraform:

```sh
$ terraform init
```

3. Provision the NGINX server container with apply:

```sh
$ terraform apply
```

4. Verify the existence of the NGINX container by visiting localhost:8000 in your web browser or running `docker ps` to see the container.
5. Stop the container:

```sh
$ terraform destroy
```
