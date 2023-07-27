package com.kafka.test;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.KafkaConsumer;

import java.util.Arrays;
import java.util.Map;
import java.util.Properties;

public class KafkaTests {

    public static void main(String[] args) {
        Properties configs = new Properties();
        configs.put("bootstrap.servers", "localhost:29092");
        configs.put("session.timeout.ms", "10000"); // session 설정
        configs.put("group.id", "quickstart-events");   // topic 설정
        configs.put("key.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
        configs.put("value.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");

        KafkaConsumer<String, String> consumer = new KafkaConsumer<>(configs);
//        consumer.subscribe(Arrays.asList("quickstart-events","kafka-test"));
        consumer.subscribe(Arrays.asList("quickstart-events","kafka-test"));

        while (true){
            ConsumerRecords<String, String> records = consumer.poll(100);
            for(ConsumerRecord<String, String> record : records){
                String input = record.topic();
                System.out.println("record(key) = " + record.key());
                if("quickstart-events".equals(input)){

                    System.out.println("record = " + record.value());
                }else {
                    Map<String, String > jsonObject = new Gson().fromJson(record.value(), Map.class);

                    System.out.println("record = " + jsonObject.get("ch01"));
                    System.out.println("record = " + record.value());
                    System.out.println("input = " + input);
                }
            }
        }

    }

}
