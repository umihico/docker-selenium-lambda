FROM public.ecr.aws/lambda/python@sha256:d8a8324834a079dbdfc6551831325113512a147bf70003622412565f216e36e0 as build
RUN yum install -y unzip && \
    curl -Lo "/tmp/chromedriver.zip" "https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/118.0.5993.70/linux64/chromedriver-linux64.zip" && \
    curl -Lo "/tmp/chrome-linux.zip" "https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/118.0.5993.70/linux64/chrome-linux64.zip" && \
    unzip /tmp/chromedriver.zip -d /opt/chromedriver/ && \
    unzip /tmp/chrome-linux.zip -d /opt/chrome/

FROM public.ecr.aws/lambda/python@sha256:d8a8324834a079dbdfc6551831325113512a147bf70003622412565f216e36e0
RUN yum install atk cups-libs gtk3 libXcomposite alsa-lib \
    libXcursor libXdamage libXext libXi libXrandr libXScrnSaver \
    libXtst pango at-spi2-atk libXt xorg-x11-server-Xvfb \
    xorg-x11-xauth dbus-glib dbus-glib-devel -y
RUN pip install selenium==4.14.0
COPY --from=build /opt/chrome/chrome-linux64/ /opt/chrome
COPY --from=build /opt/chromedriver/chromedriver-linux64 /opt/chromedriver
COPY main.py ./
CMD [ "main.handler" ]
