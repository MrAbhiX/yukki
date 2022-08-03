FROM nikolaik/python-nodejs:python3.9-nodejs18

#clonning repo 
RUN git clone https://github.com/MrAbhiX/VcUserBot.git /root/VcUserbot
#working directory 
WORKDIR /root/VcUserbot

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# Install requirements
RUN pip3 install -U -r requirements.txt

ENV PATH="/home/VcUserbot/bin:$PATH"

CMD ["python3","-m","VcUserbot"]
