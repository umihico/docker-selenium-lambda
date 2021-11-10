# docker-selenium-lambda

This is minimum demo of headless chrome and selenium on container image on AWS Lambda

This image goes with these versions.

- Python 3.9
- chromium 95.0.4638.0
- chromedriver 95.0.4638.69
- selenium 4.0.0

### Running the demo

```bash
$ YOUR_REGION=ap-northeast-1 # your region
$ git clone --depth 1 https://github.com/umihico/docker-selenium-lambda.git docker-selenium-lambda && cd $_
$ sls deploy --region $YOUR_REGION
$ sls invoke -f server --region $YOUR_REGION
```

### Contribution

I'm trying run latest Chrome but having difficulties. Please check out other branches and issues.

### Side Project

If you don't want to create functions each time for each purpose, Please check out [pythonista-chromeless](https://github.com/umihico/pythonista-chromeless)
