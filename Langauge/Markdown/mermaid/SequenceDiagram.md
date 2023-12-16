```mermaid
sequenceDiagram
    A1->>B1: hello john, how are you?
    B1-->>A1: Great!
    A1-)B1: See you later!
```

1. participant

```mermaid
sequenceDiagram
    participant A1
    participant B1
    B1->>A1: TEST!!!!
    A1-->>B1: RESULT!!!!
    B1-)A1: WOW!!!!!
```

2. Actor

```mermaid
sequenceDiagram
    actor A1
    actor B1

    A1->>B1: Actor?
    B1-->>A1: Yes!
    A1-)B1: I'm No
```

3. aliases
   
```mermaid
sequenceDiagram
   participant a as A1
   participant b as B1
   a-->>b: aliase B1?
   b->>a: yes A1?
   a-)b: Yes! 
```

```mermaid
sequenceDiagram
   A1->>B1: Test!
   B1->>A1: TEST!! 
   create participant c as C1
   A1->>c: TEST!?
   A1-xc: ????
```

4. Group Box

```mermaid
sequenceDiagram
   box blue Box Test
   participant A
   participant J
   end
   box Red Box Test2
   participant H
   participant R
   end
   A->>H: 1
   H->>R: 2
   R->>H: 3
   H->>J: 4
   J->>H: 5
   H->>A: 6 end
```

5.Messages
|Type | Description |
|----|------|
|->	|Solid line without arrow|
|-->|	Dotted line without arrow|
|->>|	Solid line with arrowhead|
|-->>|	Dotted line with arrowhead|
|-x	|Solid line with a cross at the end|
|--x|	Dotted line with a cross at the end.|
|-)|	Solid line with an open arrow at the end (async)|
|--)|	Dotted line with a open arrow at the end (async)|


1. Activations
```mermaid
sequenceDiagram
    A1->>B1: test!
    activate B1
    B1->>A1: Test!!
    deactivate B1
```
```mermaid
sequenceDiagram
    A1->>+B1: test!
    B1->>-A1: Test!!
```

```mermaid
sequenceDiagram
    A1->>+B1: test!
    A1->>+B1: test!
    B1->>-A1: Test!!
    B1->>-A1: Test!!
```

7. Notes
```mermaid
sequenceDiagram
    participant A
    note right of A: Test A Right Note
    note left of A: Test A Left Note
    participant B
    note over A,B: Test Over Note
    note over A,B: Test Over Note<br/>New Line Text
```
 

8. Loops
```mermaid
sequenceDiagram
    A1->B1: Hello?
    loop Every minute
        B1-->A1: Loop!
    end

```


9. Criticl Region
```mermaid
sequenceDiagram
    critical Establish a connection to the DB
        A1-->B1: connect
    option Network timeout
        A1-->A1: Log error
    option Credentials rejected
        A1-->A1: Log different error
    end
```

```mermaid
sequenceDiagram
    A1->>B1: test
    A1-->>A1: reject
    B1->>A1: send
```

10. Comments
    
```mermaid
sequenceDiagram
    A1->>B1: comments?
    %% this is a comment
    B1->>A1: Yes?

```

11. Escape characters

```mermaid
sequenceDiagram
    A->>B: I #9829; you!
    B->>A: #9829; you #infin; imes more!
```


12. sequenceNumbers
    
```mermaid
sequenceDiagram
    autonumber
    A->>B: hello?
    loop healthcheck
        B->>B: loop
    end
    B->>A: Test
    B->>A: Check!
    A->>B: test
```

