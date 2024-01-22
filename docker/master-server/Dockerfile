FROM keyhong/base-hadoop

ENV DATADIR=/opt/hadoop/dfs/data
RUN mkdir -p /opt/hadoop/dfs/data
VOLUME /opt/hadoop/dfs/data

ENV SPARK_PUBLIC_DNS=localhost
ENV SPARK_MASTER_ADDRESS=spark://master-server:7077

# Copy Process Start Files to Container
ARG HOST_MASTER_DIR=./docker/master

COPY "${HOST_MASTER_DIR}/hive/start-hive" /start-hive
RUN sed -i 's/\r$//g' /start-flower
RUN chmod +x /start-hive

COPY "${HOST_MASTER_DIR}/namenode/start" /start-namenode
RUN sed -i 's/\r$//g' /start-namenode
RUN chmod +x /start-namenode

COPY "${HOST_MASTER_DIR}/resource-manager/start" /start-rm
RUN sed -i 's/\r$//g' /start-rm
RUN chmod +x /start-rm

COPY "${HOST_MASTER_DIR}/spark-master/start" /start-spark-master
RUN sed -i 's/\r$//g' /start-spark-master
RUN chmod +x /start-spark-master

COPY "${HOST_MASTER_DIR}/hive-start.sh" /start-hive
RUN sed -i 's/\r$//g' /start-flower
RUN chmod +x /start-flower

COPY run.sh /usr/local/sbin/run.sh
RUN sudo chmod a+x /usr/local/sbin/run.sh


