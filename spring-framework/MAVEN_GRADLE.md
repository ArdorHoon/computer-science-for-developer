# 빌드 도구 (Maven, Gradle)

<mark>**소프트웨어 개발에 있어서 소스 코드를 실행 가능한 애플리케이션으로 만들어 주는 도구**</mark>

- 빌드는 프로그램을 실행 가능 한 배포 파일을 만들어 내는 것, 즉 배포 가능한 형태로 만드는 것을 의미
- 소스 코드에서 application을 생성하면서 여러 가지 **외부 라이브러리**를 사용하는데, 빌드 도구는 사용자가 관리할 필요 없이 필요한 라이브러리들을 자동으로 관리


</br>

## 1️⃣ Maven
<mark>**Java 전용 프로젝트 관리 도구로, Lifecycle 관리 목적 빌드 도구이며, Apache Ant의 대안으로 만들어짐**</mark>


### ✴️ Maven 라이프사이클
> Clean ➡️ Vaildate ➡️ Compile ➡️ Test ➡️ Package ➡️ Verify ➡️ Install ➡️ Site ➡️ Deploy 

</br>

1. clean : 빌드 시 생성되어있었던 파일들을 삭제
2. validate : 프로젝트가 올바른지 확인하고 필요한 모든 정보를 사용할 수 있는지 확인하는 단계
3. compile : 프로젝트 소스코드를 컴파일 하는 단계
4. test : 단위 테스트를 수행하는 단계
5. package : 실제 컴파일된 소스 코드와 리소스들을 jar, war 등의 파일의 배포를 위한 패키지
6. verify : 통합 테스트 결과에 대한 검사를 실행하여 품질 기준을 충족하는지 확인
7. site : 프로젝트 문서와 사이트 작성, 생성하는 단계
8. deploy : 만들어진 package를 원격 저장소에 release하는 단계


</br>

Maven은 필요한 라이브러리 <code>**pom.xml**</code>에 정의한다. 이를 프로젝트 모델링이라고 한다. (pom은 Project Object Model의 약자로, <code>**프로젝트 정보**</code>, <code>**빌드 설정**</code>, <code>**빌드 환경**</code>, <code>**pom 연관 정보**</code>를 담고 있다.)

</br>

### ✴️ Maven 특징

- Maven은 빌드도구이지만 설정파일에 '소스 파일의 위치'나 컴파일한 결과를 저장할 'Target폴더의 위치'를 지정하지 않는다.
- 미리 정해둔 관습 의거해서 어디에 소스 파일이 위치할 것인지 어디에 컴파일한 파일을 만들것인지를 미리 정해두고 그 위치에 소스파일이 있다면 그것을 근거로 빌드 작업을 진행
- 설정보다는 관습을 기반으로 동작하는 특징을 가리켜서 'CoC(Convention over Configuration)'이라고 한다.


</br>

아래는 간단한 POM.xml 예제
```xml

<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0modelVersion>


    <groupId>com.example</groupId>
    <artifactId>my-app</artifactId>
    <version>1.0-SNAPSHOT</version>

    <properties>
        <maven.compiler.source>1.8</maven.compiler.source>
        <maven.compiler.target>1.8</maven.compiler.target>
    </properties>

    <dependencies>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.12</version>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.0</version>
                <configuration>
                    <source>1.8</source>
                    <target>1.8</target>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>

```


</br>

## 2️⃣ Gradle

<mark>**Maven을 대체할 수 있는 프로젝트 구성 관리 및 범용 빌드툴이며, Ant Builder와 Groovy script를 기반으로 구축되어 기존 Ant의 역할과 배포 스크립의 기능을 모두 사용가능**</mark>

빌드 속도가 Maven에 비해 10~100배 가량 빠르며, Java, C/C++, Python 등을 지원

> Groovy는 JVM에서 실행되는 스크립트 언어이다. JVM에서 동작하지만 소스코드를 컴파일할 필요 없다. (JAVA와 호환)

</br>

### ✴️ Gradle 특징
1. 가독성이 좋음 : 코딩에 의한 간결한 정의가 가능
2. 재사용에 용이 : <code>설정 주입 방식</code>을 사용하므로 재사용에 용이
3. 구조적이니 장점 : Build Script를 Groovy 기반의 DSL를 사용하여 코드로서 설정 정보를 구성하므로 구조적인 장점 
4. 편리함 : Gradle 설치 없이 **Gradle wrapper**를 이용하여 빌드를 지원
5. 멀티 프로젝트 : Gradle은 멀티 프로젝트 빌드를 지원하기 위해 설계된 빌드 관리 도구
6. 지원 : Maven을 완전 지원

</br>

아래는 간단한 gradle 예제

```groovy

buildscript {
    ext {
        springBootVersion = '2.3.7.RELEASE'
        lombokVersion = '1.18.10'
    }
    repositories {
        mavenCentral()
        jcenter()
    }
    dependencies {
        classpath("org.springframework.boot:spring-boot-gradle-plugin:${springBootVersion}")
    }
}

apply plugin: 'java'
apply plugin: 'eclipse'
apply plugin: 'org.springframework.boot'
apply plugin: 'io.spring.dependency-management'

group 'gradle.test.javaapp'
version '1.0-SNAPSHOT'
sourceCompatibility = 1.8

repositories {
    mavenCentral()
    jcenter()
}

dependencies {

    implementation 'org.springframework.boot:spring-boot-starter-web'
    // api '...'

    testImplementation 'org.springframework.boot:spring-boot-starter-test'

    compileOnly "org.projectlombok:lombok:$lombokVersion"
    // runtimeOnly '...'

    annotationProcessor "org.projectlombok:lombok:$lombokVersion"

}


```

</br>

## 3️⃣ Maven과 Gradle 비교

Maven은 간단한 프로젝트나 명확한 구조나 표준화가 요구되는 프로젝트에 적합하고, Gradle은 복잡한 빌드 요구사항을 효과적으로 처리할 수 있기 때문에 성능 최적화가 필요하거나 복잡한 빌드 프로세스를 관리해야하는 경우 선택하면 좋다.


</br>
