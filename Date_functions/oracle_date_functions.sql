/*
The following code: date functions in Oracle
*/

SELECT SYSDATE,
       CAST(SYSDATE as timestamp) as today,  -- (DD HH:MM:SS)
       CAST(SYSDATE-10 as timestamp) as  day_ago 
     ,   extract( day from CAST(SYSDATE as timestamp)) as today2      
FROM   DUAL
;
