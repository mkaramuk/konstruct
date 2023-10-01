# Konstruct

Konstruct is a collection of Ansible, Terraform, and Bash scripts designed to provision a Kubernetes cluster on Google Cloud Platform using Compute Engine.

This cluster will consist of three machines (one master and two worker nodes). You can change your worker node count as you wish by updating the count value in the file `terraform/machines.tf`.

They will be provisioned using Terraform and configured with Ansible.

## Preparing the Provisioning Environment

First of all, you need to enable the Compute Engine API on Google Cloud Platform. Then, create a service account (or use an existing one) and generate an API key for it.

Save the API credentials as `terraform/credentials.json` or edit credentials path in `terraform/variables.tf`.

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

## Configure and install Kubernetes to machines

Run command below at `ansible` folder:

```shell
ansible-playbook -i inventory.ini playbooks/all.yaml
```

If you want more details, you can pass `-v` argument.

After Ansible complete, your kubeconfig file will be at `k8s/config`.

Your cluster does not have a CNI. You must install a CNI plugin before proceeding. If you don't know which plugin to choose, you can use Calico:

```shell
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/calico.yaml
```

## Destroy

Run the command below at `terraform` directory to destroy the cluster:

```shell
terraform destroy
```

## Notes

Even though we provisioned a Kubernetes cluster, they are still compute engine instances. So, if you want to expose services from the cluster, you might need to set firewall rules for them.

## TODO List

-   [ ] Firewall rules must be edited to internal network.
-   [ ] Worker node count could be change by variables.
-   [ ] POD CIDR network must be specify by a variable.
-   [ ] High available cluster.

## Contribute

This is a self-learning project, but it can also help others. If you spot a bug or think that a part of the project could be written better, please open an issue, send a pull request, or contact me. It is up to you to build something better!

That's all, folks!
