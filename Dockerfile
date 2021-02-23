FROM amazon/aws-glue-libs:glue_libs_1.0.0_image_01

ADD requirements.txt .
ADD start.sh .
RUN chmod 777 start.sh

# add json-serde to calsspath
RUN curl https://s3-us-west-2.amazonaws.com/crawler-public/json/serde/json-serde.jar --output /home/spark-2.4.3-bin-spark-2.4.3-bin-hadoop2.8/jars/json-serde.jar

# install aws-sso-credential process
RUN python -m pip install --upgrade pip && python3 -m pip install -r requirements.txt

# install jq
RUN curl -o /usr/local/bin/jq http://stedolan.github.io/jq/download/linux64/jq && \
    chmod +x /usr/local/bin/jq

EXPOSE 8888 4040

CMD ["./start.sh"]