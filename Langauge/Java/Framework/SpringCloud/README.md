# Tutorial
1. actuator 통한 헬스 체크 체험
2. HATEOS를 통한 경로 정보 전달 체험
3. 국제화 메시지 locale 처리 체험
   

# SpringConfig
경로별 접근방법  
1. /{application}/{profile}[/{label}]  
2. /{application}-{profile}.yml  
3. /{label}/{application}-{profile}.yml  
4. /{application}-{profile}.properties  
5. /{label}/{application}-{profile}.properties  


# DiscoveryService
DiscoveryClient
OpenFeign

# 프로젝트 구성 서버 관계
![](./relation.jpg)

1. [ConfigServer](./springConfig/cloudConfig/)
   1. 환경 설정 서버
   2. 각 서버에 환경 설정을 갖고 있는 서버
2. [serviceServer](./springConfig/cloudHamony/)  
   1. 서비스 서버
   2. 서비스의 로직을 담당하는 서버
3. [eurekaServer](./serviceDiscovery/eurekaClient/)
   1.  디스커버리 서버
   2.  서비스 검색이 가능하게 해준다.
4. [serviceSearchServer](./serviceDiscovery/discoveryClient/)
   1. 서비스 검색 서버
   2. 로드 밸런스

