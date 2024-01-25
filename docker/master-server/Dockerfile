FROM keyhong/base-hadoop:1.0

ENV NAMENODE_DATA_DIR=/data/hadoop/dfs/name \
    JOURNALNODE_DATA_DIR=/data/hadoop/dfs/journal \
    YARN_DATA_DIR=/data/hadoop/yarn

RUN mkdir -p ${NAMENODE_DATA_DIR} ${JOURNALNODE_DATA_DIR} ${YARN_DATA_DIR}

RUN echo "1" > "/opt/zookeeper/data/myid"

# Copy Process Start Files to Container
ARG HOST_MASTER_DIR=./docker/master-server

RUN echo "hi"
# namenode
# COPY "${HOST_MASTER_DIR}/namenode/start" /start-nn
# RUN sed -i 's/\r$//g' /start-nn
# RUN chmod +x /start-nn

# journalnode
# COPY "${HOST_MASTER_DIR}/journalnode/start" /start-jn
# RUN sed -i 's/\r$//g' /start-jn
# RUN chmod +x /start-jn

# resource-manager
# COPY "${HOST_MASTER_DIR}/resource-manager/start" /start-rm
# RUN sed -i 's/\r$//g' /start-rm
# RUN chmod +x /start-rm

# yarn-history
# COPY "${HOST_MASTER_DIR}/yarn-history/start" /start-yh
# RUN sed -i 's/\r$//g' /start-yh
# RUN chmod +x /start-yh

# hive-metastore
# COPY "${HOST_MASTER_DIR}/hive-metastore/start" /start-hm
# RUN sed -i 's/\r$//g' /start-hm
# RUN chmod +x /start-hm

# # spark-history
# COPY "${HOST_MASTER_DIR}/spark-history/start" /start-sh
# RUN sed -i 's/\r$//g' /start-sh
# RUN chmod +x /start-sh

# RUN "zkServer.sh start zoo.cfg"
# COPY run.sh /usr/local/sbin/run.sh
# RUN sudo chmod a+x /usr/local/sbin/run.sh

COPY ./docker/master-server/entrypoint /entrypoint
RUN sed -i 's/\r$//g' /entrypoint
RUN chmod +x /entrypoint

ENTRYPOINT [ "/entrypoint" ]