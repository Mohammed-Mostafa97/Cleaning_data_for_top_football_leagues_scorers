SELECT *
FROM [Football_scorers].[dbo].[top_football_scorers]

-- Data Cleaning Process 

SELECT * 
FROM [dbo].[top_football_scorers]

--1: We noticed some unwanted spaces in Player_Names column. Let's TRIM them 

UPDATE [dbo].[top_football_scorers]
SET player_Names = TRIM(Player_Names)

/* 2 : we noticed that some players are having their first name in the club field, mostly it's a human mistake, let's solve this problem.
The results shows that there are some players having none values in their Club cell. 
To solve this problem We are going to use the generated table to search for the club of each player in that specific year.
Since that, the data is not available in the same table. In addition, it's really easy to google them */

SELECT Year,Country,League, Player_names , club, Goals
FROM [dbo].[top_football_scorers]
WHERE Club NOT LIKE '(%'
ORDER BY player_names

-- Now we will add the teams for each player. we will add a new column called Updated_Club 
ALTER TABLE [dbo].[top_football_scorers]
DROP COLUMN Updated_Club

SELECT Year,Country,League, Player_names , club, 
       Case 
	   WHEN Player_Names = 'Aduriz' THEN '(ATB)'
	   WHEN Player_Names = 'Alex Telles' THEN '(POR)'
	   WHEN Player_Names = 'Andone' THEN '(CRD)'
	   WHEN Player_Names = 'Andre' THEN '(FLU)'
	   WHEN Player_Names = 'Andreas Cornelius' THEN '(PAR)'
	   WHEN Player_Names = 'Borriello' THEN '(CAG)'
	   WHEN Player_Names = 'Bruno Rangel' THEN '(CAP)'
	   WHEN Player_Names = 'Cantalapiedra' THEN '(TWE)'
	   WHEN Player_Names = 'Cazorla' THEN '(VLL)'
	   WHEN Player_Names = 'Charles' THEN '(EIP)'
	   WHEN Player_Names = 'Cyriel Dessers' THEN '(HER)'
	   WHEN Player_Names = 'Cyril Thereau' THEN '(UDI)'
	   WHEN Player_Names = 'Danny Ings' THEN '(SOU)'
	   WHEN Player_Names = 'Dudu' THEN '(PAL)'
	   WHEN Player_Names = 'Edigar Junio' THEN '(BAH)'
	   WHEN Player_Names = 'Everaldo' THEN '(CAP)'
	   WHEN Player_Names = 'Fabio Abreu' THEN '(PEN)'
	   WHEN Player_Names = 'Fabio Martins' THEN '(FAM)'
	   WHEN Player_Names = 'Grafite' THEN '(SNC)'
	   WHEN Player_Names = 'Henrique' THEN '(SAN)'
	   WHEN Player_Names = 'Henrique Dourado' THEN '(FLU)'
	   WHEN Player_Names = 'Jonathan Copete' THEN '(ATN)'
	   WHEN Player_Names = 'Junior  Dutra' THEN '(AVF)'
	   WHEN Player_Names = 'Kempes' THEN '(CAP)'
	   WHEN Player_Names = 'Kleber Gladiador' THEN '(COR)'
	   WHEN Player_Names = 'Leandro Damiao' THEN '(INT)'
	   WHEN Player_Names = 'Leandro Pereira' THEN '(PAL)'
	   WHEN Player_Names = 'Luiz Fernando' THEN '(TOM)'
	   WHEN Player_Names = 'Mandzukic None' THEN '(JUV)'
	   WHEN Player_Names = 'Mario Gomez' THEN '(WOB)'
	   WHEN Player_Names = 'Matavz' THEN '(VIT)'
	   WHEN Player_Names = 'Pottker' THEN '(ATL)'
	   WHEN Player_Names = 'Robinho' THEN '(ATM)'
	   WHEN Player_Names = 'Rodrigo None' THEN '(VAL)'
	   WHEN Player_Names = 'Roger Guedes' THEN '(ATM)'
	   WHEN Player_Names = 'Sandro Lima' THEN '(EST)'
	   WHEN Player_Names = 'Sandro Wagner' THEN '(HOF)'
	   WHEN Player_Names = 'Sassa' THEN '(JVT)'
	   WHEN Player_Names = 'Stephan El Shaarawy' THEN '(ROM)'
	   WHEN Player_Names = 'Tiquinho Soares' THEN '(POR)'
	   WHEN Player_Names = 'Wagner' THEN '(HOF)'
	   ELSE Club
	   END AS  Updated_club
