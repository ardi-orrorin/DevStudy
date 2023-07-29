package mongodb.service;

import mongodb.dto.MongoDTO;
import mongodb.repository.MongoRepository;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class MongoService {
    private final MongoRepository mongoRepository;

    private final ModelMapper modelMapper;

    public MongoService(MongoRepository mongoRepository, ModelMapper modelMapper) {
        this.mongoRepository = mongoRepository;
        this.modelMapper = modelMapper;
    }

    public List<MongoDTO> findAll(){
        return mongoRepository.findAll()
                .stream()
                .map(mongo -> modelMapper.map(mongo, MongoDTO.class))
                .collect(Collectors.toList());
    }
}
