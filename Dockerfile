FROM debian:stable-slim
MAINTAINER OIVAS7572
RUN echo OIVAS7572
CMD echo OIVAS7572
COPY . .


RUN apt-get update && apt-get install -y wget python3 python3-pip p7zip-full

RUN wget --no-check-certificate "https://abrok.eu/stockfish/builds/590447d7a162058ed1f68270c84aac4e2f256bb1/linux64modern/stockfish_21082209_x64_modern.zip" -O chess-engine.zip
RUN 7z e chess-engine.zip && rm chess-engine.zip && mv stockfish* chess-engine

COPY requirements.txt .
RUN python3 -m pip install --no-cache-dir -r requirements.txt

RUN chmod +x chess-engine
# Engine name is here ^^^^^^

CMD python3 run.py