FROM [dbo].[top_football_scorers]

-- Now let's Update the table 

UPDATE [dbo].[top_football_scorers]
SET Club =  Case 
	   WHEN Player_Names = 'Aduriz' THEN '(ATB)'
	   WHEN Player_Names = 'Alex Telles' THEN '(POR)'
	   WHEN Player_Names = 'Andone' THEN '(CRD)'
	   WHEN Player_Names = 'Andre' THEN '(FLU)'
	   WHEN Player_Names = 'Andreas Cornelius' THEN '(PAR)'
	   WHEN Player_Names = 'Borriello' THEN '(CAG)'
	   WHEN Player_Names = 'Bruno Rangel' THEN '(CAP)'
	   WHEN Player_Names = 'Cantalapiedra' THEN '(TWE)'
	   WHEN Player_Names = 'Cazorla' THEN '(VLL)'
	   WHEN Player_Names = 'Charles' THEN '(EIP)'
	   WHEN Player_Names = 'Cyriel Dessers' THEN '(HER)'
	   WHEN Player_Names = 'Cyril Thereau' THEN '(UDI)'
	   WHEN Player_Names = 'Danny Ings' THEN '(SOU)'
	   WHEN Player_Names = 'Dudu' THEN '(PAL)'
	   WHEN Player_Names = 'Edigar Junio' THEN '(BAH)'
	   WHEN Player_Names = 'Everaldo' THEN '(CAP)'
	   WHEN Player_Names = 'Fabio Abreu' THEN '(PEN)'
	   WHEN Player_Names = 'Fabio Martins' THEN '(FAM)'
	   WHEN Player_Names = 'Grafite' THEN '(SNC)'
	   WHEN Player_Names = 'Henrique' THEN '(SAN)'
	   WHEN Player_Names = 'Henrique Dourado' THEN '(FLU)'
	   WHEN Player_Names = 'Jonathan Copete' THEN '(ATN)'
	   WHEN Player_Names = 'Junior  Dutra' THEN '(AVF)'
	   WHEN Player_Names = 'Kempes' THEN '(CAP)'
	   WHEN Player_Names = 'Kleber Gladiador' THEN '(COR)'
	   WHEN Player_Names = 'Leandro Damiao' THEN '(INT)'
	   WHEN Player_Names = 'Leandro Pereira' THEN '(PAL)'
	   WHEN Player_Names = 'Luiz Fernando' THEN '(TOM)'
	   WHEN Player_Names = 'Mandzukic None' THEN '(JUV)'
	   WHEN Player_Names = 'Mario Gomez' THEN '(WOB)'
	   WHEN Player_Names = 'Matavz' THEN '(VIT)'
	   WHEN Player_Names = 'Pottker' THEN '(ATL)'
	   WHEN Player_Names = 'Robinho' THEN '(ATM)'
	   WHEN Player_Names = 'Rodrigo None' THEN '(VAL)'
	   WHEN Player_Names = 'Roger Guedes' THEN '(ATM)'
	   WHEN Player_Names = 'Sandro Lima' THEN '(EST)'
	   WHEN Player_Names = 'Sandro Wagner' THEN '(HOF)'
	   WHEN Player_Names = 'Sassa' THEN '(JVT)'
	   WHEN Player_Names = 'Stephan El Shaarawy' THEN '(ROM)'
	   WHEN Player_Names = 'Tiquinho Soares' THEN '(POR)'
	   WHEN Player_Names = 'Wagner' THEN '(HOF)'
	   ELSE Club
	   END 

