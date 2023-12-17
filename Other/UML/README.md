## UML(Unified Modeling Language)

## 관계

### 연관 관계
클래스 A와 B는 연결되어 있다.
```mermaid
classDiagram
    direction LR
    class A {
    }
    class B {
    }
    A"1" --"0..*" B
```
```java
class A {
    private Collection<B> b;
}
class B {
    private A a;
}
```

### 합성 관계
클래스 A는 클래스 B를 한 개 이상 포함하고 있다.
```mermaid
classDiagram
    direction LR
    class A {
    }
    class B {
    }
    A*-- "1..*" B
```

### 집합 관계
클래스 B는 클래스 A의 부분이다.
```mermaid
classDiagram
    direction LR
    class A {
    }
    class B {
    }
    A o--  B
```


### 일반화 관계
클래스 B는 클래스 A의 하위 클래스이다.
```mermaid
classDiagram
    direction LR
    class A {
        +method() void
    }
    class B {
        +method() void
    }
    A<|-- B
```
```java
class A {
    public void method() {}
}

class B Extends A {
    @override
    public void method() {}
}
```

### 실체화 관계
클래스 B는 인터페이스A를 구현한다.
```mermaid
classDiagram
    direction LR
    class A {
        <<interface>>
    }
    class B {
    }
    A<|.. B
```
```java
interface A {
    public void method() {}
}

class B implements A {
    @override
    public void method(){}
}
```

### 의존 관계
클래스 A는 클래스 B에 의존한다.
```mermaid
classDiagram
    direction LR
    class A {
    }
    class B {
    }
    A ..> B
```

```java
class A {
    public void b(B b){
        b.method();
    }
}
class B {
    public void method(){}
}
```


### 의존 관계
클래스 A는 인터페이스 B에 의존한다.
```mermaid
classDiagram
    direction LR
    class A {
    }
    class B {
        <<interface>>
    }
    A ..> B
```

```mermaid
classDiagram
    direction BT
    class A {
        +b() void
    }
    class B {
        <<interface>>
        method() void
    }
    class C {
        method() void
    }
    A ..> B
    C ..|> B

```

```java
class A {
    public void b(){
        B b = new C();
        b.method();
    }
}

interface B {
    public void method(){}
}

class C implements B {
    @override
    public void method(){}
}
```

