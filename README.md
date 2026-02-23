# docker-selenium-lambda

[![badge](https://github.com/umihico/docker-selenium-lambda/actions/workflows/demo-test.yml/badge.svg)](https://github.com/umihico/docker-selenium-lambda/actions/workflows/demo-test.yml)
[![badge](https://github.com/umihico/docker-selenium-lambda/actions/workflows/auto-update.yml/badge.svg)](https://github.com/umihico/docker-selenium-lambda/actions/workflows/auto-update.yml)

This is minimum demo of headless chrome and selenium on container image on AWS Lambda

This image goes with these versions. [These are automatically updated and tested everyday.](https://github.com/umihico/docker-selenium-lambda/actions)

- Python 3.13.11
- chromium 145.0.7632.77
- chromedriver 145.0.7632.77
- selenium 4.41.0

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

## Advanced usage

To get more than a minimal example, change the code, rebuild the image, and then run the container

### Dynamic url

Change [this line](https://github.com/umihico/docker-selenium-lambda/blob/7a19acc/main.py#L25) to `chrome.get(event.get("url"))`, prepare the container

```bash
docker build --platform linux/amd64 -t aws-lambda-selenium-python:latest .
docker run -p 9000:8080 aws-lambda-selenium-python:latest
```

Then invoke the url set by [amazon/aws-lambda-python](https://hub.docker.com/r/amazon/aws-lambda-python#usage), any JSON in -d is passed to the function's event argument

```bash
curl "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{"url": "https://example.com"}'
```

You can also have a fallback like `chrome.get(event.get("url", "https://example.com"))`, in which case you can invoke the url like this

```bash
curl "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'
```

With sls, you can pass the url argument to a Lambda deployed on AWS

```bash
sls invoke --function demo --data '{"url": "https://github.com"}'
```

### Local execution

Add the following to the end of main.py

```python
if __name__ == "__main__" and os.getenv("AWS_LAMBDA_FUNCTION_NAME") is None:
    print(handler())
```

Now you can run the function outside of Lambda

```bash
docker build --platform linux/amd64 -t aws-lambda-selenium-python:latest .
docker run --entrypoint python aws-lambda-selenium-python:latest main.py
```

You can add a dynamic url to this setup with something like

```python
event = {"url": sys.argv[1]} if len(sys.argv) > 1 else {}
```

## Side Project

Are you interested in **Node.js** or **Playwright**? Please check out [docker-playwright-lambda](https://github.com/umihico/docker-playwright-lambda)

If you don't want to create functions each time for each purpose, Please check out [pythonista-chromeless](https://github.com/umihico/pythonista-chromeless)
