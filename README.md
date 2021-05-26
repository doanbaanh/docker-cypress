# Get started:
0. (macOS only) Install XQuartz using homebrew with `brew cask install xquartz` or directly from the website [here](https://www.xquartz.org/)
1. Clone this repository `git clone https://github.com/doanbaanh/docker-cypress.git`
1. Run `cd docker-cypress && make up`
1. Input relative path tests *(ex. my-app/tests)*
1. Input application base url *(ex. my-app.com)*

# Available 'make' commands
```
Available commands:
  help               Show this help
  up                 Run cypress container
  down               Stop cypress container
```

**Current version:** node12.18.3-chrome89-ff86