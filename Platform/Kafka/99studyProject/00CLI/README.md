# 검증

## show topic list
kafka-topics.sh --booststrap-server localhost:2181 --list



## 비 검증
## 키기 zookeeper -> server
zookeeper-server-start.sh /usr/local/kafka/config/zookeeper.properties
kafka-server-start.sh /usr/local/kafka/config/server.properties

## create the topic
kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic test
kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic numtest

## show the topic
kafka-console-consumer.sh --bootstrap-server localhost:9092 --from-beginning --topic numtest

## show the topic partiton 1
kafka-console-consumer.sh --bootstrap-server localhost:9092 --from-beginning --partition 1 --topic numtest

## delete the topic
kafka-topics.sh --zookeeper localhost:2181 --delete --topic my_topic

## 끄기 server -> zookeeper
kafka-server-stop.sh config/server.properties
zookeeper-server-stop.sh config/zookeeper.properties

## consumer groups check!
kafka-consumer-groups.sh  --bootstrap-server localhost:9092 --list

## consumer status and offset check!
kafka-consumer-groups.sh  --bootstrap-server localhost:9092 --group sr --describe

## consumer group delete
kafka-consumer-groups.sh --zookeeper localhost:2181 --delete --group <group_name>

## topic leader follower check 
kafka-topics.sh --zookeeper localhost:2181 --topic my_topic --describe

## server log check
cat /usr/local/kafka/logs/server.log 