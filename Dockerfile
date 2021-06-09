FROM public.ecr.aws/lambda/python:3.8 as build
RUN yum install -y unzip && \
    curl -SL https://chromedriver.storage.googleapis.com/2.43/chromedriver_linux64.zip > /tmp/chromedriver.zip && \
    curl -SL https://github.com/adieuadieu/serverless-chrome/releases/download/v1.0.0-55/stable-headless-chromium-amazonlinux-2017-03.zip > /tmp/headless-chromium.zip && \
    unzip /tmp/chromedriver.zip -d /opt/ && \
    unzip /tmp/headless-chromium.zip -d /opt/

FROM public.ecr.aws/lambda/python:3.8
RUN yum install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
RUN pip install selenium
COPY --from=build /opt/headless-chromium /opt/
COPY --from=build /opt/chromedriver /opt/
COPY test.py ./
CMD [ "test.handler" ]
