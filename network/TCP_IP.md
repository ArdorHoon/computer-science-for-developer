# TCP/IP suite

<mark>**네트워크에서 사용되는 통신 프로토콜의 집합, Layer들은 프로토콜의 네트워킹 범위에 따라 4개의 추상화 Layer로 구성**</mark>

![tcpipstack-vs-osimodel](https://github.com/user-attachments/assets/ad2d6f8a-58fa-42d7-aafd-a9b5b1523d37)



</br>

## 1) Network Access Layer
- OSI 7 계층에서 Data-Link Layer 와 Physical Layer에 해당
- OS의 네트워크 카드와 디바이스 드라이버 등 <ins>하드웨어적인 요소와 관련되는 모든 것을 지원</ins>
- 주요 프로토콜 : Ethernet, IEEE 802

</br>


## 2) Internet Layer
- OSI 7 계층에서 Network Layer에 해당
- 상위 전송 계층으로부터 받은 데이터에 IP패킷 헤더를 붙여 패킷을 만들고 이를 전송
- 주요 프로토콜 : IP, ICMP

</br>



## 3) Transport Layer
- OSI 7 계층에서 Transport Layer에 해당
- 네트워크 양단의 송수신 호스트 사이에서 신뢰성 있는 전송 기능을 제공
- **정확한 패킷의 전송을 보장하는 TCP**와 **정확하진 않지만 빠른 속도의 전송을 지원하는 UDP** 프로토콜을을 이용

</br>



## 4) Application Layer
- OSI 7계층에서 Session Layer, Presentation Layer, Application Layer에 해당
- 응용 프로그램들 간의 데이터를 송/수신하는 역할을 수행하며, 네트워크 서비스, 메일 서비스 , 웹 서비스 등을 이용할 수 있는 표준적인 인터페이스를 제공
- 주요 프로토콜 : FTP(파일 전송 프로토콜), HTTP, SMTP, DNS, HTTPS


</br>


## 참고 자료
- [TCP/IP와 OSI 7 Layer 차이점](https://github.com/ArdorHoon/computer-science-for-developer/blob/main/network/TCP_IP_VS_OSI_7_Layer.md)

