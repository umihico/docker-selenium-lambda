# docker-selenium-lambda

This is minimum demo of headless chrome and selenium on container image on AWS Lambda

This image goes with these versions.

- Python 3.9
- chromium 89.0.4389.47
- chromedriver 89.0.4389.23
- selenium 4.0.0

### Running the demo

```bash
$ YOUR_REGION=ap-northeast-1 # your region
$ git clone --depth 1 https://github.com/umihico/docker-selenium-lambda.git docker-selenium-lambda && cd $_
$ sls deploy --region $YOUR_REGION
$ sls invoke -f server --region $YOUR_REGION
```

### Side Project

If you don't want to create functions each time for each purpose, Please check out [pythonista-chromeless](https://github.com/umihico/pythonista-chromeless)
