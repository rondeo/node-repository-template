workflow "Test and Build" {
  on = "push"
  resolves = ["Build Package", "Build Image"]
}

action "Install" {
  uses = "docker://node:alpine"
  runs = "yarn"
  args = "install"
}

action "Lint" {
  needs = "Install"
  uses = "docker://node:alpine"
  runs = "yarn"
  args = "lint"
}

action "Test" {
  needs = "Install"
  uses = "docker://node:alpine"
  runs = "yarn"
  args = "test --ci"
}

action "Build Package" {
  needs = ["Install", "Lint", "Test"]
  uses = "docker://node:alpine"
  runs = "yarn"
  args = "build"
}

action "Build Image" {
  needs = ["Build Package"]
  uses = "actions/docker/cli@master"
  args = "build ."
}

action "Only Master Branch" {
   uses = "actions/bin/filter@master"
   args = "branch master"
 }

action "Publish" {
  needs = ["Build Package", "Build Image", "Only Master Branch"]
  uses = "docker://node:alpine"
  runs = "npx"
  args = "semantic-release"
  secrets = ["NPM_TOKEN", "GH_TOKEN"]
}
