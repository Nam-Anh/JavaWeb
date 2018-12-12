select id, name, description, day_created, photo, short_description
from (select ROW_NUMBER() over (order by day_created asc) as
		row_num, id, name, description, day_created, photo, short_description 
	  from sushiMeal) as x
where x.row_num between 1 and 5
