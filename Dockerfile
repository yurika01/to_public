FROM ubuntu:18.04

# import packages
RUN apt -y update && apt install -y --no-install-recommends \
    wget \
    python3-distutils \
    nginx \
    ca-certificates \
    libgomp1 \
    && apt clean

# install python package
# remove cache
RUN wget https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py && \
    pip install wheel numpy scipy scikit-learn pandas lightgbm boto3 s3fs flask gevent gunicorn && \
    rm -rf /root/.cache

# environment variable

# change buffer
ENV PYTHONUNBUFFERED=TRUE
# not to create .pyc
ENV PYTHONDONTWRITEBYTECODE=TRUE
# path
ENV PATH="/opt/program:${PATH}"

# copy
COPY PATH/TO/FILENAME.py /opt/program/

# dir
WORKDIR /opt/program