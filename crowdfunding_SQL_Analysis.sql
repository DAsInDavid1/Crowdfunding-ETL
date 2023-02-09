-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
Select cf_id, backer_count from campaign
Where outcome = 'live'
order by backer_count desc;



-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
select backers.cf_id, count(backer_id) from backers
inner join campaign as c
on (c.cf_id = backers.cf_id)
Where c.outcome = 'live'
group by backers.cf_id
order by count(backer_id) desc;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
select first_name, last_name, email, (cam.goal - cam.pledged) as Remaining_Goal_Amount
INTO email_contacts_remaining_goal_amount
from campaign as cam
inner join contacts as con
on (con.contact_id = cam.contact_id)
where cam.outcome = 'live'
order by (cam.goal - cam.pledged) desc;


-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
select b.email, b.first_name, b.last_name, b.cf_id, c.company_name, c.description, c.end_date, (c.goal - c.pledged) as Left_of_Goal
INTO email_backers_remaining_goal_amount
from backers as b
inner join campaign as c
on (b.cf_id = c.cf_id)
where c.outcome = 'live'
order by b.last_name;

-- Check the table
SELECT * FROM email_backers_remaining_goal_amount

