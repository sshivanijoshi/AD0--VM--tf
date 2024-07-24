# AD0--VM--tf<img width="762" alt="Screenshot 2024-07-25 at 4 07 02 AM" src="https://github.com/user-attachments/assets/9dfb561e-4000-4751-bfa2-165b1879c280">





<img width="1230" alt="Screenshot 2024-07-25 at 4 07 40 AM" src="https://github.com/user-attachments/assets/181ac038-6030-475b-8c46-48c5b106a8e8">



<img width="1028" alt="Screenshot 2024-07-25 at 4 08 16 AM" src="https://github.com/user-attachments/assets/8033e370-12d5-4e48-96bb-60f7a62a2ccc">




<img width="1536" alt="Screenshot 2024-07-25 at 4 09 23 AM" src="https://github.com/user-attachments/assets/c1d35144-2b79-492c-98aa-8a77df4dfed5">


<img width="1728" alt="Screenshot 2024-07-25 at 4 10 07 AM" src="https://github.com/user-attachments/assets/1e109c99-60c9-4b4a-9a38-f41eba90d3fb">



**ADded these things **

1= Azure portal service principal create in auzre CLI 

az account show
az account set --subscription="nameofsubscription"

az ad sp ado  --name MyServicePrincipalName --role Contributor --scopes /subscriptions/1b996d81-8d39-47ee-bc3c-436b7f6214fe

az ad sp create-for-rbac --name AdoSP --role Contributor --scopes /subscriptions/1b996d81-8d39-47ee-bc3c-436b7f6214fe
{
  "appId": "**********",  / Client ID (Application ID)
  "displayName": "AdoSP",
  "password": "-***********",   // Client Secret
  "tenant": "***********” // Tenant ID
}![image](https://github.com/user-attachments/assets/13c09866-d6b2-490e-a7f0-293ba6c93a4a)




3= Service principal authenticate to ADO give ADO contibutor access 

<img width="481" alt="Screenshot 2024-07-25 at 4 15 38 AM" src="https://github.com/user-attachments/assets/d6c2bc71-2add-4efd-adf8-1f718d92f372">


<img width="1719" alt="Screenshot 2024-07-25 at 4 16 03 AM" src="https://github.com/user-attachments/assets/1bc3e9c8-ab14-4b1b-ac44-02ed2c87cccc">

<img width="1725" alt="Screenshot 2024-07-25 at 4 16 31 AM" src="https://github.com/user-attachments/assets/4a840fcb-aa93-4840-b6aa-22279529787d">


<img width="1255" alt="Screenshot 2024-07-25 at 4 12 32 AM" src="https://github.com/user-attachments/assets/2a604091-354a-4b64-9785-99b0fde7119d">


<img width="783" alt="Screenshot 2024-07-25 at 4 14 52 AM" src="https://github.com/user-attachments/assets/ac157094-153e-4d5f-a67e-8a348dbfb562">




4= Pipelines -> library ->  variable group create and added SP values 
<img width="1288" alt="Screenshot 2024-07-25 at 4 17 27 AM" src="https://github.com/user-attachments/assets/1bdfccca-673e-4379-96e1-017396dde26f">

<img width="1073" alt="Screenshot 2024-07-25 at 4 17 52 AM" src="https://github.com/user-attachments/assets/d1eb3f09-b2c6-415d-ae1b-8ef5a46e0e61"> 


5= 

Agent configure 
<img width="865" alt="Screenshot 2024-07-25 at 4 21 31 AM" src="https://github.com/user-attachments/assets/0f21bb02-72f3-493e-9da2-bc30b5c37bc1"> 

Added 2 values in both and save 

<img width="1235" alt="Screenshot 2024-07-25 at 4 21 43 AM" src="https://github.com/user-attachments/assets/002d7cc4-2923-4e6b-8fda-2495ed49e426">



2= error while running terraform plan and apply
az feature register --namespace Microsoft.Compute --name EncryptionAtHost --subscription 1b996d81-8d39-47ee-bc3c-436b7f6214fe

az provider register --namespace Microsoft.Compute --subscription  1b996d81-8d39-47ee-bc3c-436b7f6214fe![image](https://github.com/user-attachments/assets/ac28e18b-84f4-4dd9-82cc-a4d56ac6b5e5)








