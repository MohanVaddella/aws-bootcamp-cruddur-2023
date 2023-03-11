# Week 3 — Decentralized Authentication

## Contents table

- [Cognito configuration](#cognito-configuration)

# Cognito configuration

I've created the user pool according to the configurations determined on the live stream:

<img width="760" alt="user-pool" src="https://user-images.githubusercontent.com/84492994/224461537-62aab7a7-3876-4708-a118-2d4c31b47b0b.png">

After creating the environment variables on docker-compose.yml (we are not using Identity Pools), i've modified the App.js file and setting them up on the Amplify.configure function:

````
Amplify.configure({
  "AWS_PROJECT_REGION": process.env.REACT_APP_AWS_PROJECT_REGION,
  "aws_cognito_region": process.env.REACT_APP_AWS_COGNITO_REGION,
  "aws_user_pools_id": process.env.REACT_APP_AWS_USER_POOLS_ID,
  "aws_user_pools_web_client_id": process.env.REACT_APP_CLIENT_ID,
  "oauth": {},
  Auth: {

    region: process.env.REACT_APP_AWS_PROJECT_REGION,
    userPoolId: process.env.REACT_APP_AWS_USER_POOLS_ID,        
    userPoolWebClientId: process.env.REACT_APP_CLIENT_ID,
  }
});
````

### Sign-in

Obtaining the following error on the sign-in as expected:

![image](https://user-images.githubusercontent.com/49325152/224176594-d00f0a56-7628-4c5c-bc34-6ad3adf90d77.png)

However, after doing the 'user creation' I have received a similar error by console:

![image](https://user-images.githubusercontent.com/49325152/224178566-4a10a7ca-201f-40c4-9a1d-9c606a66d97c.png)

So, I have fixed it by using the following command to force the user confirmation

````
aws cognito-idp admin-set-user-password --user-pool-id  ap-south-1_DDqKWO0e2 --username camilol --password Testing1234! --permanent
````

Implemented amplify and made sure the app is working again.

![image](https://user-images.githubusercontent.com/96833570/224272882-85d2a713-f863-47c1-bf98-483c11baca7b.png)

### Sign-in page

After creating a user on the management console and `admin-set-user-password` command, i could sign in to the app.

![image](https://user-images.githubusercontent.com/96833570/224422123-a4e81e74-882c-4cd2-9056-ba1f86806977.png)


### Signup page

![image](https://user-images.githubusercontent.com/96833570/224428341-2a823c37-3e2e-474d-a613-0501dc28ac34.png)

![image](https://user-images.githubusercontent.com/96833570/224428361-95b7a76e-2a1d-4468-ba5f-b686a19e45a8.png)


### Recovery Page


![image](https://user-images.githubusercontent.com/96833570/224430140-7145f96e-eba2-4c86-9bff-c9c0059bd7f2.png)

```
aws cognito-idp list-user-pools --max-results 20
aws sts get-caller-identity
aws configure
aws cognito-idp create-user-pool --pool-name MyUserPool
aws cognito-idp admin-set-user-password --user-pool-id ap-south-xx --password xxx --username john --permanent --region ap-south-1
```


