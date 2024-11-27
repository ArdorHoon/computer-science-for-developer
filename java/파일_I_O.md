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
</br>

## FileInputStream
<mark>**파일의 데이터를 읽어들일 때 사용**</mark>

```java
public class Main {
    public static void main(String[] args){

        try{
            FileInputStream file = new FileInputStream("C:/test/test.txt");

            int data;

            while((data = file.read()) != -1){
                System.out.print((char) data);

            }
        }catch (IOException ex){
            

        }
    }

}

```
바이트 기반인 Stream으로 읽어들이기 때문에 2byte인 한글을 깨진다. 그렇기 때문에 Character 기반 스트림인 Reader나 Writer를 사용해야 한다. 


</br>

## FileOutputStream


</br>


## FileReader


## FileWirter


