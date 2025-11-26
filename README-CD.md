# CD (Project 4 - Part 3)

## Overview
This part of the project focuses on semantic versioning and using Git tags to automatically build and push versioned Docker images with GitHub Actions.  

---

# What Is Semantic Versioning?

Semantic Versioning uses this format:
- `vMAJOR.MINOR.PATCH`


Examples:
- `v1.0.0`  
- `v1.1.0`  
- `v2.0.3`  

### Meaning:
- MAJOR – Big changes or breaking changes  
- MINOR – New features (no breaking changes)  
- PATCH – Small fixes  

---

# How to Work With Tags

### See all tags
```bash
git tag
git tag -a v1.0.0 -m "First release"
git push origin v1.0.0
git tag -a v1.1.0 -m "Minor update"
git push origin v1.1.0
```
## GitHub Actions Workflow (Tag-Based)

The workflow for semantic versioning is here:
- `.github/workflows/release-dockerhub.yml`

What this workflow does:
- Runs ONLY when a version tag is pushed (v*.*.*)
- Builds the Docker image using your Dockerfile
- Uses metadata to create these DockerHub tags:
    - latest
    - major → example: 1
    - major.minor → example: 1.0
- Pushes all of these tags to DockerHub automatically
- This allows DockerHub to store multiple versions so you can roll back or run older versions if needed.

## Example of What DockerHub Should Show

If you push tag:
- `v1.0.0`

DockerHub will get:
- `latest`
- `1`
- `1.0`
- These tags all point to the same image, just with different version labels.

## Testing & Validation
1. Create and push a version tag
- `git tag -a v1.0.0 -m "Initial version"`
- `git push origin v1.0.0`

2. Check GitHub Actions

Go to the Actions tab in your GitHub repo.
- You should see a run triggered by v1.0.0.
- If it has a green checkmark, you’re good.

3. Check DockerHub

Go here:
- `https://hub.docker.com/r/austinwsu/project4-site/tags`

You should see these tags:
- `latest`
- `1`
- `1.0`

4. Test running the versioned image
- `docker pull austinwsu/project4-site:1.0`
- `docker run -d -p 8082:80 --name test-v1 austinwsu/project4-site:1.0`

Visit:
- `http://localhost:8082`
-If the site loads, everything worked.

## What to Update If You Copy This Workflow to a New Repo

You would need to update:
- The Docker image name inside the workflow
    - `images: username/repository-name`


Your GitHub secrets:
- `DOCKER_USERNAME`
- `DOCKER_TOKEN`
- The build/run commands in the README

Everything else would stay the same.

## Resources

Located in `README-CI.md`




