# 파일 I/O

## File
<mark>**java.io에서 제공하는 File 클래스는 파일 크기, 파일 속성, 파일 이름 등 정보를 얻어낸느 기능과 파일 생성 및 삭제 기능을 제공**</mark>

해당 path에 파일이 존재하지 않으면 파일 생성 

```java

public class Main {
    public static void main(String[] args) throws Exception {

        File file = new File("C:/test/test.txt");

        //파일 존재 여부 확인
        boolean isExist = file.exists();

    }
}

```




## FileInputStream


## FileOutputStream


## FileReader


## FileWirter


