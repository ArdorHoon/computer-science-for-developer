# Http와 Https


## http
<mark>텍스트 기반의 통신 규약으로 **인터넷에서 데이터를 주고받을 수 있는 프로토콜**</mark>

**Http Version**
```
- HTTP/1.1 (1997년, TCP) : 가장 많이 사용, 우리에게 가장 중요한 버전
- HTTP/2 (2015년, TCP) : 성능 개선
- HTTP/3 (진행 중, UDP) : TCP 대신에 UDP 사용, 성능 개선
```

### http 특징
- Client-Server 구조
- 무상태 프로토콜
- 비연결성
- HTTP 메세지
- 단순함, 확장가능
- 거의 모든 형태의 데이터 전송 가능 (HTML, TEXT, 이미지, 음성 영상, 파일) 

</br>

#### 🔵 Client-Server 구조

- Request Response 구조
- 클라이언트는 서버에 요청을 보내고 응답을 대기
- 서버가 요청에 대한 결과를 만들어서 응답

클라이언트와 서버를 분리하여 각각 독립적으로 관리가 가능</br>
=> "<code>Client</code>는 UI 및 사용성에 집중" , "<code>Server</code>는 비즈니스 로직 및 데이터를 관리"</br></br>


#### 🔵 Stateless(무상태) 프로토콜

Stateless(무상태)
- Server가 Client의 상태를 보존하지 않음
- 장점 : Scale out (서버 확장성이 높음)
- 단점 : 클라이언트가 추가 데이터 전송 

즉, 서버에 과부하가 와도 확장을 하는게 쉬워진다. 하지만 이에 따라 한계점도 존재한다.

상태를 유지해야하는 상황에서는 추가적인 비용이 든다. (예 : 로그인)</br>
이를 위해 일반적으로 브라우저 쿠키와 세션을 사용한다. 그래서 추가적인 데이터를 보내야 한다.</br>
이러한 추가적인 리소스 때문에 설계 단계에서 최소한만 사용해야 한다.</br>



#### 🔵 비연결성(connectionless)

- HTTP는 기본이 연결을 유지하지 않는 모델
- 일반적으로 초 단위의 이하의 빠른 속도로 응답
- 서버 자원을 효율적으로 사용할 수 있음
- 지속 연결을 해야 하는 경우 **HTTP 지속 연결(Persistent Connections)** 로 문제해결

이 부분이 서버 개발자가 가장 많이 고려하고 어려워하는 업무라고 한다. 특히 대용량 트래픽을 다루는 서비스에서는 connectionless를 고려해서 설계를 해야 한다.
(예 : 선착순 이벤트, KTX 예약, 티켓팅)</br>

#### 🔵 HTTP 메세지 구조

<p align="center">
<img src="https://github.com/user-attachments/assets/a0c9a0ac-deb9-486e-aad5-abf91aa7b684" width="50%" height="50%"></br>
</p></br>

- 시작 라인 : HTTP 메서드, 요청 대상, HTTP Version (예 : GET /search?q=hello&hi=ko HTTP/1.1)
- Header 라인 : HTTP 전송에 필요한 모든 부가 정보 (예 : 인증, 요청 클라이언트 정보, 서버 어플리케이션 정보, 캐시 관리 정보 등)
  - Host: www.google.com, Content-Type : text/html:charsset=UTF-8
- message body : 실제 전송할 데이터 (HTML 문서, 이미지, 동영상, JSON 등등 byte로 표현할 수 있는 모든 데이터 전송 가능)


</br>


## https 
