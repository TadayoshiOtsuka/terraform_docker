SHELL=ash

.PHONY: $(shell egrep -oh ^[a-zA-Z0-9][a-zA-Z0-9_-]+: $(MAKEFILE_LIST) | sed 's/://')

fmt:
	terraform fmt -check -recursive

init: fmt
	terraform init

plan-stg: fmt
	terraform plan -var-file stg.tfvars

plan-stg-verbose: fmt
	TF_LOG=debug terraform plan -var-file stg.tfvars

apply-stg: fmt
	terraform apply -var-file stg.tfvars
