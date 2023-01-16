select * from cleaned_apps;
select * from cleaned_reviews;

-- 1. Which apps have the highest rating in the given available dataset?


select app, rating
from cleaned_apps
where rating = (select max(rating) from cleaned_apps);


-- 2. What are the number of installs and reviews for the above apps? Return the apps with the highest reviews to the top?

select app, rating, Installs, reviews
from cleaned_apps
where rating = (select max(rating) from cleaned_apps)
order by reviews desc;


-- 3. Which app has the highest number of reviews? Also, mention the number of reviews and category of the app?

select app, category, reviews
from cleaned_apps 
where reviews = (select max(reviews) from cleaned_apps)

-- 4. What is the total amount of revenue generated by the google play store by hosting apps? (Whenever a user buys apps  from the google play store, the amount is considered in the revenue)?

select round(SUM(price),2) as 'Revenue' from cleaned_apps;



-- 5. Which Category of google play store apps has the highest number of installs? also, find out the total number of installs for that particular category?


select top 1 category, sum(installs) as 'installs_count'
from cleaned_apps
group by Category
order by sum(Installs) desc; 


-- 6. Which Genre has the most number of published apps?

select top 1 genres, count(app) as 'app_count'
from cleaned_apps
group by genres
order by app_count desc;
  


-- 7. Provide the list of all games ordered in such a way that the game that has the highest number of installs is displayed on the top (to avoid duplicate results use distinct)?

select distinct app, Installs from cleaned_apps
where Category = 'game'
order by installs desc;



-- 8. Provide the list of apps that can work on android version 4.0.3 and UP?

select app  from cleaned_apps
where android_ver = '4.0.3 and up';


-- 9. How many apps from the given data set are free? Also, provide the number of paid apps?

select type, count(*) as 'no. of apps'
from cleaned_apps
group by type;

-- 10. Which is the best dating app? (Best dating app is the one having the highest number of Reviews)

select top 1 app, Reviews from cleaned_apps
where Category = 'dating'
order by reviews desc;


-- 11. Get the number of reviews having positive sentiment and number of reviews having negative sentiment for the app 10 best foods for you and compare them.

select  sentiment, count(*) as 'sentiment count'
from cleaned_reviews
where app = '10 best foods for you'
group by Sentiment
order by [sentiment count] desc;


-- 12.  Which comments of ASUS SuperNote have sentiment polarity and sentiment subjectivity both as 1?

select * from cleaned_reviews
where app = 'ASUS SuperNote' and Sentiment_Polarity = 1 and Sentiment_Subjectivity = 1;



-- 13. Get all the neutral sentiment reviews for the app Abs Training-Burn belly fat

select a.app, r.translated_Review, r.sentiment
 from cleaned_apps a
 join cleaned_reviews r
 on a.app = r.app
where a.app = 'Abs Training-Burn belly fat' and r.sentiment = 'neutral';



-- 14. Extract all negative sentiment reviews for Adobe Acrobat Reader with their sentiment polarity and sentiment subjectivity

select * from cleaned_reviews
 where app = 'Adobe Acrobat Reader' and Sentiment = 'negative';

