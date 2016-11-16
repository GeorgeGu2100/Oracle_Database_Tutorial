/*
https://www.techonthenet.com/oracle/schemas/create_schema.php 
The following code will create a user smithj
with password as pwd4smithj
using table space tbs_perm_01
*/

CREATE USER smithj
  IDENTIFIED BY pwd4smithj
  DEFAULT TABLESPACE tbs_perm_01
  TEMPORARY TABLESPACE tbs_temp_01
  QUOTA 20M on tbs_perm_01;
  
 