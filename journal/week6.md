# Week 6 — Deploying Containers

## Host Static Website in S3 

Run it via Gitpod and build it. Ref: [Deploy React app to S3 & Cloudfront](https://dev.to/karanpratapsingh/deploy-react-app-to-s3-cloudfront-1cao)
```
npm run build
```

Sync the build to S3
```
aws s3 sync build s3://BUCKET-NAME
```


![url link static web](https://user-images.githubusercontent.com/84492994/230033473-d18d82c1-4627-40e1-9c6a-4f9dd5bb7456.png)

Here the live React app shows:

![success host notefy react app in s3](https://user-images.githubusercontent.com/84492994/230033856-690be224-78b3-4d15-b47f-2d5455824398.png)

## Create CloudFront Distribution

Ref: [CloudFront AWS CLI Docs](https://docs.aws.amazon.com/cli/latest/reference/cloudfront/create-distribution.html)

This time, I use console to make the distribution in CloudFront.

At first time, I use the website endpoint so the OAI doesn't show and all clear with this ref: [CloudFront OAI](https://www.stormit.cloud/blog/cloudfront-origin-access-identity/)

And it is live with CloudFront URL:

![cloudfront url](https://user-images.githubusercontent.com/84492994/230034458-d89815ba-57ae-43fc-90b3-b3ae9920918c.png)

Following the ECS video and reach to this point. I created the service for notefy frontend:

![svc notefy](https://user-images.githubusercontent.com/84492994/230034625-f927f7ac-d9ae-410f-9a7e-daef9ba85575.png)
