FROM public.ecr.aws/lambda/python:3.8 as build
RUN mkdir -p /opt/bin/ && \
    mkdir -p /tmp/downloads && \
    yum install -y unzip && \
    curl -SL https://chromedriver.storage.googleapis.com/2.37/chromedriver_linux64.zip > /tmp/downloads/chromedriver.zip && \
    curl -SL https://github.com/adieuadieu/serverless-chrome/releases/download/v1.0.0-37/stable-headless-chromium-amazonlinux-2017-03.zip > /tmp/downloads/headless-chromium.zip && \
    unzip /tmp/downloads/chromedriver.zip -d /opt/bin/ && \
    unzip /tmp/downloads/headless-chromium.zip -d /opt/bin/

FROM public.ecr.aws/lambda/python:3.8
RUN mkdir -p /opt/bin && pip install selenium
COPY google-chrome.repo /etc/yum.repos.d/
RUN yum install -y --enablerepo=google-chrome google-chrome-stable
COPY --from=build /opt/bin/headless-chromium /opt/bin/
COPY --from=build /opt/bin/chromedriver /opt/bin/
COPY test.py ./
CMD [ "test.handler" ]
