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
--       SYSDATE,
       ROUND((SYSDATE-s.SQL_EXEC_START)*24*60,2) as ELAPSED_MINUTES,
       CAST(SYSDATE as timestamp),
       CAST(s.SQL_EXEC_START as timestamp),
       CAST(SYSDATE as timestamp) - CAST(s.SQL_EXEC_START as timestamp) as ELAPSED,       -- (DD HH:MM:SS)
       extract( day from CAST(SYSDATE as timestamp) - CAST(s.SQL_EXEC_START as timestamp)) Days   ,
       extract( minute from CAST(SYSDATE as timestamp) - CAST(s.SQL_EXEC_START as timestamp)) Minute,  
       extract( second from CAST(SYSDATE as timestamp) - CAST(s.SQL_EXEC_START as timestamp)) second                       
FROM   gv$session s
       JOIN gv$process p ON p.addr = s.paddr AND p.inst_id = s.inst_id
WHERE  s.type != 'BACKGROUND'
order by SQL_EXEC_START 
;

-- kill a sesssion with sid 262 and serial number 51021
ALTER SYSTEM KILL SESSION '262,51021'; 