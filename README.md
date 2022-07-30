# terraform_docker

・Terraform  
・aws-cli-v2  
・Docker(DooD)  
・tfsec  
・tflint

Set-up  
Set the correct values by referring to `.env.example` in `environments/prod` & `environments/stg`

```
make set-up
or
docker-compose build
```

Manage staging resources

```
% make tf-stg
/terraform/environments/stg # make init
/terraform/environments/stg # make plan-stg
/terraform/environments/stg # make apply-stg
```

Manage production resources

```
% make tf-prod
/terraform/environments/prod # make init
/terraform/environments/prod # make plan-prod
/terraform/environments/prod # make apply-prod
```
