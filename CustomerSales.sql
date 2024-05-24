
-- The ratio of male to female customers is about 68:32, using the data the store has on female customers,
-- what strategy do you recommend the store puts in place to attract more female customers.

With total as (
SELECT
	Gender,
	count(`Customer ID`) as client_count

FROM retail_data.shopping_trends_updated
Group by 1
Order by 2 desc
)
Select
	sum(case when Gender = 'Male' then client_count else 0 end) count_male,
	sum(case when Gender = 'Female' then client_count else 0 end) count_Female,
	round(sum(case when Gender = 'Male' then client_count else 0 end)/
     (sum(case when Gender = 'Male' then client_count else 0 end)
     + sum(case when Gender = 'Female' then client_count else 0 end)) *100,2) pct_male,

	round(sum(case when Gender = 'Female' then client_count else 0 end)/
     (sum(case when Gender = 'Male' then client_count else 0 end)
     + sum(case when Gender = 'Female' then client_count else 0 end)) *100,2) pct_female
from total
;