FROM openjdk as build

ENV USER=admin \
    PASSWORD=password

COPY . ./

RUN [ "./gradlew", "build", "--no-daemon" ]

FROM atmoz/sftp:debian as deploy

ENV USER=admin \
    PASSWORD=password

VOLUME [ "/home/admin/config-repo" ]

EXPOSE 22 8080

ENTRYPOINT []

COPY --from=build build/libs/spring-cloud-config-sftp-1.0.0-SNAPSHOT.jar /opt/spring-cloud-config-sftp/
COPY --from=build /usr/java/default /opt/jdk

CMD /entrypoint ${USER}:${PASSWORD}:::config-repo & \
    exec /opt/jdk/bin/java -Xmx200m -Xms60m -XX:+ExitOnOutOfMemoryError -jar /opt/spring-cloud-config-sftp/spring-cloud-config-sftp-1.0.0-SNAPSHOT.jar
