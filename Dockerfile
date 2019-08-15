FROM python:3.7-alpine
COPY . /home/project
WORKDIR /home/project
RUN pip install -r requirements.txt
EXPOSE 5000
ENTRYPOINT [ "python", "run.py" ]