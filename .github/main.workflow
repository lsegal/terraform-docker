workflow "New workflow" {
  on = "push"
  resolves = ["Docker Login", "Docker Build and Push"]
}

action "Docker Login" {
  uses = "actions/docker/login@master"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Docker Build and Push" {
  uses = "./releasetools"
  needs = ["Docker Login"]
}
