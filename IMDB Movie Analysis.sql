--Counting and Removiung Duplicates 
select count(movie_title) as counts , Movie_title from dw.imdb_movie
		group by movie_title
		having count(movie_title) >1
		order by 2


		-- Removing Duplicates
		with duplicates as
		(
		select  ROW_NUMBER () OVER (PARTiTION BY MOVIE_TITLE ORDER BY MOVIE_TitLE) AS Rank ,* from dw.imdb_movie
	)
	Delete  from duplicates
	where rank>1


	-- UPdating the table 
update  dw.imdb_movie 
set gross=Round(gross,0),
 director_facebook_likes=Round(director_facebook_likes,0),
 num_critic_for_reviews=Round(num_critic_for_reviews,0),
 NUM_USER_FOR_REVIEWS=ROUND(NUM_USER_FOR_REVIEWS,0)


 upDATE DW.IMDB_MOVIE
 SET Content_rating='Not Rated'
 WHERE Content_Rating IS NULL 

 alter table dw.imdb_movie
 alter column decade varchar (250)

update dw.imdb_movie
set profit=(Gross-Budget)



update  dw.imdb_movie
set decade =
case when title_year between 1916 and 1929 then '1920s'
when title_year between 1930 and  1939 then '1930s'
when title_year between 1940 and 1949 then '1940s'
when title_year between 1950 and 1959 then '1950s'
when title_year between 1960 and 1969 then '1960s'
when title_year between 1970 and 1979 then '1970s'
when title_year between 1980 and 1989 then '1980s'
when title_year between 1990 and 1999 then '1990s'
when title_year between 2000 and 2009 then '2000s'
when title_year between 2010 and 2019 then '2010s'
end 

select * from dw.imdb_movie




--Insights

--Yearwise Movie Counts 
SELECT COUNT(MOVIE_TITLE) AS [Movie Counts], TITLE_YEAR as Year FROM DW.IMDB_MOVIE
GROUP BY TITLE_YEAR
ORDER BY 2



-- dedcadewise Movie Counts


SELECT  Decade , COUNT(MOVIE_TITLE) AS [Movie Counts] FROM DW.IMDB_MOVIE
GROUP BY decade
ORDER BY 1



-- Sum Of Users Voted In Each Year 

SELECT  Decade , sum(User_Rating_Votes) AS [User Votes] FROM DW.IMDB_MOVIE
GROUP BY decade
ORDER BY 1



	-- Popular Genres
	   SELECT  Keywords ,COUNT(Movie_Title)  AS Movies FROM  dw.imdb_movie
		OUTER APPLY(SELECT items AS  Keywords FROM dw.udfStringSplitterCLR( genres, '|') AS s) AS X
		WHERE Genres is not null
		GROUP BY Keywords
		


		-- MOvies With Highest Profit 
	
	
		Select decade  ,Movie_Title, Profit from DW.IMDB_MOVIE
		group by decade , Movie_Title, profit
		order by decade , profit desc 
		

-- Top Movies with highest profit in each decade

		 Select top 1 with ties *
  From  DW.IMDB_MOVIE 
  Order by row_number() over (partition by decade order by profit desc)
		

		with cte as (
Select Decade, Movie_Title, profit
      ,RN = row_number() over (partition by decade order by profit desc)
From  DW.IMDB_MOVIE 
)
Select * 
 From  cte 
 Where RN=1





-- top 250 IMDB Movies with Highest IMDB Score Having User Rating Votes Greater Than 250 


Select  top 250 Movie_Title, [IMDB _Score], User_Rating_Votes from  dw.imdb_movie
where User_Rating_Votes>25000 
order by [IMDB _Score] desc


--top 10 Directors with highet average Imdb Score 


select  TOP 10 * from 
(
select  Director_Name, AVG([IMDB _Score]) as Mean_IMDB_Score from dw.imdb_movie
group by Director_Name
)a
order by Mean_IMDB_Score  desc , Director_Name


--  Leonardo DeCaprio , Meryll  and Brad Pitt Mean Critic Score vs Auidence Score 

select  [First_Actor _Name] , Round(Avg(num_critic_for_reviews),1)  AS Critic_Vote, round(Avg(num_user_for_reviews),1) as Audience_Vote
 from dw.imdb_movie
 where [First_Actor _Name] IN ('Leonardo DiCaprio' , 'Meryl Streep','Brad Pitt')
 group by [First_Actor _Name]
 order by 2 desc,3 desc

