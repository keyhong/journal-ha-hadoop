FROM keyhong/base-hadoop:1.0

RUN sed -i "s|\$(hostname)|0.0.0.0|g" "${ZOOKEEPER_CONF_DIR}/zoo.cfg"

ENV NAMENODE_DATA_DIR=/data/hadoop/dfs/name \
    DATANODE_DATA_DIR=/data/hadoop/dfs/data \
    JOURNALNODE_DATA_DIR=/data/hadoop/dfs/journal \
    YARN_DATA_DIR=/data/hadoop/yarn

RUN mkdir -p ${NAMENODE_DATA_DIR} ${DATANODE_DATA_DIR} ${JOURNALNODE_DATA_DIR} ${YARN_DATA_DIR}


RUN echo "2" > "/opt/zookeeper/data/myid"

# RUN "zkServer.sh start zoo.cfg"
# TODO: Copy Process Start Files to Container
# RUN sed -i 's/\r$//g' /start-nn
# RUN chmod +x /start-nn

# datanode

# journalnode

# resource-manager

# node-manager

# COPY run.sh /usr/local/sbin/run.sh
# RUN sudo chmod a+x /usr/local/sbin/run.sh

COPY ./docker/master-server/entrypoint /entrypoint
RUN sed -i 's/\r$//g' /entrypoint
RUN chmod +x /entrypoint

ENTRYPOINT [ "/entrypoint" ]