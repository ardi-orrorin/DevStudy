# 추상 팩토치 패턴

### AbstractFactory Vs FactoryMethod
| | AbstractFactory | FactoryMethod |
|---|---|---|
|공통점| 객체 생성 과정을 추상화한 인터페이스를 제공||
|차이점| - 관련 있는 여러개 객체를 구체적인 클래스에 의존하지 않고 만들 수 있게 해는 것이 목록 <br/> - 한 Factory에서 서로 연관된 여러 종류의 객체 생성을 지원 <br/> - 클래스(Factory) 레벨에서 포커스를 맞춤으로써, 클라이언트의 ConcreteProduct 인스턴스 군의 생성 및 구성에 대한 의존을 감소 | - 구체적인 객체 생성과정을 하위 또는 구체적인 클래스로 옮기는 것이 목적 <br/> - 한 Factory당 한 종류의 객체 생성 지원 <br/> - 메소드 레벨에서 포커를 맞춤응로써, 클라이언트의 ConcreteProduct 인스턴스의 생성 및 구성에 대한 의조을 감소

### 패턴 다이어그램
```mermaid
classDiagram
direction TD
class AbstractFactory {
    <<interface>>
    + createProductA()
    + createProductB()
}
class Client{ }
class ConcreteFactory1 {
    + createProductA()
    + createProductB()
}
class ConcreteFactory2 {
    + createProductA()
    + createProductB()
}

    Client --> AbstractFactory
    AbstractFactory <|-- ConcreteFactory2
    AbstractFactory <|-- ConcreteFactory1

class AbstractProductA {
    <<interface>>
}
class AbstractProductB {
    <<interface>>
}    
class ConcreteProductA1 { }
class ConcreteProductA2 { }
class ConcreteProductB1 { }
class ConcreteProductB2 { }

    ConcreteFactory1 <-- ConcreteProductA1
    AbstractProductA <|-- ConcreteProductA1
    AbstractProductA <|-- ConcreteProductA2
    ConcreteFactory1 <-- ConcreteProductB1
    
    ConcreteFactory2 <-- ConcreteProductA2
    AbstractProductB <|-- ConcreteProductB1
    AbstractProductB <|-- ConcreteProductB2
    ConcreteFactory2 <-- ConcreteProductB2


```