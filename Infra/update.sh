aws cloudformation update-stack \
--stack-name $1 \
--template-body file://$2 \
--parameters file://parameters.json \
--region=eu-west-1 \
--capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" 