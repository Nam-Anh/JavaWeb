select id, name, description, schedule
from 
(select ROW_NUMBER() over (order by schedule asc) as row_num, id, name, description, schedule
from Services)as x
where x.row_num between 2 and 5