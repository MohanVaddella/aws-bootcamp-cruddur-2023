# Week 9 — CI/CD with CodePipeline, CodeBuild and CodeDeploy

This week, I had a great time learning about AWS code build and code pipeline services with the Cruddur backend. I want to give a big shoutout to "jamesoundb" and "anle4s" - two awesome bootcampers who helped me out with some issues I was having, one with the log groups and the other with the missing permissions in a video. Proof of my work can be seen in the journal. 

However, I have to say that since week 5 of the bootcamp, it's been a real challenge keeping up with the workload, even when just completing the checklist items. It's been taking me around 10-12 hours per week, and it's been tough to maintain that level of commitment even though I really enjoy the material.

So, I was thrilled to finally have a bit of a break with week 9 (CI/CD), which required less than four hours of video. It's also been really fun getting to know some of the other bootcampers - the crew (as can be seen on Discord) really got much smaller in the last 2-3 weeks. Thanks again for organizing this. 

Getting the build to work on aws code build... 

<img width="1335" alt="task1" src="https://user-images.githubusercontent.com/84492994/235165323-e8a65c69-19da-4eb6-b6e4-e2fcac42f75e.png">

This policy statement was missing (thanks anle4s!) 

      {
        "Version": "2012-10-17",
        "Statement": [
          {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
              "ecr:BatchCheckLayerAvailability",
              "ecr:CompleteLayerUpload",
              "ecr:GetAuthorizationToken",
              "ecr:InitiateLayerUpload",
              "ecr:PutImage",
              "ecr:UploadLayerPart",
              "ecr:BatchGetImage",
              "ecr:GetDownloadUrlForLayer"
            ],
            "Resource": "*"
          }
        ]
      }
      
Very important to check this box!! otherwise the build will fail:

<img width="1335" alt="task2" src="https://user-images.githubusercontent.com/84492994/235165554-94040ebe-d735-47b8-85ec-7e094769d7b5.png">

Proof of entire pipeline running green - on code pipeline: 

<img width="462" alt="task3" src="https://user-images.githubusercontent.com/84492994/235165650-4d91ca9c-c960-40e0-b782-c7f03f59882b.png">

Proof of new health-check working in the backend after code pipeline running: 

<img width="434" alt="task4" src="https://user-images.githubusercontent.com/84492994/235165769-99438603-8e78-41b3-8461-d8fd2f5a8b2d.png">

