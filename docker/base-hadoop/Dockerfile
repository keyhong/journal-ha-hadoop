# === Stage 1: Ubuntu Build ===
ARG UBUNUTU_VERSION=22.04

FROM ubuntu:${UBUNUTU_VERSION} as linux-build-stage

# mirror 사이트 변경 (from ubuntu to kakao)
RUN sed -i 's|archive.ubuntu.com|mirror.kakao.com|g' /etc/apt/sources.list

ARG PYTHON_VERSION=3.10

# linux packagegs installation
RUN apt-get -qq update \
    && apt-get install --no-install-recommends -y \
    build-essential \
    vim \
    curl \
    # gnupg \
    procps \
    iputils-ping \
    openjdk-8-jdk \
    python${PYTHON_VERSION} \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3.10 /usr/bin/python

# Set JAVA_HOME PATH 
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/


# === Stage 2: Hadoop Build ===
FROM linux-build-stage as hadoop-build-stage

# CDN 미러 사이트를 이용해서 Hadoop 다운로드 (KAIST)
ARG HADOOP_VERSION=3.3.6 
ARG HADOOP_URL=http://apache.mirror.cdnetworks.com/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz

ENV HADOOP_HOME=/opt/hadoop

ENV HADOOP_CONF_DIR=${HADOOP_HOME}/etc/hadoop \
    PATH=${PATH}:${HADOOP_HOME}/sbin:${HADOOP_HOME}/bin \
    LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${HADOOP_HOME}/lib/native

RUN set -x \
    && curl -fL ${HADOOP_URL} -o /tmp/hadoop.tar.gz \
    && mkdir -p ${HADOOP_HOME}/logs \
    && tar -zxf /tmp/hadoop.tar.gz -C ${HADOOP_HOME} --strip-components 1 \
    && rm /tmp/hadoop*

# curl 옵션 설명 (https://curl.se/docs/manpage.html)
# -f, --fail : 서버 오류 시 출력이 전혀 없이 빠르게 실패합니다. 일반적인 경우에 HTTP 서버가 문서 전달에 실패하면 이를 설명하는 HTML 문서를 반환합니다(종종 이유 등을 설명하기도 함). 
# -s, --silent : 무음 또는 조용한 모드. 진행률 표시기나 오류 메시지를 표시하지 않습니다.
# -S, --show-error : "-s, --silent"와 함께 사용하면 컬이 실패할 경우 오류 메시지를 표시합니다.
# -L, --location : 서버가 요청한 페이지가 다른 위치(Location: 헤더 및 3XX 응답 코드로 표시됨)로 이동했다고 보고하는 경우, 이 옵션은 컬이 새 위치에서 요청을 다시 실행하도록 합니다.
# -o, --output <file> :  stdout 대신 <file>에 출력을 씁니다.

# sed 옵션 설명 (https://man7.org/linux/man-pages/man1/set.1p.html)
# -i[SUFFIX], --in-place[=SUFFIX] : 파일이 내부에서 편집되도록 지정합니다.
# -e script, --expression=script : 입력을 처리하는 동안 실행할 명령 집합에 스크립트 의 명령을 추가합니다.



# === Stage 3: Hive Build ===
FROM hadoop-build-stage as hive-build-stage

ARG HIVE_VERSION=3.1.3
ARG HIVE_URL=http://apache.mirror.cdnetworks.com/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz

ENV HIVE_HOME=/opt/hive

ENV HIVE_CONF_DIR=${HIVE_HOME}/conf \
    PATH=${PATH}:${HIVE_HOME}/sbin:${HIVE_HOME}/bin

RUN set -x \
    && curl -fL ${HIVE_URL} -o /tmp/hive.tar.gz \
    && mkdir -p ${HIVE_HOME} \
    && tar -zxf /tmp/hive.tar.gz -C ${HIVE_HOME} --strip-components 1 \
    && rm /tmp/hive*

