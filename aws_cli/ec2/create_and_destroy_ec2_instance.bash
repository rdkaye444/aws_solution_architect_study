# AWS Linux 2
# key is the one I'm using for study
# security group is the one I'm using for study (default security group)
# subnet is the one I'm using for study (default subnet)

aws ec2 run-instances \
    --image-id ami-01816d07b1128cd2d \
    --count 1 \
    --instance-type t2.micro \
    --key-name ec2_key \
    --security-group-ids sg-017341019c21dc862 \
    --subnet-id subnet-06c8cc059a37c67f1


echo "Collecting instances and Storing instance_Id's in variable"
instance_ids=($(aws ec2 describe-instances --output json | jq -r '.Reservations[].Instances[].InstanceId'))

echo ${instance_ids[@]}

aws ec2 terminate-instances --instance-ids "${instance_ids[@]}"