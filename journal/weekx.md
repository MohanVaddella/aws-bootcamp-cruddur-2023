# Week X - Cleanup

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  

1. [**Attended the Livestream**](https://www.youtube.com/watch?v=Bi_pjuM3u2o&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=111&pp=iAQB)

2. Built up a static frontend in gitpod alongside creating and deploying the sync role in CloudFormation.

![task1](https://github.com/MohanVaddella/aws-bootcamp-cruddur-2023/assets/84492994/426139be-b1e0-45a3-968d-7134bdb455cf)

3. Reconnected the database and updated the post confimation lambda.

![task2](https://github.com/MohanVaddella/aws-bootcamp-cruddur-2023/assets/84492994/83395881-4d7e-4849-8bf1-9022d1ceaaa4)

4. Updated the config.toml file in aws/cfn/service and the service file in bin/cfn to fix the CORS issue.

5. Fixed up the CI/CD pipeline for CFN which is now fully working.

![task3](https://github.com/MohanVaddella/aws-bootcamp-cruddur-2023/assets/84492994/a0afe648-5146-4a21-8ac9-9855d61a534d)

6. Refractored cognito_jwt_token.py to use a decorator.

7. Refactored flask and app.py

8. Implemented the reply function. When I was troubleshooting, I kept getting an AttibuteError, followed by a "LINE 27: replies.reply_to_actvitiy_uuid = activities.uuid" error after further troubleshooting. 

   My solution was copying and pasting the following commands manually inside gitpod (courtesy of the uuid_to_string.py file inside the db/migrations folder) after using the ./bin/db/connect command.

    `ALTER TABLE activities DROP COLUMN reply_to_activity_uuid;`
    
    `ALTER TABLE activities ADD COLUMN reply_to_activity_uuid uuid;`

![task4](https://github.com/MohanVaddella/aws-bootcamp-cruddur-2023/assets/84492994/4976ad67-e575-4dde-8eee-d4087c44983a)

9. Refactored the error handling and fetch requests.

10. Refactored the Activity Show page. 

11. Did some cleanup alongside implementing timezone fixes.

12. Did some more cleanup on the frontend side of things alongside fixing an issue on the backend related to messaging which took a ton of troubleshooting.

![task5](https://github.com/MohanVaddella/aws-bootcamp-cruddur-2023/assets/84492994/83ed2759-d185-4eaf-9e1e-546bef410e7b)

**Bootcamp Complete**: The completed application can be found at [https://cruddr.click](https://cruddr.click).
