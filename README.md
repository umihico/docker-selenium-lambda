# docker-selenium-lambda

[![badge](https://github.com/umihico/docker-selenium-lambda/actions/workflows/demo-test.yml/badge.svg)](https://github.com/umihico/docker-selenium-lambda/actions/workflows/demo-test.yml)
[![badge](https://github.com/umihico/docker-selenium-lambda/actions/workflows/auto-update.yml/badge.svg)](https://github.com/umihico/docker-selenium-lambda/actions/workflows/auto-update.yml)

This is minimum demo of headless chrome and selenium on container image on AWS Lambda

This image goes with these versions. [These are automatically updated and tested everyday.](https://github.com/umihico/docker-selenium-lambda/actions)

- Python 3.13.9
- chromium 142.0.7444.162
- chromedriver 142.0.7444.162
- selenium 4.38.0

## Running the demo

```bash
$ npm install -g serverless@^3 # skip this line if you have already installed Serverless Framework
$ export AWS_REGION=ap-northeast-1 # You can specify region or skip this line. us-east-1 will be used by default.
$ sls create --template-url "https://github.com/umihico/docker-selenium-lambda/tree/main" --path docker-selenium-lambda && cd $_
$ sls deploy
$ sls invoke --function demo # Yay! You will get texts of example.com
```

## Public image is available

If you want your image simpler and updated automatically, rewrite the Dockerfile with the following commands:

```Dockerfile
FROM umihico/aws-lambda-selenium-python:latest

COPY main.py ./
CMD [ "main.handler" ]
```

Available tags are listed [here](https://hub.docker.com/r/umihico/aws-lambda-selenium-python/tags)

## Side Project

Are you interested in **Node.js** or **Playwright**? Please check out [docker-playwright-lambda](https://github.com/umihico/docker-playwright-lambda)

If you don't want to create functions each time for each purpose, Please check out [pythonista-chromeless](https://github.com/umihico/pythonista-chromeless)
