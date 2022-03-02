FROM python:3.8.10

ENV PYTHONUNBUFFERED 1

# install google chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get -y update
RUN apt-get install -y google-chrome-stable

# install chromedriver
RUN apt-get install -yqq unzip
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip chromedriver -d /bin/

# set display port to avoid crash
ENV DISPLAY=:99

#RUN mkdir /code
#WORKDIR /code
#
#COPY . /code/

RUN pip install pytest==7.0.1 \
  && pip install selenium==4.1.2 \
  && pip install allure-pytest==2.9.45

CMD pytest code/test_onlinesim_ru.py --alluredir=allure_result