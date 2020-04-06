echo on
c:\kafka_2.12-2.2.0\bin\windows\zookeeper-server-start.bat c:\kafka_2.12-2.2.0\config\zookeeper.properties 
sleep 10 
@rem c:\kafka_2.12-2.2.0\bin\windows\kafka-server-start.bat c:\kafka_2.12-2.2.0\config\server.properties 
pause