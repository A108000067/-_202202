SELECT ISNULL([2],0) AS '��޳��p�e', ISNULL([3],0) AS '�Ш|���p�e', ISNULL([4],0) AS '���s�Ш|', ISNULL([5],0) AS '�޳N�����', ISNULL([6],0) AS '��L�p�e'  FROM
(
SELECT  [PPS_Research_TYPE_�{�C���O].[�{�C���OID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName AS ���
,CAST(SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercent)AS FLOAT)/10000 AS �Z�Ĥ��t��
  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
	
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C���O] ON [PPS_Research_TYPE_�{�C���O].[�{�C���OID] = [dbo].[PPS_Research_TYPE_�{�C����].[�{�C���OID]

WHERE YEAR([dPlanStartDate]) =2021 AND [PPS_Research_TYPE_�{�C���O].[�{�C���OID]=2
GROUP BY [PPS_Research_TYPE_�{�C���O].[�{�C���OID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName

UNION

SELECT  [PPS_Research_TYPE_�{�C���O].[�{�C���OID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName AS ���
,CAST(SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercent) AS FLOAT)/10000 AS �Z�Ĥ��t��
  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
	
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C���O] ON [PPS_Research_TYPE_�{�C���O].[�{�C���OID] = [dbo].[PPS_Research_TYPE_�{�C����].[�{�C���OID]

WHERE YEAR([dPlanStartDate]) =2021 AND [PPS_Research_TYPE_�{�C���O].[�{�C���OID]=3
GROUP BY [PPS_Research_TYPE_�{�C���O].[�{�C���OID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName

UNION

SELECT  [PPS_Research_TYPE_�{�C���O].[�{�C���OID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName AS ���
,CAST(SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercent) AS FLOAT)/10000 AS �Z�Ĥ��t��
  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C���O] ON [PPS_Research_TYPE_�{�C���O].[�{�C���OID] = [dbo].[PPS_Research_TYPE_�{�C����].[�{�C���OID]
WHERE YEAR([dPlanStartDate]) =2021 AND [PPS_Research_TYPE_�{�C���O].[�{�C���OID]=4
GROUP BY [PPS_Research_TYPE_�{�C���O].[�{�C���OID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName

UNION

SELECT  [PPS_Research_TYPE_�{�C���O].[�{�C���OID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName AS ���
,CAST(SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercent) AS FLOAT)/10000 AS �Z�Ĥ��t��
  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C���O] ON [PPS_Research_TYPE_�{�C���O].[�{�C���OID] = [dbo].[PPS_Research_TYPE_�{�C����].[�{�C���OID]
WHERE YEAR([dPlanStartDate]) =2021 AND [PPS_Research_TYPE_�{�C���O].[�{�C���OID]=5
GROUP BY [PPS_Research_TYPE_�{�C���O].[�{�C���OID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName

UNION

SELECT  [PPS_Research_TYPE_�{�C���O].[�{�C���OID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName AS ���
,CAST(SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercent) AS FLOAT)/10000 AS �Z�Ĥ��t��
  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C���O] ON [PPS_Research_TYPE_�{�C���O].[�{�C���OID] = [dbo].[PPS_Research_TYPE_�{�C����].[�{�C���OID]
WHERE YEAR([dPlanStartDate]) =2021 AND [PPS_Research_TYPE_�{�C���O].[�{�C���OID]=6
GROUP BY [PPS_Research_TYPE_�{�C���O].[�{�C���OID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName

) t
PIVOT(
SUM(�Z�Ĥ��t��)
FOR [�{�C���OID] in([2],[3],[4],[5],[6])
) AS PT



------------------
--SELECT  --[PPS_Research_TYPE_�{�C���O].[�{�C���OID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName AS ���
--[PPS_Research_TABLE_Main].*
----,CAST(SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercent) AS FLOAT)/10000 AS �Z�Ĥ��t��

--  FROM [PPS_Research_TABLE_Main]
--  INNER JOIN
--	PPS_Research_TABLE_AchievementPeople ON 
--	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
--INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
--INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
--INNER JOIN [dbo].[PPS_Research_TYPE_�{�C���O] ON [PPS_Research_TYPE_�{�C���O].[�{�C���OID] = [dbo].[PPS_Research_TYPE_�{�C����].[�{�C���OID]
--WHERE YEAR([dPlanStartDate]) =2021 AND [PPS_Research_TYPE_�{�C���O].[�{�C���OID]=4 AND PPS_Research_TABLE_AchievementPeople.[cUnit]=316 AND [PPS_Research_TABLE_Main].iAutoIndex= 12914
--GROUP BY [PPS_Research_TABLE_Main].cMEAPlanName
--,[PPS_Research_TABLE_Main].cMEAPlanNumber


