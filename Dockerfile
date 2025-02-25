FROM       python:3.13.2

WORKDIR    /root

RUN        ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
RUN        pip install pipenv

ADD        Pipfile.lock Pipfile ./
RUN        pipenv sync

COPY       *.py ./

EXPOSE     9000
CMD        ["sh", "-c", "python -u main.py"]
