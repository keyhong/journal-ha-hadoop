# Journal HA Hadoop Cluster

## Description
> https://keyhong.github.io/2024/02/07/Hadoop/hadoop3-docker-installation/

## Components

| Component                                  | Version | Description              |
|--------------------------------------------|---------|--------------------------|
| [Ubuntu](https://ubuntu.com/)              | 22.04   | The modern, open source operating system on Linux |
| [Python](https://www.python.org/)          | 3.10    | An interpreted, object-oriented, high-level programming language with dynamic semantics |
| [Hadoop](https://hadoop.apache.org/)       | 3.3.6   | A framework that allows for the distributed processing of large data sets across clusters of computers using simple programming models |
| [zookeeper](https://zookeeper.apache.org/) | 3.9.1   | A centralized service for maintaining configuration information, naming, providing distributed synchronization, and providing group services | 
| [Hive](https://hive.apache.org/)           | 3.1.3   | A distributed, fault-tolerant data warehouse system | 
| [spark](https://spark.apache.org/)         | 3.4.2   | A multi-language engine for executing data engineering, data science, and machine learningng |

## Getting Started

First, build the Docker image. Downloading open-source packages directly on Ubuntu may take some time depending on the network speed.

```bash
# Build a Docker image using a Makefile.
$ make build
```

> Note: If the download fails from the CDN server (Kakao mirror server), you can run `make build` again to resume the download from the point of failure. 

Then access the lakehouse services.

- HDFS Namenode Web UI: http://localhost:9870
- HDFS Datanode1 Web UI: http://localhost:9864
- HDFS Datanode2 Web UI: http://localhost:9865

<br/>
