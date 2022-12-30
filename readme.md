## Requirements

- Terraform version `~> 1.3.6`;
- AWS CLI;
- AWS account and [associated credentials](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html) that allow you to create resources.

## How to set up

- In the root, you need to create file `terraform.tfvars` where you need to add variable `my_ip` with your IP address (This will allow only to have an access via SSH to EC2 instance);
- Add your public key to the `keys` folder, name should be `public.pub` (This need to prove your identity when connecting to an Amazon EC2 instance);
- `terraform init` to install all needed providers;
- `terraform apply` to create and apply plan.
