# Backpressure
우리말로 배압 또는 역압이라고 한다.
리액티브 프로그래밍에서는 Publisher가끊임없이 emit하는 무수히 많은 데이털를 적절하게 제어하여 데이터 처리에 과부하가 거리지 않도록 제어하는 것이 Backpressure의 역할이다.


## 데이터 개수 제어

### 메서드
subscribe()

**hookOnSubscribe()** : Subscriber 인터페이스에 정의 된 
onSubscribe() 에서드 대신에 구독 시점에 request() 메서드를 호출해서 최초의 데이터 요청 개수를 제어하는 역할

**hookOnNext()** :  Subscriber 인터페이스에 정의된 onNext() 메서드를 대신에 Publisher가 emit한 데이터를 전달받아 처리한 후에 Publisher에서 또다시 데이터를 요청하는 역할, 역시 request()를 호출해서 데이터 요청 개수를 제어 한다.


# Backpressure 전략

- **IGNORE** : Backpresssure를 적용하지 않는다.  
- **ERROR** : Downstream으로 전달할 데이터가 버퍼에 가득 찰 경우, Exception을 발생시키는 전략  
- **DROP** : Downstream으로 전달할 데이터가 버퍼에 가득 찰 경우, 버퍼 밖에서 대기하는 먼저 emit된 데이터부터 Drop시키는 전략  
- **LATEST** : DownStream으로 전달할 데이털가 버퍼에 가득 찰 경우, 버퍼 밖에서 대기 하는 가장 최근에(나중에) emit된 데이터부터 버퍼에 채우는 전략  
- **BUFFER** : Dwonstream으로 전달할 데이터가 버퍼에 가득 찰 경우, 버퍼 안에 있는 데이터부터 Drop 시키는 전략  