-- Noe Let's Check Again !! 
SELECT Year,Country,League, Player_names , club, Goals
FROM [dbo].[top_football_scorers]
WHERE Club NOT LIKE '(%'
ORDER BY player_names

--Perfect 

/*3: While cleaning the Club column, we noticed some mistakes in the Player_Names column, Let's Check.*/ 

SELECT Player_names 
FROM [dbo].[top_football_scorers]

-- Some names are having 'None' word 

SELECT Player_names, Club, League, Country  
FROM [dbo].[top_football_scorers]
WHERE Player_Names LIKE '%None%'

-- Let's delete the 'None' word 

UPDATE [dbo].[top_football_scorers]
SET Player_Names = CASE 
			WHEN Player_Names = 'Pedro None' then 'Pedro' 
			WHEN Player_Names = 'Rodrigo None' then 'Rodrigo'
			WHEN Player_Names = 'Mandzukic None' then 'Mandzukic'
			WHEN Player_Names = 'Antony None' then 'Antony'
			WHEN Player_Names = 'Brenner None' then 'Brenner'
			ELSE Player_Names 
			END

-- Let's check again 

SELECT Player_names, Club, League, Country  
FROM [dbo].[top_football_scorers]
WHERE Player_Names LIKE '%None%' 

-- Perfect 

-- 4 : The player named Wagner is repeated with different player name (One includes his first name) for two different years.

SELECT Player_Names, Year, League, Goals 
FROM [dbo].[top_football_scorers]
WHERE Player_Names LIKE'%Wagner%'

--  Let's fix that 

UPDATE [dbo].[top_football_scorers] 
SET Player_Names = CASE 
	WHEN Player_Names = 'Wagner' THEN 'Sandro Wagner'
	ELSE Player_Names 
	END

-- PERFECT 

-- 5: Let's make sure about the players, the club they are playing for in each league
SELECT Player_Names,Club,Year, League 
FROM [dbo].[top_football_scorers]
WHERE Player_Names = 'Zlatan Ibrahimovic'
ORDER BY League

/* We noticed some mistakes in the club field for some players. 
for example, Timo Werner was not playing in Chelsea in 2016, he was playing in Leipzig. 
Let's try to check them*/ 

