select id, prayerTitle, prayerDes, prayerPhoto 
from 
(select ROW_NUMBER() over (order by id asc) as row_num, id, prayerTitle, prayerDes, prayerPhoto 
from Prayers) as x
where x.row_num between 2 and 5
