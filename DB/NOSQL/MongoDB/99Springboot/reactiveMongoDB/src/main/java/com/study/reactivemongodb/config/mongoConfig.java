package com.study.reactivemongodb.config;

import org.springframework.data.mongodb.config.AbstractReactiveMongoConfiguration;
import org.springframework.data.mongodb.repository.config.EnableReactiveMongoRepositories;

@EnableReactiveMongoRepositories
public class mongoConfig extends AbstractReactiveMongoConfiguration {

}
