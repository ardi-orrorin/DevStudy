## build 후 dockerfile로 변환하는 레이엉
FROM openjdk:17-slim as build
#FROM eclipse-temurin:17-jdk-alpine as build

COPY ${JAR_FILE} app.jar

#RUN mkdir -p target/dependency
#RUN cd target/dependency;
#RUN jar -xf ./app.jar

ENTRYPOINT ["java","-jar","/app.jar"]


## 분해된 build 파일을 다시 jar 파일을 volume으로 빼내는 레이어
#FROM eclipse-temurin:17-jdk-alpine
#VOLUME /tmp
#ARG DEPENDENCY=target/dependency
#COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
#COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
#COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app
#
#ENTRYPOINT ["java","-cp","app:app/lib/*","com.example.tutorial.TutorialApplication"]
