###
# To manually start your image:
# Make sure you create the folders suites, scripts and reports
# docker run --rm -ti --network=host -v "$PWD/output:/output" -v "$PWD/suites:/suites" -v "$PWD/scripts:/scripts" -v "$PWD/reports:/reports"  robot  bash
#
# Or using docer-compose (see listing below):
# docker-compose up
# docker-compose down


FROM python:3.8

# install google chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get -y update
RUN apt-get install -y google-chrome-stable

# install chromedriver
RUN apt-get install -yqq unzip
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

RUN chmod 777 /usr/local/bin/chromedriver

# install font for other language
RUN apt-get update && \
    apt-get install -y \
        fonts-ipafont-gothic fonts-ipafont-mincho \
        ttf-wqy-microhei fonts-wqy-microhei       \
        fonts-tlwg-loma fonts-tlwg-loma-otf       \
    && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN python3 -m pip install --upgrade pip
COPY requirements.txt /tmp/requirements.txt
RUN  pip3 install -r /tmp/requirements.txt


CMD ["/scripts/run_suite.sh"]