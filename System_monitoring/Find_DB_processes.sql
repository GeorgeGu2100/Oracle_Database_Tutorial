/*
The following code will find DB processes
*/

SELECT s.inst_id,
       s.sid,
       s.serial#,
       p.spid,
       s.username,
       s.program,
       s.SQL_EXEC_START,
       SYSDATE,
       (SYSDATE-s.SQL_EXEC_START)*24*60 as ELAPSED_MINUTES        
FROM   gv$session s
       JOIN gv$process p ON p.addr = s.paddr AND p.inst_id = s.inst_id
WHERE  s.type != 'BACKGROUND'
order by SQL_EXEC_START 
;
 