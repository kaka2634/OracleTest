declare
j int:=1;
i int:=&1;
k int:=&2;
m int:=0;
begin
loop
m:=i*k+j;
insert into ccic values(to_char(sysdate,'hh24:mi:ss'),m);
exit when j=k;
j:=j+1;
end loop;
commit;
end;
/
quit
EOF
