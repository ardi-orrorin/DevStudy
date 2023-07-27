package com.kafka.test;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerRecord;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class Producer {

    public static void main(String[] args) {
        Properties configs = new Properties();
        configs.put("bootstrap.servers", "192.168.0.22:29092"); // kafka host 및 server 설정
        configs.put("acks", "all");                         // 자신이 보낸 메시지에 대해 카프카로부터 확인을 기다리지 않습니다.
        configs.put("block.on.buffer.full", "true");        // 서버로 보낼 레코드를 버퍼링 할 때 사용할 수 있는 전체 메모리의 바이트수
        configs.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");   // serialize 설정
        configs.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer"); // serialize 설정

        // producer 생성
        KafkaProducer<String, String> producer = new KafkaProducer<>(configs);

        // message 전달
        for (int i = 0; i < 10000; i++) {
            String v = "hello"+i;
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("ch01",v);

            producer.send(new ProducerRecord<String, String>("kafka-test", jsonObject.toString()));

        }

        // 종료
        producer.flush();
        producer.close();
    }
}
