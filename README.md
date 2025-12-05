# CEG 3120 – CI/CD Website Deployment Project

This repository contains all of the work for Projects 4 and 5, where a simple website is containerized with Docker, built using GitHub Actions, and automatically deployed to an AWS EC2 instance using webhooks.

The project is split into two major parts:

---

# Project 4 – Continuous Integration (CI)

Project 4 focuses on building the Docker image for the website and automating the build/push process using GitHub Actions.  

This includes:

- Creating a website and Dockerfile  
- Building and running the container locally  
- Setting up GitHub Actions to build images  
- Using semantic versioning with `git tag`  
- Publishing images to DockerHub  
- Creating a CI workflow diagram  

Read the full Project 4 documentation here:  
- [README-CI.md](README-CI.md)

---

# Project 5 – Continuous Deployment (CD)

Project 5 adds deployment automation by using an AWS instance, a webhook listener, and a refresh script.  
When a new image is pushed to DockerHub by GitHub Actions, the instance automatically:

1. Stops the old container  
2. Pulls the new version  
3. Runs the updated container  

This project includes:

- Setting up EC2 and installing Docker  
- Writing the container refresh script  
- Installing and configuring `webhook`  
- Creating a systemd service so webhook runs on startup  
- Setting GitHub webhooks to trigger deployment  
- Generating a CD workflow diagram  

Read the full Project 5 documentation here:  
- [README-CD.md](README-CD.md)


