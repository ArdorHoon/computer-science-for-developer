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

## 1️⃣ Byte 기반 Stream

Byte 기반 입출력에 대한 파일 I/O 클래스들이다.

</br>

### 🟥 FileInputStream
<mark>**파일의 데이터를 읽어들일 때 사용 - Byte기반 스트림**</mark>

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

### 🟥 FileOutputStream
<mark>**파일의 데이터를 쓸때 사용 - Byte기반 스트림**</mark></br>


test.txt 내용을 test_out.txt 파일을 만들고 쓰는 코드 예제이다. 
```java
public class Main {
    public static void main(String[] args){

        try{
            FileInputStream file = new FileInputStream("C:/test/test.txt");
            FileOutputStream fo = new FileOutputStream("C:/test/test_out.txt");

            int data;

            while((data = file.read()) != -1){
                fo.write(data);
            }
        }catch (IOException ex){


        }
    }

}

```
</br>

기본적으로 한 바이트씩 입출력을 하기 때문에 기본적으로 시간이 오래걸린다. 그래서 이 속도를 빠르게 하기 위해 버퍼를 사용하는데 <code>**BufferedInputStream**</code>과 <code>**BufferedOutputStream**</code>이 대표적인 예시이다. 


### 🟥 BufferedInputStream & BufferedOutputStream

위의 FileInputStream와 FileOutputStream와 시간을 비교하여 속도가 얼마나 빠른지 한 번 확인해보자!

```java

public class Main {
    public static void main(String[] args){

        try{
            long start = System.currentTimeMillis();
            FileInputStream file = new FileInputStream("C:/test/test.txt");
            BufferedInputStream bin = new BufferedInputStream(file);

            FileOutputStream fo = new FileOutputStream("C:/test/test_b.txt");
            BufferedOutputStream bout = new BufferedOutputStream(fo);

            int data;

            while((data = file.read()) != -1){
                bout.write(data);
            }

            long end = System.currentTimeMillis();
            System.out.println( "run time : " + ( end - start )/1000.0 + "second");

        }catch (IOException ex){

            ex.printStackTrace();
        }
    }

}

/**
버퍼 안 사용했을 때 => run time : 0.003second
버퍼 사용했을 때 => run time : 0.001second
**/

```



## 2️⃣ Character기반 Stream

### 🟥 FileReader & FileWriter 

Character기반 Stream이기 때문에 한글도 잘 읽고 잘 써진다.

```java
public class Main {
    public static void main(String[] args) {

        try{
            FileReader fin = new FileReader("C:/test/test.txt");
            FileWriter fout = new FileWriter("C:/test/test_outs.txt", false);

            int data;
            while ((data = fin.read()) != -1) {
                System.out.print((char) data);
                fout.write(data);
            }

            fout.close(); //안해주면 파일에 내용이 써지지 않는다.

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}

```

</br>

### 🟥 BufferedReader & BufferedWrite

마찬가지로 Buffer를 쓰면 실행 속도가 확실히 빨라진다.


```java
public class Main {
    public static void main(String[] args) {

        long start = System.currentTimeMillis();

        try{

            BufferedReader bin = new BufferedReader(new FileReader("C:/test/test.txt"));
            BufferedWriter bout = new BufferedWriter(new FileWriter("C:/test/test5.txt"));
            String line = "";

            while ((line = bin.readLine()) != null) {
                bout.write(line);
                bout.newLine();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        long end = System.currentTimeMillis();
        System.out.println("runtime : " + (end - start) / 1000.0 + "second");
    }

}

//result
// Buffer 사용 =>  runtime : 0.001second
// Buffer 미사용 => runtime : 0.003second

```

</br>
