# 리액티브 스트림즈 구성요소

API 컴포넌트에는 Publisher, Subscriber, Subscription, Processor가 있다.

1. **Publisher** : 데이터를 생성하고 통지하는 역할
2. **Subscriber** : 구동한 Publisher로부터 데이터를 전달 받아서 데이터를 처리하는 역할
3. **Subscription** : Publisher에 요청할 데이터의 개수를 지정, 데이터의 구독을 취소하느 역할
4. **Processer** : Publisher, Subscriber의 기능을 모두 가지고 있다.

<br>

# 리액티브 스트림즈 관련 용어 정의
1. **Signal** : Publisher와 Subscriber간에 주고받은 상효작용, onComplte, onError, request, cancel 메서드가 대표적
2. **Demand** : Subscriber가 Publisher 에게 요청하는 데이터를 의미로 정확하게는 Publisher가 아직 Subscriber에게 전달하지 않은 데이터를 요청하는 것을 말한다.
3. **Emit** : Publisher가 Subscriber에게 데이터를 전달하는 행위를 '통지'한다라고 한다.
4. **Upstream/ DownStream** : 메서드 체인에서 상대적인 위치의 말할 때 사용하며 나중에 쓰여진 메서드를 DownStream,  이전에 쓰여진 메서드를 Upstream이라고 한다.
5. **Sequence** : 메서드 체인에 의해 Operator의 흐름을 Sequence라고 한다.
6. **Operator** : 연사자라는 의미로 메서드 체인에서 just,fiter,map같은 메스드들을 말한다.
7. **Source** : Data Source, Source Publisher, Source Flux등 들 수 있는데, 대부분 최초라른 의미로 사용된다. Original이라고 말하기도 한다.

<br>

# 리액티브 스트림즈의 구현 규칙(Publisher)
1. Publisher가 Subscriber에게 보내는 OnNext signal의 총 개수는 항상 해당 Subscriver의 구독을 통해 요청된 데이터의 총 개수보다 더 작거나 같아야 한다.
2. Publisher는 요청된 것보다 적은 수의 onNext signal을 보내고 onComplete 또는 onError을 호출하여 구독을 종료 할 수 있다. 단, IoT처럼 데이터가 끊이 없이 발생하는 무한 스트림의 경우는 예외이다.
3. Publisher의 데이터 처리가 실패하면 onError signal을 보내야 한다.
4. Publisher의 데이터 처리가 성공적으로 종ㅇ료되면 onComplete signal을 보내야 한다.
5. Publisher가 Subscriber에게 onError 또는 onComplete signal을 보내는 경우 해당 Subscriber의 구독은 취소된 거승로 간주되어야 한다.
6. 일단 종료 상태 signal을 받으면(onError, onComplete)는 더 이상 signal이 발생되지 않아야 한다.
7. 구독이 취소되면 Subscriber는 결국 signal을 받는 것을 중지해야 한다.

<br>

# 리액티브 스트림즈의 구현 규칙(Subscriber)
1. Subscriber는 Publisher로 부터 onNext signal을 수신하기 위해 Subscription.request(n)을 통해 Demand signal을 Publisher에게 보내야한다. 즉 데이터를 언제, 얼마나 수신할 수 있는 지를 결정하는 건 Subscriber에게 있다는 것을 확립하는 것,
2. Subscriber.OnComplete()및 Subscriber.onError(Throwable t)는 Subscription 또는 Publisher의 메서드를 호출해서는 안된다.
3. Subscriber.OnComplete()및 Subscriber.onError(Throwable t)는 signal을 수신한 후 구독이 취소된 거으로 간주해야 한다.
4. 구독이 더 이상 필요하지 않는 경우 Subscriber는 Subscription.cancel()을 호출해야 한다.
5. Subscriber.onSubscribe()는 지정된 Subscriver에 대해 최대 한 번만 호출되어야 한다.

<br>

# 리액티브 스트림즈의 구현 규칙(Subscriber)
1. 구득은 Subscriber가 onNext 또는 onSubscribe 내에서 동기적으로 Subscription.request를 호출하도록 허용해야 한다. (request와 onNext사이에 상호 재귀로 인한 오버 플로를 피해야 한다.)
2. 구독이 취소된 후 추가적으로 호출되는 Subscription.request(long n)는 효력이 없어야 한다.
3. 구독이 취소된 후 추가적으로 호출되는 Subscription.cancel()은 효력이 없어야 한다.
4. 구독이 취소되지 않은 동안 Subscription.request(long n)의 매개변수가 0보다 작거나 같으면 IllegalArgumentException과 함게 onError signal을 보내야 한다.
5. 구독이 취소되지 않은 동안 Subscription.cancel()은 Publisher가 Subscriber에게 보내는 signal을 결국 중지하도록 요청해야 한다.
6. 구독이 취소되지 않은 동안 Subscription.cancel()은 Publisher에게 해당 구독자에 대한 참조를 결국 삭제하도록 요청해야 한다.
7. Sjubscription.cancel(), Subscription.request() 호출에 대한 응답으로 예외를 던지는 것을 허용하지 않는다.
8. 구독은 무제한 수의 request 호출을 지원해야 하고 최대 2^63-1개의 Demand를 지원해야 한다.(무한 스트림 지원)

