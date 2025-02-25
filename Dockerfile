FROM       python:3

WORKDIR    /root

RUN        ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
RUN        pip install pipenv
RUN        pipenv sync

COPY       *.py ./

CMD        ["sh", "-c", "python -u main.py"]
