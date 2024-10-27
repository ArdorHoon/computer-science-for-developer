# Socket

<mark> BSD UNIX에서 개발한 Transport Layer와 Application Layer 사이에 있는 네트워크 프로그래밍 인터페이스 </mark>

## Socket 구성
<code>**프로토콜**</code>, <code>**IP**</code>, <code>**포트 번호**</code>로 구성</br>

Socket은 IP(해당 장치 위치)와 Port(장치 내 해당 응용 프로그램 위치)를 통해 데이터를 전송한다.  

## Socket 통신 흐름

<p align="center">
<img src="https://github.com/user-attachments/assets/3cfb4cce-faf7-4072-a556-ebd8329dbf86" width="60%" height="60%"></p></br>


### 🟦 Client
1. Socket 생성
2. Connection 요청
3. 데이터 송수신
4. Socket 닫기

### 🟦 Server
1. Socket 생성
2. bind (ip, port 설정)
3. listen (Client 접근 요청에 수신 대기열을 만들어 몇 개의 Client 대기시킬지 결정)
4. accept (Client와 연결)
5. 데이터 송수신
6. Socket 닫기

</br></br>


## Socket 종류


### 🟦 스트림 (TCP)
1. TCP를 사용하는 연결 지향방식의 소켓
2. 송수신자의 연결을 보장
3. 송신된 순서에 따라 중복되지 않게 데이터를 수신 - 오버헤드
4. 소량의 데이터보다 대량의 데이터 전송에 적합
5. 점대점 연결 

### 🟦 데이터그램 (UDP)
1. UDP를 사용하는 비연결형 소켓
2. 데이터 크기에 제한 있음
3. 데이터 순서와 신뢰성 보장 어려움
4. 점대점 뿐만 아니라 일대다 연결도 가능


|특징|Stream Socket|Datagram Socket|
|------|---|---|
|연결 방식|연결지향|비연결지향|
|신뢰성|신뢰성|비신뢰성|
|데이터 전송 방식|byte stream|datagram|
|전송 순서 보장|보장|보장 안함|
|전송 효율성|오버헤드 큼|오버헤드 적음|
|주요 프로토콜|TCP|UDP|
|사용처|이메일, 파일 전송, 웹 브라우징|스트리밍, 게임 등 |

</br>


## Socket 통신 vs HTTP 통신

### 🟦 HTTP 통신
1. Client 요청이 있을 때만 서버가 응답하는 단방향 통신
2. 보통은 서버 응답 후 바로 연결을 종료
3. JSON, HTML 등 다양한 데이터 전송 가능
4. 실시간 연결이 아닌 필요한 경우에만 Server에 요청하는 상황에 유리
</br>

### 🟦 Socket 통신
1. Client와 Server가 특정 포트를 통해 양방향 통신을 하는 방식
2. 데이터 송수신 후 연결이 끊어지는 것이 아니라 계속해서 연결을 유지 → HTTP에 비해 더 많은 리소스 소모
3. Client와 Server가 실시간으로 계속하여 데이터를 주고받아야하는 경우에 유리
4. 실시간 동영상 스트리밍이나 온라인 게임 등에 사용


</br></br>
