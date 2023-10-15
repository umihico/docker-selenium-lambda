# docker-selenium-lambda

![badge](https://github.com/umihico/docker-selenium-lambda/actions/workflows/demo-test.yml/badge.svg)
![badge](https://github.com/umihico/docker-selenium-lambda/actions/workflows/auto-update.yml/badge.svg)

This is minimum demo of headless chrome and selenium on container image on AWS Lambda

This image goes with these versions. [These are automatically updated and tested everyday.](https://github.com/umihico/docker-selenium-lambda/actions)

- Python 3.11.5
- chromium 118.0.5993.70
- chromedriver 118.0.5993.70
- selenium 4.14.0

## Running the demo

```bash
$ npm install -g serverless # skip this line if you have already installed Serverless Framework
$ export AWS_REGION=ap-northeast-1 # You can specify region or skip this line. us-east-1 will be used by default.
$ sls create --template-url "https://github.com/umihico/docker-selenium-lambda/tree/main" --path docker-selenium-lambda && cd $_
$ sls deploy
$ sls invoke --function demo # Yay! You will get texts of example.com
```

## Public image is available

If you want your image simplier and updated automatically, rewrite the Dockerfile with the following commands:

```Dockerfile
FROM umihico/aws-lambda-selenium-python:latest

COPY main.py ./
CMD [ "main.handler" ]
```

Available tags are listed [here](https://hub.docker.com/r/umihico/aws-lambda-selenium-python/tags)

## Side Project

If you don't want to create functions each time for each purpose, Please check out [pythonista-chromeless](https://github.com/umihico/pythonista-chromeless)
