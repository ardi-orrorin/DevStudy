package mongodb.jpa.repository;

import mongodb.jpa.entity.Mongo;
import org.springframework.data.mongodb.repository.MongoRepository;


public interface MongodbRepository extends MongoRepository<Mongo, String> {

}
