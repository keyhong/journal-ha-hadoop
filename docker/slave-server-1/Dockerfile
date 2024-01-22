FROM keyhong/base-hadoop

# Copy Hadoop Config Files to Container 
ARG HOST_HADOOP_CONF_DIR=./conf/hadoop

ENV DATADIR=/opt/hadoop/dfs/data
RUN mkdir -p /opt/hadoop/dfs/data

ENV SPARK_MASTER_ADDRESS=spark://master-server:7077

COPY run.sh /usr/local/sbin/run.sh
RUN sudo chmod a+x /usr/local/sbin/run.sh