RUN set -x \
    rm ${HIVE_HOME}/lib/guava-*.jar \
    && cp ${HADOOP_HOME}/share/hadoop/hdfs/lib/guava-*.jar ${HIVE_HOME}/lib/

# Copy local mysql.jar file to container
COPY "./conf/hive/mysql-connector-j-8.3.0.jar" "/opt/hive/lib/"

# === Stage 4: Zookeeper Build ===
FROM hive-build-stage as zookeeper-build-stage

ARG ZOOKEEPER_VERSION=3.9.1
ARG ZOOKEEPER_URL=http://apache.mirror.cdnetworks.com/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz

ENV ZOOKEEPER_HOME=/opt/zookeeper

ENV PATH=${PATH}:${ZOOKEEPER_HOME}/bin \
    ZOOKEEPER_CONF_DIR=${ZOOKEEPER_HOME}/conf

RUN set -x \
    && curl -fL "${ZOOKEEPER_URL}" -o "/tmp/zookeeper.tar.gz" \
    && mkdir -p "${ZOOKEEPER_HOME}/data" \
    && tar -zxf "/tmp/zookeeper.tar.gz" -C "${ZOOKEEPER_HOME}" --strip-components 1 \
    && rm /tmp/zookeeper*


# === Stage 5: Spark Build ===
FROM zookeeper-build-stage as spark-build-stage

ARG SPARK_VERSION=3.4.2
ARG SPARK_URL=http://apache.mirror.cdnetworks.com/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop3.tgz

ENV SPARK_HOME=/opt/spark

ENV SPARK_CONF_DIR=${SPARK_HOME}/conf \
    PATH=${SPARK_HOME}/sbin:${SPARK_HOME}/bin:${PATH} \
    PYTHONHASHSEED=1

RUN set -x \
    && curl -fL ${SPARK_URL} -o /tmp/spark.tgz \
    && mkdir -p ${SPARK_HOME} \
    && tar -zxf /tmp/spark.tgz -C ${SPARK_HOME} --strip-components 1 \
    && rm /tmp/spark*

RUN cp "/opt/hive/lib/mysql-connector-j-8.3.0.jar" "${SPARK_HOME}/jars/"


# === Stage 6: Airflow Build ===
FROM spark-build-stage as airflw-build-stage

ENV AIRFLOW_HOME=/opt/airflow

ARG AIRFLOW_VERSION=2.8.1
# PYTHON_VERSION=3.10

RUN set -x \
    && pip install virtualenv \
    && mkdir -p "${AIRFLOW_HOME}/venv" \
    && virtualenv "${AIRFLOW_HOME}/venv" \
    && . "${AIRFLOW_HOME}/venv/bin/activate" \
    && python -m pip install --upgrade pip \
    && pip install "apache-airflow[celery]==${AIRFLOW_VERSION}" \
        --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"
    # && pip install mysqlclient

# === Stage 7: Copy Config Files ===
FROM spark-build-stage as config-copy-stage

# Copy Hadoop Config Files to Container 
COPY "./conf/hadoop/*" "${HADOOP_CONF_DIR}"

# Zookeeper Config Files to Container
COPY "./conf/zookeeper/zoo.cfg" "${ZOOKEEPER_CONF_DIR}/zoo.cfg"
RUN sed -i 's/\r$//g' "${ZOOKEEPER_CONF_DIR}/zoo.cfg"

# Hive Config Files to Container
COPY "./conf/hive/hive-site.xml" "${HIVE_CONF_DIR}"

# Spark Config Files to Container 
COPY "./conf/spark/*" "${SPARK_CONF_DIR}"

# Copy hive-site.xml (Hard link)
RUN ln "${HIVE_CONF_DIR}/hive-site.xml" "${SPARK_CONF_DIR}/"

COPY "./conf/airflow/airflow.cfg" "/opt/airflow"

# Entry point
# COPY entrypoint.sh /usr/local/sbin/entrypoint.sh
# RUN sudo chmod a+x /usr/local/sbin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
