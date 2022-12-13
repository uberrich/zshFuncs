#! /usr/bin/zsh
acrlogin () {
	az account show &> /dev/null
	if [ $? -ne 0 ]; then
		az login
	fi
	$TOKEN=$(az acr login --name acrsisdev --expose-token --output tsv --query accessToken)
	podman login acrsisdev.azurecr.io --username 00000000-0000-0000-0000-000000000000 --password $TOKEN
}
