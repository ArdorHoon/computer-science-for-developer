# 빌드 관리 도구 (Maven, Gradle)

<mark>**소스 코드에서 application을 생성하면서 여러가지 **외부 라이브러리**를 사용하는데, 빌드 관리도구는 사용자가 관리할 필요 없이 필요한 라이브러리들을 자동으로 관리**</mark>

</br>

## 1️⃣ Maven
<mark>**Java 전용 프로젝트 관리 도구로, Lifecycle 관리 목적 빌드 도구이며, Apache Ant의 대안으로 만들어짐**</mark>


### ✴️ Maven 라이프사이클
> Clean ➡️ Vaildate ➡️ Compile ➡️ Test ➡️ Package ➡️ Verify ➡️ Install ➡️ Site ➡️ Deploy 

</br>

1. clean : 빌드 시 생성되어있었던 파일들을 삭제
2. validate : 프로젝트가 올바른지 확인하고 필요한 모든 정보를 사용할 수 있는지 확인하는 단계
3. compile : 프로젝트 소스코드를 컴파일 하는 단계
4. test : 단위 테스트를 수행는 단계
5. package : 실제 컴파일된 소스 코드와 리소스들을 jar, war 등의 파일의 배포를 위한 패키지
6. verify : 통합 테스트 결과에 대한 검사를 실행하여 품질 기준을 충족하는지 확인
7. site : 프로젝트 문서와 사이트 작성, 생성하는 단계
8. deploy : 만들어진 package를 원격 저장소에 release하는 단계


</br>

Maven은 필요한 라이브러리 <code>**pom.xml**</code>에 정의한다. 이를 프로젝트 모델링이라고 한다. (pom은 Project Object Model의 약자로, <code>**프로젝트 정보**</code>, <code>**빌드 설정**</code>, <code>**빌드 환경**</code>, <code>**pom 연관 정보**</code>를 담고 있다.)



</br>

## 2️⃣ Gradle



</br>
