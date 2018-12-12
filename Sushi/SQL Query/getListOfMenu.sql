select id, name, description, price, day_created
from 
(select ROW_NUMBER() over (order by day_created asc) as 
row_num, id, name, description, price, day_created
from menu) as x
where x.row_num between 2 and 5