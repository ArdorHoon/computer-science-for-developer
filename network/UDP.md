# UDP

<mark>**User Datagram Protocol의 약자로 데이터를 데이터그램 단위로 처리하는 프로토콜**</mark>

<p align="center">
<img src="https://github.com/user-attachments/assets/cc049571-f762-4dfd-953a-cb3818e0a550" width="70%" height="70%"></br>
</p></br>



## UDP 특징
- 비연결형 서비스 (데이터 처리 속도 빠름)
- 신뢰성 없는 전송 프로토콜 
- 전송 순서가 바뀔 수 있음 (패킷 순서를 고려하지 않고 흐름/혼잡 제어 작업을 처리하지 않음)
- 수신 여부를 확인하지 않음
- 통신 방식 : 1:1 통신 뿐만 아니라 1:N, N:N의 통신에서도 쉽게 사용
- 데이터그램(메세지) 단위로 전송(그 크기는 65,535bytes로 이를 초과 시, 잘라서 보냄)

</br>위와 같은 특징 때문에 파일 전송과 같은 신뢰성이 필요한 서비스보다 성능이 중요시 되는 경우에 사용이 많이된다. (예 : 실시간 방송, 온라인 게임)</br></br>



## UDP 구현

### UDP Client
```java
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

public class UdpClient {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in, StandardCharsets.UTF_8);
        System.out.println("Send Message : ");
        String msg = scanner.nextLine();

        try {

            // 전송할 UDP 소캣 생성
            DatagramSocket socket = new DatagramSocket();

            // 서버의 주소 생성
            InetAddress ia = InetAddress.getByName("127.0.0.1");

            // 전송할 데이터 생성
            DatagramPacket dp = new DatagramPacket(msg.getBytes(), msg.getBytes().length, ia, 7777);

            socket.send(dp);
            socket.close();

        } catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
}
```


### UDP Server
```java
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.nio.charset.StandardCharsets;

public class UdpServer {
    public static void main(String[] args) {

        try {

            //Client가 연결할 수 있게 UDP 소캣 생성 
            DatagramSocket socket = new DatagramSocket(7777);

            //패킷 최대 크기 66536byte
            byte[] data = new byte[66536];

            // UDP 통신으로 전송 받은 Packet 객체 생성
            DatagramPacket dp = new DatagramPacket(data, data.length);

            System.out.println("Ready to receive message...");

            while (true) {
                socket.receive(dp);

                //송신 IP
                System.out.println("Receive IP : " + dp.getAddress());

                // 수신한 데이터의 길이를 사용하여 메시지 생성 && Character SET 동일하게 설정
                String msg = new String(dp.getData(), 0, dp.getLength(), StandardCharsets.UTF_8);
                System.out.println("message : " + msg);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }
}


```

### 테스트 결과

<p align="center">
<img src="https://github.com/user-attachments/assets/c644cd74-811a-44de-ba0f-5f4b390af963" width="50%" height="50%"></br>
</p></br>