Update [dbo].[top_football_scorers]
SET Club = Case 
			WHEN Player_Names = 'Timo Werner' AND Year = 2017 THEN '(RBL)'
			WHEN Player_Names = 'Pierre-Emerick Aubameyang' AND Year = 2016 THEN '(DOR)'
			WHEN Player_Names = 'Pierre-Emerick Aubameyang' AND Year = 2017 THEN '(DOR)'
			WHEN Player_Names = 'Luka Jovic' AND Year = 2018 THEN '(FRA)'
			WHEN Player_Names = 'Ante Rebic' AND Year = 2018 THEN '(FRA)'
			WHEN Player_Names = 'Timo Werner' AND Year = 2018 THEN '(RBL)'
			WHEN Player_Names = 'Sebastien Haller' AND Year = 2018 THEN '(FRA)'
			WHEN Player_Names = 'Timo Werner' AND Year = 2019 THEN '(RBL)'
			WHEN Player_Names = 'Kai Havertz' AND Year = 2019 THEN '(LEV)'
			WHEN Player_Names = 'Oussama Idrissi' AND Year = 2020 THEN '(AZA)'
			WHEN Player_Names = 'Nicolas Pepe' AND Year = 2018 THEN '(LIL)'
			WHEN Player_Names = 'Remi Oudin' AND Year = 2018 THEN '(STR)'
			WHEN Player_Names = 'Edinson Cavani' AND Year = 2018 THEN '(PSG)'
			WHEN Player_Names = 'Victor Osimhen' AND Year = 2019 THEN '(LIL)'
			WHEN Player_Names = 'Falcao' AND Year = 2018 THEN '(MON)'
			WHEN Player_Names = 'Gareth Bale' AND Year = 2017 THEN '(RMA)'
			WHEN Player_Names = 'Cristiano Ronaldo' AND Year = 2017 THEN '(RMA)'
			WHEN Player_Names = 'Simone Zaza' AND Year = 2017 THEN '(VAL)'
			WHEN Player_Names = 'Morata' AND Year = 2019 THEN '(ATL)'
			WHEN Player_Names = 'Pablo Sarabia' AND Year = 2018 THEN '(SEV)'
			WHEN Player_Names = 'Wissam Ben Yedder' AND Year = 2018 THEN '(SEV)'
			WHEN Player_Names = 'Cristiano Ronaldo' AND Year = 2016 THEN '(RMA)'
			WHEN Player_Names = 'Neymar' AND Year = 2016 THEN '(BAR)'
			WHEN Player_Names = 'Morata' AND Year = 2016 THEN '(RMA)'
			WHEN Player_Names = 'Wissam Ben Yedder' AND Year = 2016 THEN '(SEV)'
			WHEN Player_Names = 'Eden Hazard' AND Year = 2018 THEN '(CHE)'
			WHEN Player_Names = 'Alexis Sanchez' AND Year = 2016 THEN '(ARS)'
			WHEN Player_Names = 'Romelu Lukaku' AND Year = 2016 THEN '(EVE)'
			WHEN Player_Names = 'Pedro' AND Year = 2016 THEN '(CHE)'
			WHEN Player_Names = 'Eden Hazard' AND Year = 2016 THEN '(CHE)'
			WHEN Player_Names = 'Jermain Defoe' AND Year = 2016 THEN '(SUN)'
			WHEN Player_Names = 'Fernando Llorente' AND Year = 2016 THEN '(TOT)'
			WHEN Player_Names = 'Zlatan Ibrahimovic' AND Year = 2016 THEN '(MNU)'
			WHEN Player_Names = 'Zlatan Ibrahimovic' AND Year = 2019 THEN '(LAG)'
			WHEN Player_Names = 'Carlos Vinicius' AND Year = 2016 THEN '(BEN)'
			WHEN Player_Names = 'Bruno Fernandes' AND Year = 2019 THEN '(LIS)'
			WHEN Player_Names = 'Francesco Caputo' AND Year = 2019 THEN '(SAS)'
			WHEN Player_Names = 'Mirco Antenucci' AND Year = 2017 THEN '(SPA)'
			WHEN Player_Names = 'Mohamed Salah' AND Year = 2016 THEN '(ROM)'
			WHEN Player_Names = 'Mauro Icardi' AND Year = 2018 THEN '(INT)'
			ELSE Club 
			END

-- Done. 

-- 6: Let's check for any duplicates, This query will show us if there are any duplicates

SELECT Country, League, Player_Names, Club, Year, Matches_Played, Substitution, Mins,Goals,[xG], [xG_Per_Avg_Match], [Shots] , 
 [OnTarget] , [Shots_Per_Avg_Match] , [On_Target_Per_Avg_Match] , COUNT(*)
FROM [dbo].[top_football_scorers]
GROUP BY Country, League, Player_Names, Club, Year, Matches_Played, Substitution, Mins,Goals,[xG], [xG_Per_Avg_Match], [Shots] , 
 [OnTarget] , [Shots_Per_Avg_Match] , [On_Target_Per_Avg_Match]
HAVING Count(*) > 1 ;

-- The query shoes that there are no duplicates to delete 
-- There are no unwanted columns to delete as well. 

-- Now I think the Cleaning process is finished. 