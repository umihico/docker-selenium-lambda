FROM public.ecr.aws/lambda/python@sha256:38431c9488057cc747733661664cd087a2fc940f0e3770d0e8bfd7ae6c303493 as build
RUN yum install -y unzip && \
    curl -Lo "/tmp/chromedriver.zip" "https://chromedriver.storage.googleapis.com/99.0.4844.35/chromedriver_linux64.zip" && \
    curl -Lo "/tmp/chrome-linux.zip" "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F961656%2Fchrome-linux.zip?alt=media" && \
    unzip /tmp/chromedriver.zip -d /opt/ && \
    unzip /tmp/chrome-linux.zip -d /opt/

FROM public.ecr.aws/lambda/python@sha256:38431c9488057cc747733661664cd087a2fc940f0e3770d0e8bfd7ae6c303493
RUN yum install atk cups-libs gtk3 libXcomposite alsa-lib \
    libXcursor libXdamage libXext libXi libXrandr libXScrnSaver \
    libXtst pango at-spi2-atk libXt xorg-x11-server-Xvfb \
    xorg-x11-xauth dbus-glib dbus-glib-devel -y
RUN pip install selenium
COPY --from=build /opt/chrome-linux /opt/chrome
COPY --from=build /opt/chromedriver /opt/
COPY test.py ./
CMD [ "test.handler" ]
