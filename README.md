# nginx-gitops

A simple repo to simulate the CD pipeline using argocd and deploying the application to k8s
Here I'm using the app of apps pattern to simulte how argocd can make our life a bit easier so he can manage all these for us
and also just a simple nginx app with no patterns 

For the CI side its not done yet but the plan is to use Github Actions for this side and deploy a real world application here 
a simple nodeJs or Golang API that has some endpoints we can test with

## TODO:

- [ ] Build a simple HelloWorld nodeJs application
- [ ] Dockerize it
- [ ] Implement the CI pipeline along with the tests and everything
- [ ] Tag the image and push it after successful steps
- [ ] Kick the CD process to automatically sync it.
- [ ] Maybe send some slack Notif in both cases Failed/Success pipeline
