# Journal HA Hadoop Cluster

description: https://keyhong.github.io/2024/02/07/Hadoop/hadoop3-docker-installation/

| Component                              | Version | Description              |
|----------------------------------------|---------|--------------------------|
| [Ubuntu](https://ubuntu.com/)          | 22.04   | Operating System         |
| [Hadoop](https://hadoop.apache.org/)   | 3.3.6   | Distributed File System  |


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
