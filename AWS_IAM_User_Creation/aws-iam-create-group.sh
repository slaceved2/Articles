# Purpose: Automated group creation in AWS
# How to: ./aws-iam-create-group.sh <entry file format .csv>
# Entry file column name: group, policy
# Author: Sonya Stauffer-Acevedo
# ------------------------------------------

INPUT=$1
OLDIFS=$IFS
IFS=',;'

[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

command -v dos2unix >/dev/null || { echo "dos2unix tool not found. Please, install dos2unix tools before running the script."; exit 1; }

dos2unix $INPUT

while read -r group policy || [ -n "$group" ]
do
    if [ "$group" != "group" ]; then
	    aws iam create-group --group-name $group
        aws iam attach-group-policy --group-name $group --policy-arn arn:aws:iam::aws:policy/$policy
		aws iam attach-group-policy --group-name $group --policy-arn arn:aws:iam::aws:policy/IAMUserChangePassword
		aws iam attach-group-policy --group-name $group --policy-arn <policy arn>
	fi
    

done < $INPUT

IFS=$OLDIFS