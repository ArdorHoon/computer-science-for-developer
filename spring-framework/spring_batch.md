# Spring Batch 

<mark>**Spring에서 배치 작업을 보다 쉽게 구현하고 관리할 수 있도록 도와주는 Framework**</mark>

> 배치(Batch) : 일정 시간마다 또는 특정 조건에 따라 대규모 데이터를 일괄 처리하는 방식

Spring Batch는 대량의 데이터를 효율적으로 처리하기 위한 프레임워크로 아래와 같은 기능을 제공한다. 

* 배치 프로세스를 주기적으로 commit
* 동시 다발적인 job의 배치 처리, 대용량 병렬 처리 
* 실패 후 수동 또는 스케줄링에 의한 재시작 (오류 대처 옵션 제공)
* 반복, 재시도, Skip 처리 (실패한 배치 작업 중단 지점 재시작 또는 skip)
* 모니터링 (진행 상태와 소요 시간 확인)
* 트랜잭션 관리 (데이터 일관성 유지)

이와 달리 흔히 혼동할 수 있는 $\it{ {\color{#DD6565} Spring,\ Scheduler는,\ 특정,\ 시간에,\ 작업을,\ 실행하기,\ 위한,\ 도구}}$이다. 


</br>



## 1️⃣ Spring Batch 용어

### 🏷️ Job

<mark>**Job은 배치처리 과정을 하나의 단위로 만들어 놓은 객체**</mark>, 또한 배치처리 과정에 있어 전체 계층 최상단에 위치</br>

</br>

### 🏷️ JobInstance

<mark>**Job의 실제 실행 인스턴스를 의미**</mark>

</br>

### 🏷️ JobParameters
<mark>**JobParameters는 JobInstance를 생성하고 구별하는 데 사용되는 파라미터**</mark>

스프링 배치는 String, Double, Long, Date 이렇게 4가지 타입의 파라미터를 지원

</br>

### 🏷️ JobExecution

<mark>**JobInstance의 실행에 대한 정보를 저장**</mark>

JobExecution은 실행 상태, 시작시간, 종료시간, 생성시간 등 JobInstance의 실행에 대한 세부 정보를 담고 있다.

</br>


### 🏷️ Step

Step은 <mark>**Job의 하위 단계로서 실제 배치 처리 작업의 최소 단위**</mark> 

Step은 Tasklet 혹은 Chunk 방식으로 구성

* Tasklet : 하나의 트랜잭션에서 수행되는 단순한 작업
* Chunk :  트랜잭션 범위 내에서 Chunk 단위로 데이터를 읽어 처리하는 방식

</br>


### 🏷️ StepExecution
<mark>**Step의 한 번의 실행을 나타내며, Step의 실행 상태, 실행 시간 등의 정보를 포함**</mark> 

* 각 Step의 실행 시도마다 새로운 StepExecution이 생성
* 읽은 아이템의 수, 쓴 아이템의 수, 커밋 횟수, 스킵한 아이템의 수 등의 Step 실행에 대한 상세 정보도 포함

</br>

### 🏷️ ExecutionContext
<mark>**Step 간 또는 Job 실행 도중 데이터를 공유하는 데 사용되는 저장소**</mark> 

* JobExecutionContext와 StepExecutionContext 두 종류가 있으며, 범위와 저장 시점에 따라 적절하게 사용
* Job이나 Step이 실패했을 경우, ExecutionContext를 통해 마지막 실행 상태를 재구성하여 재시도 또는 복구 작업을 수행
 
</br>

### 🏷️ JobRepository
<mark>**배치 작업에 관련된 모든 정보를 저장하고 관리하는 메커니즘**</mark> 

* Job 실행정보(JobExecution), Step 실행정보(StepExecution), Job 파라미터(JobParameters)등을 저장하고 관리
* Job이 실행될 때, JobRepository는 새로운 JobExecution과 StepExecution을 생성하고, 이를 통해 실행 상태를 추적

</br>

### 🏷️ JobLauncher
<mark>**Job과 JobParameters를 받아 Job을 실행하는 역할**</mark> 

전반적인 Job의 생명 주기를 관리하며, JobRepository를 통해 실행 상태를 유지

</br>

### 🏷️ ItemReader
<mark>**배치 작업에서 처리할 아이템을 읽어오는 역할**</mark> 

</br>

### 🏷️ ItemProcessor
<mark>**ItemReader로부터 읽어온 아이템을 처리하는 역할**</mark> 

</br>

 ### 🏷️ ItemWriter
<mark>**ItemProcessor에서 처리된 데이터를 최종적으로 기록하는 역할**</mark> 

</br>


## 2️⃣ Spring Batch 사용 사례

*  다량의 주문 데이터를 처리하는 일괄 처리 작업을 자동화
*  데이터 처리 작업을 분산 처리할 수 있어서 데이터 처리 시간을 대폭 감소
*  구독 서비스 (정해진 시간에 구독자들에게 메일을 일괄 전송하는 경우, 배치 처리 활용)
*  데이터 백업 (대규모 DB 운영 시, 데이터 일관성 보장 위해 주기적인 데이터 백업 필수적, 이때 배치를 활용)


</br>

## 3️⃣ Spring Batch 사용하기

Spring에서 제공하는 [배치 튜토리얼](https://spring.io/guides/gs/batch-processing)을 표본으로 batch를 어떻게 사용하는지 알아보자!


### 🏷️ 사전 준비
우선 프로젝트 resource 폴더 아래에 schema-all.sql, sample-data.csv 파일을 준비해둔다. Spring 튜토리얼에서는 HyperSQL Database를 사용했지만 나는 H2 DB를 사용했다. 

프로젝트 파일 구성은 아래와 같다. ([프로젝트](https://github.com/ArdorHoon/computer-science-for-developer/tree/main/source-code/spring-batch-test)는 링크를 클릭)

* <code>Person.java</code> : Entity
* <code>BatchConfiguration.java</code> :  배치 작업 Configuration 클래스 (**핵심**)
* <code>PersonItemProcessor.java</code> : ItemReader로부터 읽어온 아이템을 처리하는 역할
* <code>JobCompletionNotificationListener.java</code> :  배치 작업이 완료될 때 알림을 받기 위한 리스너


main() 메서드는 배치 파일 특성 상, 한 사이클돌리고 종료하기 때문에 System.exit()로 구현했지만 여기서 DB에 정상적으로 데이터가 들어갔는지 확인을 위해서 일반적인 실행으로 테스트하였다. 

```java
@SpringBootApplication
public class SpringBatchTestApplication {

    public static void main(String[] args) {
        //한 번 실행 후 종료 
        //System.exit(SpringApplication.exit(SpringApplication.run(SpringBatchTestApplication.class, args)));

        SpringApplication.run(SpringBatchTestApplication.class, args);
    }

}
```

</br>

### 🏷️ 소스 코드


#### 🔵 PersonItemProcessor
배치 작업에서 처리할 아이템을 가공하는 역할, ItemProcessor를 implements 받아서 구현했다.

Person 객체를 받아서, (upper-cased)Person으로 가공해준다.

```java
@Slf4j
public class PersonItemProcessor implements ItemProcessor<Person, Person> {


    @Override
    public Person process(Person person) throws Exception {

        final Long id = person.getId();
        final String firstName = person.getFirstName().toUpperCase();
        final String lastName = person.getLastName().toUpperCase();

        final Person transformedPerson = new Person(id, firstName, lastName);

        log.info("Converting (" + person + ") into (" + transformedPerson + ")");

        return transformedPerson;
    }
}


```
</br>



#### 🔵 BatchConfiguration
실제 배치 작업을 만들기 위한 Configuration 클래스

여기서 Spring 컨테이너에 reader, processeor, writer 빈을 등록해준다. 

```java

@Configuration
public class BatchConfiguration {

    //Reader : csv파일을 읽어 드림
    @Bean
    public FlatFileItemReader<Person> reader() {
        return new FlatFileItemReaderBuilder<Person>()
                .name("personItemReader")
                .resource(new ClassPathResource("sample-data.csv"))
                .delimited()
                .names("id","firstName", "lastName")
                .targetType(Person.class)
                .build();
    }

    //processeor : 아이템 가공하는 역할
    @Bean
    public PersonItemProcessor processor() {
        return new PersonItemProcessor();
    }


    // writer : Spring Boot에서 만든 datasource의 사본을 자동으로 가져옴 (단일 Person 객체를 DB에 쓰기 위한 SQL문도 포함)
    @Bean
    public JdbcBatchItemWriter<Person> writer(DataSource dataSource) {
        return new JdbcBatchItemWriterBuilder<Person>()
                .sql("INSERT INTO people (person_id, first_name, last_name) VALUES (:id, :firstName, :lastName)")
                .dataSource(dataSource)
                .beanMapped()
                .build();
    }

    // tag::jobstep[]
    // job을 정의 (step으로 부터 build) 
    @Bean
    public Job importUserJob(JobRepository jobRepository, Step step1, JobCompletionNotificationListener listener) {
        return new JobBuilder("importUserJob", jobRepository)
                .listener(listener)
                .start(step1)
                .build();
    }

   //step을 정의 (각 스텝은 a reader, a processor, and a writer 포함한다..)
   //여기서는 최대 3개의 레코드를 한 번에 쓴다. (<Person, Person> chunk(3, transactionManager))
    @Bean
    public Step step1(JobRepository jobRepository, DataSourceTransactionManager transactionManager,
                      FlatFileItemReader<Person> reader, PersonItemProcessor processor, JdbcBatchItemWriter<Person> writer) {
        return new StepBuilder("step1", jobRepository)
                .<Person, Person> chunk(3, transactionManager)
                .reader(reader)
                .processor(processor)
                .writer(writer)
                .build();
    }
    // end::jobstep[]

    @Bean
    public PlatformTransactionManager transactionManager(DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }
}


```


</br>

#### 🔵 JobCompletionNotificationListener

배치 작업이 완료될 때 알림을 받기 위한 리스너이다.

배치 작업이 끝나고 결과를 보기 위한 JdbcTemplate도 사용

```java

@Slf4j
@Component
public class JobCompletionNotificationListener implements JobExecutionListener {

    private final JdbcTemplate jdbcTemplate;

    public JobCompletionNotificationListener(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void afterJob(JobExecution jobExecution) {
        if(jobExecution.getStatus() == BatchStatus.COMPLETED) {
            log.info("!!! JOB FINISHED! Time to verify the results");

            jdbcTemplate
                    .query("SELECT first_name, last_name FROM people", new DataClassRowMapper<>(Person.class))
                    .forEach(person -> log.info("Found <{{}}> in the database.", person));
        }
    }
}



```

</br>

### 🏷️ 결과

해당 Application을 다시 실행하고 H2-console을 통해 People 테이블을 확인하면 데이터가 들어간 것을 확인할 수 있다.

<p align="center">
<img src="https://github.com/user-attachments/assets/952e2974-d995-4e28-b219-76f95bdd93cb" width="60%" height="60%"></br>
</p></br>

</br>

**실행 시 Console 로그**
``` gradle
2024-12-24T14:20:35.214+09:00  INFO 12856 --- [           main] c.e.s.SpringBatchTestApplication         : Started SpringBatchTestApplication in 6.177 seconds (process running for 6.959)
2024-12-24T14:20:35.220+09:00  INFO 12856 --- [           main] o.s.b.a.b.JobLauncherApplicationRunner   : Running default command line with: []
2024-12-24T14:20:35.303+09:00  INFO 12856 --- [           main] o.s.b.c.l.s.TaskExecutorJobLauncher      : Job: [SimpleJob: [name=importUserJob]] launched with the following parameters: [{}]
2024-12-24T14:20:35.341+09:00  INFO 12856 --- [           main] o.s.batch.core.job.SimpleStepHandler     : Executing step: [step1]
2024-12-24T14:20:35.390+09:00  INFO 12856 --- [           main] c.e.springbatchtest.PersonItemProcessor  : Converting (com.example.springbatchtest.Person@307e9c02) into (com.example.springbatchtest.Person@682270ff)
2024-12-24T14:20:35.391+09:00  INFO 12856 --- [           main] c.e.springbatchtest.PersonItemProcessor  : Converting (com.example.springbatchtest.Person@6bc08a77) into (com.example.springbatchtest.Person@37922937)
2024-12-24T14:20:35.392+09:00  INFO 12856 --- [           main] c.e.springbatchtest.PersonItemProcessor  : Converting (com.example.springbatchtest.Person@73483d4b) into (com.example.springbatchtest.Person@8961e55)
2024-12-24T14:20:35.404+09:00  INFO 12856 --- [           main] c.e.springbatchtest.PersonItemProcessor  : Converting (com.example.springbatchtest.Person@62b0792) into (com.example.springbatchtest.Person@2fd409c1)
2024-12-24T14:20:35.404+09:00  INFO 12856 --- [           main] c.e.springbatchtest.PersonItemProcessor  : Converting (com.example.springbatchtest.Person@121c1a08) into (com.example.springbatchtest.Person@3013e1e8)
2024-12-24T14:20:35.404+09:00  INFO 12856 --- [           main] c.e.springbatchtest.PersonItemProcessor  : Converting (com.example.springbatchtest.Person@6e5a77ef) into (com.example.springbatchtest.Person@61cff1e4)
2024-12-24T14:20:35.412+09:00  INFO 12856 --- [           main] o.s.batch.core.step.AbstractStep         : Step: [step1] executed in 70ms
2024-12-24T14:20:35.417+09:00  INFO 12856 --- [           main] c.e.s.JobCompletionNotificationListener  : !!! JOB FINISHED! Time to verify the results
2024-12-24T14:20:35.424+09:00  INFO 12856 --- [           main] c.e.s.JobCompletionNotificationListener  : Found <{com.example.springbatchtest.Person@5058fefb}> in the database.
2024-12-24T14:20:35.424+09:00  INFO 12856 --- [           main] c.e.s.JobCompletionNotificationListener  : Found <{com.example.springbatchtest.Person@198a0416}> in the database.
2024-12-24T14:20:35.424+09:00  INFO 12856 --- [           main] c.e.s.JobCompletionNotificationListener  : Found <{com.example.springbatchtest.Person@1f207142}> in the database.
2024-12-24T14:20:35.424+09:00  INFO 12856 --- [           main] c.e.s.JobCompletionNotificationListener  : Found <{com.example.springbatchtest.Person@65871cfd}> in the database.
2024-12-24T14:20:35.424+09:00  INFO 12856 --- [           main] c.e.s.JobCompletionNotificationListener  : Found <{com.example.springbatchtest.Person@723f8990}> in the database.
2024-12-24T14:20:35.424+09:00  INFO 12856 --- [           main] c.e.s.JobCompletionNotificationListener  : Found <{com.example.springbatchtest.Person@3bdc8975}> in the database.
2024-12-24T14:20:35.427+09:00  INFO 12856 --- [           main] o.s.b.c.l.s.TaskExecutorJobLauncher      : Job: [SimpleJob: [name=importUserJob]] completed with the following parameters: [{}] and the following status: [COMPLETED] in 99ms
2024-12-24T14:32:37.752+09:00  INFO 12856 --- [ionShutdownHook] o.s.b.w.e.tomcat.GracefulShutdown        : Commencing graceful shutdown. Waiting for active requests to complete
2024-12-24T14:32:38.057+09:00  INFO 12856 --- [tomcat-shutdown] o.s.b.w.e.tomcat.GracefulShutdown        : Graceful shutdown complete

```
</br>

그리고 csv 파일에 **6,Kate,Hoon** 추가 후 다시 실행하면

```csv
1,Jill,Doe
2,Joe,Doe
3,Justin,Doe
4,Jane,Doe
5,John,Doe
6,Kate,Hoon
```
</br>

<p align="center">
<img src="https://github.com/user-attachments/assets/70590332-c52a-421d-8f9c-041e178f0c5c" width="60%" height="60%"></br>
</p></br>



