#!/bin/bash

#The exit of download_deps needs to be trapped because the Docker build exits

function download_deps {
  #yum install -y yum-plugin-downloadonly
  #yum install -y --downloadonly 
  yum install -y hadoop_2_3_* hadoop_2_3_*-hdfs hadoop_2_3_*-mapreduce hadoop_2_3_*-yarn hadoop_2_3_*-libhdfs pig_2_3_* accumulo_2_3_* hive_2_3_* sqoop_2_3_* hbase_2_3_* datafu_2_3_* spark_2_3_* knox_2_3_* slider_2_3_* storm_2_3_* atlas-metadata_2_3_* atlas-metadata*-hive-plugin phoenix_2_3_* tez_2_3_* oozie_2_3_* falcon_2_3_* mysql-connector-java extjs ambari-metrics-collector ambari-metrics-monitor ambari-metrics-hadoop-sink rpcbind snappy snappy-devel mysql-server
}
trap download_deps EXIT