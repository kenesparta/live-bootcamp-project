SHELL:=/bin/bash
include .env

login:
	@aws sso login --profile ${TF_VAR_aws_sso_profile}

dev/init:
	@terraform init \
		-backend-config="bucket=tf.letsgetrusty.prod" \
		-backend-config="key=prod/letsgetrusty" \
		-backend-config="region=us-east-1" \
		-backend-config="profile=${TF_VAR_aws_sso_profile}"

dev/plan:
	@terraform plan -out create.tfplan

dev/apply: dev/init dev/plan
	@terraform apply create.tfplan

dev/destroy: dev/init
	@terraform destroy

fmt:
	@terraform fmt --recursive
