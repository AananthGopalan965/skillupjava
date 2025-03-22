FROM openjdk:17-alpine
EXPOSE 8786
ADD target/skillupjava-cicd-HelloApp-1-0-0.jar skillupjava-cicd-HelloApp-1-0-0.jar
ENTRYPOINT ["java", "-jar", "/skillupjava-cicd-HelloApp-1-0-0.jar"]