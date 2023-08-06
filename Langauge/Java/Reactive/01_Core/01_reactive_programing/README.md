# 리액티브 프로그래밍 코드 구성

### 1. Publisher

발행자, 게시자, 생산자, 방출자등 데이터를 제공하는 역할

### 2. Subscriber

Publisher가 제공하는 데이터를 전달받아서 사용하는 주체

### 3. Data Source

Publisher의 입력으로 들어오는 데이터를 일컸는다.
리액티브 프로그래밍에서는 Data Stream이라고 표현하기도 한다.

차이점은 Data Source는 원천 데이터를 말하며, 최초로 생성된 데이터 그 자체를 말한다.
Data Stream은 Stream은 연속적으로 흐른다는 의미로, 데이터가 끊임없이 입력이 들어오는 것을 의미 한다.
즉, Data Source 가 끊이 없이 들어오는 모습을 보여 Data Stream이라고 부르기도 하는 것이다.

### 4. Operator

Publisher와 Subscriber의 중간에서 데이터를 가공 및 처리를 담당하는 주체


