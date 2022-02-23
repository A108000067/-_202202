SELECT ISNULL([2],0) AS '科技部計畫', ISNULL([3],0) AS '教育部計畫', ISNULL([4],0) AS '推廣教育', ISNULL([5],0) AS '技術移轉案', ISNULL([6],0) AS '其他計畫'  FROM
(
SELECT  [PPS_Research_TYPE_認列類別].[認列類別ID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName AS 單位
,CAST(SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercent)AS FLOAT)/10000 AS 績效分配比
  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
	
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
INNER JOIN [dbo].[PPS_Research_TYPE_認列項目] ON [認列Map2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_認列類別] ON [PPS_Research_TYPE_認列類別].[認列類別ID] = [dbo].[PPS_Research_TYPE_認列項目].[認列類別ID]

WHERE YEAR([dPlanStartDate]) =2021 AND [PPS_Research_TYPE_認列類別].[認列類別ID]=2
GROUP BY [PPS_Research_TYPE_認列類別].[認列類別ID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName

UNION

SELECT  [PPS_Research_TYPE_認列類別].[認列類別ID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName AS 單位
,CAST(SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercent) AS FLOAT)/10000 AS 績效分配比
  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
	
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
INNER JOIN [dbo].[PPS_Research_TYPE_認列項目] ON [認列Map2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_認列類別] ON [PPS_Research_TYPE_認列類別].[認列類別ID] = [dbo].[PPS_Research_TYPE_認列項目].[認列類別ID]

WHERE YEAR([dPlanStartDate]) =2021 AND [PPS_Research_TYPE_認列類別].[認列類別ID]=3
GROUP BY [PPS_Research_TYPE_認列類別].[認列類別ID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName

UNION

SELECT  [PPS_Research_TYPE_認列類別].[認列類別ID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName AS 單位
,CAST(SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercent) AS FLOAT)/10000 AS 績效分配比
  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
INNER JOIN [dbo].[PPS_Research_TYPE_認列項目] ON [認列Map2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_認列類別] ON [PPS_Research_TYPE_認列類別].[認列類別ID] = [dbo].[PPS_Research_TYPE_認列項目].[認列類別ID]
WHERE YEAR([dPlanStartDate]) =2021 AND [PPS_Research_TYPE_認列類別].[認列類別ID]=4
GROUP BY [PPS_Research_TYPE_認列類別].[認列類別ID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName

UNION

SELECT  [PPS_Research_TYPE_認列類別].[認列類別ID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName AS 單位
,CAST(SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercent) AS FLOAT)/10000 AS 績效分配比
  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
INNER JOIN [dbo].[PPS_Research_TYPE_認列項目] ON [認列Map2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_認列類別] ON [PPS_Research_TYPE_認列類別].[認列類別ID] = [dbo].[PPS_Research_TYPE_認列項目].[認列類別ID]
WHERE YEAR([dPlanStartDate]) =2021 AND [PPS_Research_TYPE_認列類別].[認列類別ID]=5
GROUP BY [PPS_Research_TYPE_認列類別].[認列類別ID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName

UNION

SELECT  [PPS_Research_TYPE_認列類別].[認列類別ID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName AS 單位
,CAST(SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercent) AS FLOAT)/10000 AS 績效分配比
  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
INNER JOIN [dbo].[PPS_Research_TYPE_認列項目] ON [認列Map2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_認列類別] ON [PPS_Research_TYPE_認列類別].[認列類別ID] = [dbo].[PPS_Research_TYPE_認列項目].[認列類別ID]
WHERE YEAR([dPlanStartDate]) =2021 AND [PPS_Research_TYPE_認列類別].[認列類別ID]=6
GROUP BY [PPS_Research_TYPE_認列類別].[認列類別ID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName

) t
PIVOT(
SUM(績效分配比)
FOR [認列類別ID] in([2],[3],[4],[5],[6])
) AS PT



------------------
--SELECT  --[PPS_Research_TYPE_認列類別].[認列類別ID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName AS 單位
--[PPS_Research_TABLE_Main].*
----,CAST(SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercent) AS FLOAT)/10000 AS 績效分配比

--  FROM [PPS_Research_TABLE_Main]
--  INNER JOIN
--	PPS_Research_TABLE_AchievementPeople ON 
--	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
--INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
--INNER JOIN [dbo].[PPS_Research_TYPE_認列項目] ON [認列Map2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
--INNER JOIN [dbo].[PPS_Research_TYPE_認列類別] ON [PPS_Research_TYPE_認列類別].[認列類別ID] = [dbo].[PPS_Research_TYPE_認列項目].[認列類別ID]
--WHERE YEAR([dPlanStartDate]) =2021 AND [PPS_Research_TYPE_認列類別].[認列類別ID]=4 AND PPS_Research_TABLE_AchievementPeople.[cUnit]=316 AND [PPS_Research_TABLE_Main].iAutoIndex= 12914
--GROUP BY [PPS_Research_TABLE_Main].cMEAPlanName
--,[PPS_Research_TABLE_Main].cMEAPlanNumber


