alter system set log_archive_dest_1='location=+LOG/ORCL/ARCHIVELOG' scope=both;
alter system set log_archive_format='soe_%t_%s_%r.arc' scope=spfile;
alter database archivelog;
alter database open;
archive log list;
