## 一．Oracle建立database
1. asm disks create选1M size
2. db process 设置为1500
## 二．Oracle建表
1. datafile设置
```
sql>select file_name from dba_data_files
sql>alter database datafile '查看的file路径' resize 4g;
```
2. Tempfile设置
```
sql>select file_name from dba_temp_files
sql>alter database tempfile '查看file的路径' resize 30g;
```
3. 再加上5个30g的temp表。
    + 进入Sql 目录
    + 存在多种createtemp的文件：createtemp.sql/createtemp2.sql/createtemp3.sql，
    + 查看文件中地址设置，使用对应文件

4. 修改redo log的大小
     + 存在多种log文件：Addredolog.sql，Addredolog_toDATA2.sql等
     + 查看文件中地址设置，使用对应文件

5. 创建32个30g的soe表
     + 存在多种Createsoe.sql文件等，
     + 查看文件中地址设置，使用对应文件。

6. 最后使用@checksize.sql查看大小
   
7. 查看log大小是否为1g与位置是否正确 
```
sql>select * from v$log;
sql>select * from v$logfile;
```
8. 成功后，用oewizard灌入275gb数据

## 三．Oracle 测试操作
1. 打开swingbench
```
~$ cd swingbench/bin
~$ swingbench
```
2. 设置swingbench
     + 开启awr：用户名：system 密码：Aa_12345678
     + 设置用户为300
     + 最小最大间隔为1
     + Run time 为 1h
     + Stop recording 为1h

3. 自动截屏运行
```
~$ python auto_screenshot.py
```
4. swingbench结束

       剪切home/oracle目录下的7张图片到新建的文件夹中

5. 建立awr文件

```
~$ ./creat_awr.sh
```
   关于设置:
   + 默认设置为html
   + 日期设置为1表示当天的记录
   + 找到对应的1h记录的开始和结束的序列号, 保存文件名
   + 文件将保存在 $ORACLE_HOME/rdbms/目录下，需要cp到你新建的文件夹中。

6. 显示db_writer数
```
~$ show_parameter_writer.sh
```
   截屏，保存到对应文件夹中

## 四．Archive log

1. 备份spfile

```
sql>create pfile from spfile
 //或者
sql>create pfile='/home/oracle/new.ora' from spfile;
```

在 /u01/app/oracle/product/12.1.0/db_1/dbs目录下有initorcl.ora出现
 
如果pfile没办法启动，则查看pfile文件，注释掉修改过参数的语句
之后启动

```
sql>startup pfile='/home/oracle/new.ora';
```
 
2. 查看参数：show parameter log_archive_dest
 
 https://community.oracle.com/thread/2300809 
 
3. 建立archive log 
 
https://balaoracledba.com/2013/12/05/rac-enable-archive-log-configure-to-asm-location/
 
路径为+LOG/ORCL/ARCHIVELOG
 
4. 关闭archivelog
 
http://www.cnblogs.com/xwdreamer/p/3793792.html
 
注意:Oracle 要在运行时才能删除database