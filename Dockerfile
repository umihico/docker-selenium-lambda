FROM public.ecr.aws/lambda/python@sha256:bd53508accbaeb0977c5c358b772cbc088a3b324523e43f191f2ddb784ea544d as build
RUN dnf install -y unzip && \
    curl -Lo "/tmp/chromedriver-linux64.zip" "https://storage.googleapis.com/chrome-for-testing-public/141.0.7390.65/linux64/chromedriver-linux64.zip" && \
    curl -Lo "/tmp/chrome-linux64.zip" "https://storage.googleapis.com/chrome-for-testing-public/141.0.7390.65/linux64/chrome-linux64.zip" && \
    unzip /tmp/chromedriver-linux64.zip -d /opt/ && \
    unzip /tmp/chrome-linux64.zip -d /opt/

FROM public.ecr.aws/lambda/python@sha256:bd53508accbaeb0977c5c358b772cbc088a3b324523e43f191f2ddb784ea544d
RUN dnf install -y atk cups-libs gtk3 libXcomposite alsa-lib \
    libXcursor libXdamage libXext libXi libXrandr libXScrnSaver \
    libXtst pango at-spi2-atk libXt xorg-x11-server-Xvfb \
    xorg-x11-xauth dbus-glib dbus-glib-devel nss mesa-libgbm && \
    pip install selenium==4.36.0
COPY --from=build /opt/chrome-linux64 /opt/chrome
COPY --from=build /opt/chromedriver-linux64 /opt/
COPY main.py ./
CMD [ "main.handler" ]
