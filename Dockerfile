FROM openjdk:17

ENV TZ=Asia/Karachi
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /opt/app

COPY target/user-score-service-0.0.1-SNAPSHOT.jar .
#COPY log4j.properties .
#COPY database.properties .

EXPOSE 9090

ENTRYPOINT ["java" , "-jar" , "user-score-service-0.0.1-SNAPSHOT.jar"]
CMD [""]
