FROM nikolaik/python-nodejs:python3.9-nodejs18

#clonning repo 
RUN git clone https://github.com/Nobita-XD/music3.git /root/YukkiMusic
#working directory 
WORKDIR /root/YukkiMusic

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# Install requirements
RUN pip3 install -U -r requirements.txt

ENV PATH="/home/YukkiMusic/bin:$PATH"

CMD ["python3","-m","YukkiMusic"]
