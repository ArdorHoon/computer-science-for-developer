# Executor 프레임워크

<mark>**JDK에서 제공하는 framework, Java Application에서 thread를 만들고 관리하는 작업을 좀 더 고수준의 API에게 일을 위임할 수 있게 해준다**</mark>

</br>

Executor가 하는 일은 크게 3가지
1. Thread 생성 : thread 생성하거나 thread pool을 만드는 method 제공
2. Thread 관리 : thread의 생명주기 관리
3. Task 제출 및 실행 : Runnable 혹은 Callable method를 제출하고 그것을 원하는 때에 실행할 수 있음

</br>

## Executor Service 구조

<p align="center">
<img src="https://github.com/user-attachments/assets/59fb37a4-9d1a-4316-934b-91da2a1eaf26" width="70%" height="70%"></br>
</p></br>


Executor Service는 Thread Pool과 Blocking Queue로 구성되어 있다. submit된 task들은 Blocking Queue에 들어가게 되고 위에서 언급한 메커니즘에 의해 유후 thread에 할당된다. (thread-pool이 full이면 대기)

</br>

thread를 생성하는 것은 비용이 큰 작업이므로 이 작업을 최소화 하기 위해 Executor service에서는 미리 thread pool안에 thread를 생성해 놓고 관리한다.

</br>

## 주요 인터페이스

### 1️⃣ ExecutorService 
<mark>**Executor를 상속 받은 인터페이스로, Callable도 실행할 수 있으며, Executor를 종료 시키거나 여러 Callable을 동시에 실행하는 등의 기능을 제공**</mark>

```java
public class Main {
    public static void main(String[] args) {

        ExecutorService executorService = Executors.newSingleThreadExecutor();


        executorService.submit(new Runnable() {
            @Override
            public void run() {
                System.out.println("Thread" + Thread.currentThread().getName());
            }
        });

        //람다식으로 표현 
        executorService.submit(() -> System.out.println("Thread" + Thread.currentThread().getName()));

        //작업 처리 후 종료
        executorService.shutdown();

    }
}

```

ExecutorService는 어떤 작업을 실행하고 나면 다음 작업이 들어올 때까지 계속 대기를 하기 때문에, 프로세스가 죽지 않으므로 명시적으로 <code>**shutdown**</code>을 해주어야 한다. 작업을 처리 도중 즉시 종료하고 싶으면 <code>**shutdownNow**</code> 를 사용하면 된다. 

</br>

다음은 ExecutorService를 통해 Thread Pool을 생성하고 핸들링하는 코드이다. (3개의 thread-pool을 만들고 실행한 결과)

```java
public class Main {
    public static void main(String[] args) {

        //make 10 thread
        ExecutorService executorService = Executors.newFixedThreadPool(3);

        executorService.submit(getRunnable("Task1"));
        executorService.submit(getRunnable("Task2"));
        executorService.submit(getRunnable("Task3"));
        executorService.submit(getRunnable("Task4"));

        executorService.shutdown();

    }


    private static Runnable getRunnable(String message){
        return () -> {
            System.out.println(message + " " + Thread.currentThread().getName());
        };
    }
}

```

위 코드의 결과는 아래와 같다.

```java
> Task :Main.main()
Task3 pool-1-thread-3
Task4 pool-1-thread-3
Task2 pool-1-thread-2
Task1 pool-1-thread-1
```


</br>

### 2️⃣ ScheduledExecutorService
<mark>**ExecutorService를 상속 받은 인터페이스로 특정 시간 이후에 또는 주기적으로 작업을 실행**</mark>
```java
public class Main {
    public static void main(String[] args) {

        ScheduledExecutorService executorService = Executors.newSingleThreadScheduledExecutor();

        //3초 정도 있다가 schedule() 실행
        executorService.schedule(getRunnable("Task1"), 3, TimeUnit.SECONDS);

        executorService.shutdown();

    }


    private static Runnable getRunnable(String message){
        return () -> {
            System.out.println(message + " " + Thread.currentThread().getName());
        };
    }
}


```

</br>
