FROM public.ecr.aws/lambda/python:3.9 as build
RUN yum install -y unzip && \
    curl -SL https://chromedriver.storage.googleapis.com/89.0.4389.23/chromedriver_linux64.zip > /tmp/chromedriver.zip && \
    curl -SL https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F843831%2Fchrome-linux.zip?alt=media > /tmp/chrome-linux.zip && \
    unzip /tmp/chromedriver.zip -d /opt/ && \
    unzip /tmp/chrome-linux.zip -d /opt/

FROM public.ecr.aws/lambda/python:3.9
RUN yum install atk cups-libs gtk3 libXcomposite alsa-lib \
    libXcursor libXdamage libXext libXi libXrandr libXScrnSaver \
    libXtst pango at-spi2-atk libXt xorg-x11-server-Xvfb \
    xorg-x11-xauth dbus-glib dbus-glib-devel -y
RUN pip install selenium
COPY --from=build /opt/chrome-linux /opt/chrome
COPY --from=build /opt/chromedriver /opt/
COPY test.py ./
CMD [ "test.handler" ]
