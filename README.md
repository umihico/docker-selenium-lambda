# docker-selenium-lambda

This is minimum demo of headless chrome and selenium on container image on AWS Lambda

This image goes with these versions. [These are automatically updated and tested everyday. ![CircleCI](https://circleci.com/gh/umihico/docker-selenium-lambda/tree/circleci.svg?style=svg)](https://circleci.com/gh/umihico/docker-selenium-lambda/tree/circleci)

- Python 3.9.12
- chromium 102.0.5005.0
- chromedriver 102.0.5005.61
- selenium 4.2.0


## Running the demo

```bash
$ npm install -g serverless # skip this line if you have already installed Serverless Framework
$ export AWS_REGION=ap-northeast-1 # You can specify region or skip this line. us-east-1 will be used by default.
$ sls create --template-url "https://github.com/umihico/docker-selenium-lambda/tree/main" --path docker-selenium-lambda && cd $_
$ sls deploy
$ sls invoke --function demo # Yay! You will get texts of example.com
```

## Side Project

If you don't want to create functions each time for each purpose, Please check out [pythonista-chromeless](https://github.com/umihico/pythonista-chromeless)
