package com.example.discoveryclient.service;

import com.example.discoveryclient.DTO.DiaryDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Service
@RequiredArgsConstructor
public class Dairy {

    private final DiscoveryClient discoveryClient;

    private final RestTemplate restTemplate;

    public List<DiaryDTO> getList(String param) {
        List<ServiceInstance> instances = discoveryClient.getInstances("hamony");
        System.out.println(instances.size());
        instances.forEach(System.out::println);

        RestTemplate restTemplate = new RestTemplate();

        String url = String.format("%s/diary/%s", instances.get(0).getUri().toString(), param);

        ResponseEntity<List<DiaryDTO>> responseEntity =
                restTemplate.exchange(url, HttpMethod.GET, null, new ParameterizedTypeReference<List<DiaryDTO>>() {
                }, param);

        return responseEntity.getBody();
    }

    public List<DiaryDTO> loadbalanceRestEmplate(String param) {
        System.out.println(param);
        ResponseEntity<List<DiaryDTO>> response =
                restTemplate.exchange(
                "http://hamony/diary/{param}",
                HttpMethod.GET, null,
                new ParameterizedTypeReference<List<DiaryDTO>>(){},
                param
        );

        System.out.println(response);
        return response.getBody();

    }
}
