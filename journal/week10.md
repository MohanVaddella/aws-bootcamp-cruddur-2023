# Week 10 — CloudFormation Part 1

### my-cluster stack on AWS Cloudformation 

<img width="1213" alt="task1" src="https://user-images.githubusercontent.com/84492994/236666719-aad3a37c-cb7b-4ea0-8ff4-e77c7ff219aa.png">

### my-cluster stack changeset when modifying the cluster name (replacement action)

<img width="1213" alt="task2" src="https://user-images.githubusercontent.com/84492994/236666737-c58641f3-fe8a-4fd7-801a-24f5d7e46e66.png">

### my-cluster stack events list 

<img width="1529" alt="task3" src="https://user-images.githubusercontent.com/84492994/236666760-f9638c61-6d02-45f4-9ab4-055710e96299.png">

### Creating the artifacts s3 bucket for AWS Cloudformation templates

<img width="1386" alt="task4" src="https://user-images.githubusercontent.com/84492994/236666821-5af6ba6b-2916-4085-8930-4cb79ae37cbb.png">

### AWS Cloudformation template successfully uploaded to the s3 bucket

<img width="1386" alt="task5" src="https://user-images.githubusercontent.com/84492994/236666847-d6a15c03-f54a-47d6-90d5-a55c87292e3a.png">

<img width="1014" alt="task6" src="https://user-images.githubusercontent.com/84492994/236666864-8b94173d-5b47-4b89-8a1b-2e8b65fdc207.png">

### Locally downloaded AWS Cloudformation template has the correct content 

<img width="1468" alt="task7" src="https://user-images.githubusercontent.com/84492994/236667208-bf84af2c-a081-46da-b897-44520252cb18.png">

### Finish off networking with AWS Cloudformation

Corresponds to this [video](https://www.youtube.com/watch?v=jPdm0uLyFLM&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=86) - the images show the deployed resources, the outputs, and the networking configuration of the VPC 

<img width="1468" alt="task8" src="https://user-images.githubusercontent.com/84492994/236667234-04138660-ace4-4b82-b8d9-942bef79cf92.png">

<img width="1468" alt="task9" src="https://user-images.githubusercontent.com/84492994/236667242-7e2ed9e0-593f-47d3-9320-d8cea7f026ca.png">

<img width="623" alt="task10" src="https://user-images.githubusercontent.com/84492994/236667255-fa8d5a78-70f9-4bd1-9843-72b07da55a04.png">

### CFN Diagramming the Network Layer

<img width="464" alt="task11" src="https://user-images.githubusercontent.com/84492994/236667276-201bb11e-0226-4e00-9bd5-91d05e7d9eed.png">

We also start this other cfn diagram which we will continue in upcoming videos 

<img width="623" alt="task12" src="https://user-images.githubusercontent.com/84492994/236667289-471d949a-c90f-4f26-b568-1e92d4343327.png">

<img width="1056" alt="task13" src="https://user-images.githubusercontent.com/84492994/236667299-6dee9f2c-47ee-4608-bd9c-de430cb962d0.png">

### CFN for the Cluster 

The code link can be found [here](https://github.com/gloriamacia/aws-bootcamp-cruddur-2023/blob/main/aws/cfn/cluster/template.yaml). 

Important - the cluster stack references the network stack i.e. subnets, vpcId - so they both need to be re-deployed. The advice is to first delete all manually created resources as can be seen below:

<img width="1515" alt="task14" src="https://user-images.githubusercontent.com/84492994/236667333-6a6de53b-5f6d-4ca3-b842-efb9a6c7eb56.png">

We can the re-deploy, make sure to check that the exports of the network stack are correct as we will need them in the cluster stack:

<img width="1515" alt="task15" src="https://user-images.githubusercontent.com/84492994/236667370-64342dda-285b-4c54-9894-3763ceae2f29.png">

### ECS Cluster Stack deploys correctly

<img width="1151" alt="task16" src="https://user-images.githubusercontent.com/84492994/236667390-158aa0a8-5944-423b-8492-ce05098ac38a.png">

### Cfn Diagram enhanced with Clusters

<img width="500" alt="task17" src="https://user-images.githubusercontent.com/84492994/236667419-32c958f1-a2f9-4862-976c-1c1b1ee02c27.png">

Detail view of the ALB

<img width="375" alt="task18" src="https://user-images.githubusercontent.com/84492994/236667438-3cebad30-4da3-443a-a6f0-8824cfbae35e.png">

### Fixing the Backend Service (& deploying RDS as IaaC)

In order to fix the service, we realized we needed first to deploy RDS

<img width="1022" alt="task19" src="https://github.com/MohanVaddella/aws-bootcamp-cruddur-2023/assets/84492994/bac3c25e-0693-4367-b058-d3db87108984">

There are a couple manual steps shown in the video - to update in systems manager the connection URL:

<img width="1022" alt="task20" src="https://github.com/MohanVaddella/aws-bootcamp-cruddur-2023/assets/84492994/5d4829a0-db43-4494-b3cc-df86c0af62b9">

<img width="1022" alt="task21" src="https://github.com/MohanVaddella/aws-bootcamp-cruddur-2023/assets/84492994/7bf856b3-112f-4d73-bff7-3ed76e728eee">

This should be an env variable:

```
gp env  DB_PASSWORD=<YOUR DB PASSWORD>
```
### Important

There is a fix needed undocumented in the videos. The ALB target group for the backend should be edited. The health check should point to port 4567, not port 80.

#### Health check working

Health-check seein in service tab:

<img width="1022" alt="task22" src="https://github.com/MohanVaddella/aws-bootcamp-cruddur-2023/assets/84492994/73b1a442-bb02-4cc4-a2db-6b2090e679c0">

Health-check seein in ALB tab:

<img width="1022" alt="task23" src="https://github.com/MohanVaddella/aws-bootcamp-cruddur-2023/assets/84492994/5ff2c023-52a1-474c-b9f4-39ed6b221008">

### Change Route 53 A records
The A records for cruddur.ch and api.crudur.ch should point to the new load balancer:

<img width="1022" alt="task24" src="https://github.com/MohanVaddella/aws-bootcamp-cruddur-2023/assets/84492994/c1740dee-ac58-4a37-bf85-8f5dea9fb476">

Once done, it can be accessed as expected from the internet at https://api.cruddur.ch/api/health-check

<img width="1022" alt="task25" src="https://github.com/MohanVaddella/aws-bootcamp-cruddur-2023/assets/84492994/4de0b442-b7b1-4bc3-b073-3fcb5af60aff">

## TO DO - DIAGRAM

https://www.youtube.com/watch?v=y6ShAco6Edg&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=102






