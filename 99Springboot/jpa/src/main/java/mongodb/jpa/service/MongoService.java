package mongodb.jpa.service;

import mongodb.jpa.dto.MongoDTO;
import mongodb.jpa.repository.MongodbRepository;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class MongoService {
    private final MongodbRepository mongoRepository;

    private final ModelMapper modelMapper;

    public MongoService(MongodbRepository mongoRepository, ModelMapper modelMapper) {
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
