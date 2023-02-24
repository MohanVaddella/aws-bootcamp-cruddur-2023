# Week 1 — App Containerization

## Required Homework

### Configure the gitpod.yml and docker-compose.yml cofiguration

I am able to configure the gitpod.yml and docker-compose.yml files by following the instructions provided through the video content of this bootcamp.

![config-gitpod-docker-compose-files](https://user-images.githubusercontent.com/84492994/221096673-87d7bfe4-19f4-466c-b7ca-e17369fd9017.jpg)

### Write a dockerfile for both frontend and backend

I have created the dockerfiles for both the frontend and backend.

```Dockerfile for backend-flask
   
   FROM python:3.10-slim-buster
   
   WORKDIR /backend-flask
  
   COPY requirements.txt requirements.txt

   RUN pip3 install -r requirements.txt

   COPY . .

   ENV FLASK_ENV=development

   EXPOSE ${PORT}

   CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=4567"]
```
```Dockerfile for frontend-react
  
   FROM node:16.18

   ENV PORT=3000

   COPY . /frontend-react-js

   WORKDIR /frontend-react-js

   RUN npm install

   EXPOSE ${PORT}

   CMD ["npm", "start"]
```
### Create new notifications backend endpoint

I have created the notifications backend endpoint [https://github.com/MohanVaddella/aws-bootcamp-cruddur-2023/blob/main/backend-flask/app.py]


### Implement frontend notifications page

I have implemented the frontend notifications page [https://github.com/MohanVaddella/aws-bootcamp-cruddur-2023/blob/main/frontend-react-js/src/App.js]

### Install docker and Postgres

I have installed the docker and postgres [https://github.com/MohanVaddella/aws-bootcamp-cruddur-2023/blob/main/docker-compose.yml]

![install-docker-postgres](https://user-images.githubusercontent.com/84492994/221100114-353bada3-abad-493b-8036-9478caef4c1c.jpg)

