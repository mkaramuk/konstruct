# Konstruct

Konstruct is a collection of Ansible, Terraform, and Bash scripts designed to provision a Kubernetes cluster on Google Cloud Platform using Compute Engine.

This cluster will consist of three machines (one master and two worker nodes). It will be provisioned using Terraform and configured with Ansible.

## Preparing the Provisioning Environment

First of all, you need to enable the Compute Engine API on Google Cloud Platform. Then, create a service account (or use an existing one) and generate an API key for it.

Save the API credentials as `terraform/credentials.json`.

The last step is to create Terraform variables. Create a file called `terraform/terraform.tfvars` and enter the following information:

```
region     = "<REGION>"
zone       = "<ZONE>"
project_id = "<GCP PROJECT ID>"
user       = "<USERNAME (used to connect to the machines)>"
```

Here's an example `.tfvars` file provided below:

```
region     = "us-west1"
zone       = "us-west1-a"
project_id = "your-gcp-project-id"
user       = "john"
```

## Provision resources

Open a terminal inside the `terraform` folder and type the following commands:

```shell
$ terraform init
$ terraform apply
```

Terraform will ask you if you are sure you want to apply this infrastructure. Type `yes` and wait until it completes.

<!-- ## Configure and install Kubernetes to machines

Run command below at `ansible` folder:

```shell

``` -->

### Coming soon ...
