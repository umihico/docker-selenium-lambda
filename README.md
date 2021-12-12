# docker-selenium-lambda

This is minimum demo of headless chrome and selenium on container image on AWS Lambda

This image goes with these versions.

- Python 3.9
- chromium 96.0.4664.93
- chromedriver 96.0.4664.45
- selenium 4.1.0

### Running the demo

```bash
$ export AWS_REGION=ap-northeast-1 # You can specify region or skip this line. us-east-1 will be used by default.
$ sls create --template-url "https://github.com/umihico/docker-selenium-lambda/tree/main" --path docker-selenium-lambda && cd $_
$ sls deploy
$ sls invoke --function demo # Yay! You will get texts of example.com
```

### Side Project

If you don't want to create functions each time for each purpose, Please check out [pythonista-chromeless](https://github.com/umihico/pythonista-chromeless)
