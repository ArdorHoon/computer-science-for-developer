
 # OSI 7 Layer

<mark>OSI 7 Layer은 Open System Interconnection의 참조 모델로 국제 표준화 기구(ISO)에서 제안한 **통신 규약**이다.</mark>

- 총 7개의 계층이 존재하며, 각각 계층에서의 하는 일이 명확히 구분되어 있다.
- 7번 부터 하위로 Encapsulation (반대는 Decapsulation)

</br>
<p align="center">
<img src="https://github.com/user-attachments/assets/dda8fc0c-608c-4f8b-a14d-f8bde2c92145" width="40%" height="40%"></p>
<p align="center">출처 : wikimedia</p>



</br>

## 1) Physical Layer(물리 계층)
<mark>**데이터를 물리 매체상으로 전송하는 역할을 담당하는 계층**으로 전송을 위해 필요한 물리적 링크의 설정, 유지 해제를 담당</mark>
- 데이터 전송 단위 : <code>**비트(Bit)**</code>
- 프로토콜 : RS-232, RS-449 케이블 등
- 관련 장비 : 리피터, 허브

</br>

## 2) Data-Link Layer(데이터 링크 레이어)
<mark>시스템간의 연결 설정으로 두 장치간의 속도 차이를 위한 흐름 제어, 오류 제어를 담당</mark>
- 네트워크 계층에서 정보를 받아 주소와 제어 정보를 헤더와 테일에 추가한다.
- 데이터 전송 단위 : <code>**프레임(Frame)**</code>
- 프로토콜 : Ethernet, PPP, HDLC 등
- 사용 주소 : Mac
- 관련 장비 : 랜카드, 브릿지, 스위치

</br>

## 3) Network Layer(네트워크 레이어)
<mark>네트워크 연결을 관리하는 기능과 데이터 교환 및 중계를 담당</mark>
- 송신측에서 수신측까지 데이터를 안전하게 전달하기 위해서 논리적 링크(네트워크)를 설정하고 상위 계층 데이터를 작은 패킷으로 분할하여 전송한다.
- 데이터 전송 단위 : <code>**패킷(Packet)**</code>
- 프로토콜 : IP, ARP, RIP, ICMP
- 관련 장비 : 라우터

</br>

### 4) Transport Layer(전송 계층)
<mark>OSI 7 계층 구조는 **전송 계층**을 기점으로 하위계층으로 이루어진 네트워크 서비스와 상위 계층으로 이루어진 사용자 서비스로 구별</mark>
- 전체 메시지를 발신지 대 목적지(End-to-End)간 제어와 에러를 관리한다.
- End-To-End 전송: 송신 컴퓨터의 응용프로그램(프로세스)에서 최종 수신 컴퓨터틔 응용프로그램(프로세스)으로의 전달을 의미.
- 데이터 전송 단위 : <code>**TCP => 세그먼트(Segment), UDP => Datagram**</code>
- 프로토콜 : TCP, UDP
- 관련 장비 : 게이트웨이

</br>

## 5) Session Layer(세션 계층)
<mark>네트워크 대화 제어기로 통신 시스템 간에 상호 대화를 설정, 유지 및 동기화</mark>
- 실제 이용자의 응용프로그램 사이에서 세션이라 불리는 연결을 확립하고 유지하며 동기화 하는 기능을 수행한다.
- 데이터 전송 단위 : <code>**메시지(Message)**</code>
- 프로토콜 : SSH

</br>

## 6) Presentation Layer(표현 계층)

<mark>송/수신자가 공통으로 이해할 수 있도록 정보의 데이터 표현 방식을 바꾸는 기능을 담당</mark>
 - 세션 계층 ↔ 표현 계층 ↔ 응용 계층 (계층에 맞게 데이터 변환)
- 데이터 전송 단위 :  <code>**메시지(Message)**</code>
- 프로토콜 : JPG, MPEG, AFP, PAP

</br>

## 7) Application Layer(응용 계층)
<mark> 최상위 계층으로 사용자가 네트워크에 접속하는 것을 가능</mark>
- 원격파일 접속과 전송 등 사용자 인터페이스를 제공한다.
- 데이터 전송 단위 : <code>**메시지(Message)**</code>
- 프로토콜 : HTTP, FTP, SMTP

</br>

## 참고 자료
- [TCP/IP와 OSI 7 Layer 차이점](https://github.com/ArdorHoon/computer-science-for-developer/blob/main/network/TCP_IP_VS_OSI_7_Layer.md)
