aws ec2 describe-instances --output json | jq -r '.Reservations[].Instances[].InstanceId'

echo "Storing in variable"
instance_ids=($(aws ec2 describe-instances --output json | jq -r '.Reservations[].Instances[].InstanceId'))

echo ${instance_ids[@]}