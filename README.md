# docker-selenium-lambda

This is minimum demo of headless chrome and selenium on container image on AWS Lambda

This image goes with these versions.

- Python 3.7
- serverless-chrome v1.0.0-37
- chromedriver 2.37
- selenium 3.141.0 (latest)

### Running the demo

```bash
$ YOUR_REGION=ap-northeast-1 # your region
$ sls deploy --region $YOUR_REGION
$ sls invoke -f server --region $YOUR_REGION
```

### Contribution

I'm trying run latest Chrome but having difficulties. Please check out other branches and issues.
