create undo tablespace undotbs2 datafile '/data/oracle8/undo02.dbf' size 300m reuse;
alter system set undo_tablespace=undotbs2 scope=both;
alter tablespace undo offline;
drop tablespace undotbs including contents and datafiles cascade constraints;
