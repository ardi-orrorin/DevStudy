package main;

import reactor.core.publisher.Flux;

import java.security.Key;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Main {
    public static void main(String[] args) {

        List<String> list = new ArrayList<>();

        int end = 100;
        for(int start = 0; start<=end ; start++){
            list.add(String.valueOf(start));
        }

        String[] strings = list.toArray(String[]::new);
        Flux<String> sequence = Flux.just(strings);
        Flux.concat(sequence, sequence, sequence).collectList().subscribe(System.out::println);

    }
}
