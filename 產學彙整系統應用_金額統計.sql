SELECT ���, ISNULL([2],0) AS '��޳��p�e', ISNULL([3],0) AS '�Ш|���p�e', ISNULL([4],0) AS '���s�Ш|', ISNULL([5],0) AS '�޳N�����', ISNULL([6],0) AS '��L�p�e'  FROM
(
SELECT  [PPS_Research_TYPE_�{�C���O].[�{�C���OID],  SUBSTRING(PPS_Research_TABLE_AchievementPeople.cHCode,13,2)  AS �G�ų�� ,PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName AS ���
,SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercentMoney) AS �Z�Ĥ��t���B
  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C���O] ON [PPS_Research_TYPE_�{�C���O].[�{�C���OID] = [dbo].[PPS_Research_TYPE_�{�C����].[�{�C���OID]

WHERE YEAR([dPlanStartDate]) =2021 
GROUP BY [PPS_Research_TYPE_�{�C���O].[�{�C���OID], SUBSTRING(PPS_Research_TABLE_AchievementPeople.cHCode,13,2) ,PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName

UNION
SELECT  [PPS_Research_TYPE_�{�C���O].[�{�C���OID],SUBSTRING(PPS_Research_TABLE_AchievementPeople.cHCode,13,2)  AS �G�ų��, PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName AS ���
,SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercentMoney) AS �Z�Ĥ��t���B
  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C���O] ON [PPS_Research_TYPE_�{�C���O].[�{�C���OID] = [dbo].[PPS_Research_TYPE_�{�C����].[�{�C���OID]

WHERE YEAR([dPlanStartDate]) =2021 AND [PPS_Research_TYPE_�{�C���O].[�{�C���OID]=3
GROUP BY [PPS_Research_TYPE_�{�C���O].[�{�C���OID], SUBSTRING(PPS_Research_TABLE_AchievementPeople.cHCode,13,2),PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName

UNION
SELECT  [PPS_Research_TYPE_�{�C���O].[�{�C���OID],SUBSTRING(PPS_Research_TABLE_AchievementPeople.cHCode,13,2)  AS �G�ų��, PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName AS ���
,SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercentMoney) AS �Z�Ĥ��t���B
 FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C���O] ON [PPS_Research_TYPE_�{�C���O].[�{�C���OID] = [dbo].[PPS_Research_TYPE_�{�C����].[�{�C���OID]
WHERE YEAR([dPlanStartDate]) =2021 AND [PPS_Research_TYPE_�{�C���O].[�{�C���OID]=4
GROUP BY [PPS_Research_TYPE_�{�C���O].[�{�C���OID], SUBSTRING(PPS_Research_TABLE_AchievementPeople.cHCode,13,2),PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName

UNION

SELECT  [PPS_Research_TYPE_�{�C���O].[�{�C���OID], SUBSTRING(PPS_Research_TABLE_AchievementPeople.cHCode,13,2)  AS �G�ų��,PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName AS ���
,SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercentMoney) AS �Z�Ĥ��t���B
  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C���O] ON [PPS_Research_TYPE_�{�C���O].[�{�C���OID] = [dbo].[PPS_Research_TYPE_�{�C����].[�{�C���OID]
WHERE YEAR([dPlanStartDate]) =2021 AND [PPS_Research_TYPE_�{�C���O].[�{�C���OID]=5
GROUP BY [PPS_Research_TYPE_�{�C���O].[�{�C���OID], SUBSTRING(PPS_Research_TABLE_AchievementPeople.cHCode,13,2),PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName

UNION

SELECT  [PPS_Research_TYPE_�{�C���O].[�{�C���OID], SUBSTRING(PPS_Research_TABLE_AchievementPeople.cHCode,13,2)  AS �G�ų��,PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName AS ���
,SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercentMoney) AS �Z�Ĥ��t���B
  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C���O] ON [PPS_Research_TYPE_�{�C���O].[�{�C���OID] = [dbo].[PPS_Research_TYPE_�{�C����].[�{�C���OID]
WHERE YEAR([dPlanStartDate]) =2021 AND [PPS_Research_TYPE_�{�C���O].[�{�C���OID]=6
GROUP BY [PPS_Research_TYPE_�{�C���O].[�{�C���OID], SUBSTRING(PPS_Research_TABLE_AchievementPeople.cHCode,13,2),PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName
) t
PIVOT(
SUM(�Z�Ĥ��t���B)
FOR [�{�C���OID] in([2],[3],[4],[5],[6])
) AS PT



------------------
SELECT  --[PPS_Research_TYPE_�{�C���O].[�{�C���OID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName AS ���
--[PPS_Research_TABLE_Main].*
--,CAST(SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercent) AS FLOAT)/10000 AS �Z�Ĥ��t��
PPS_Research_TABLE_AchievementPeople.iUnitPercentMoney

  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C���O] ON [PPS_Research_TYPE_�{�C���O].[�{�C���OID] = [dbo].[PPS_Research_TYPE_�{�C����].[�{�C���OID]
WHERE YEAR([dPlanStartDate]) =2021 AND [PPS_Research_TYPE_�{�C���O].[�{�C���OID]=4 AND PPS_Research_TABLE_AchievementPeople.[cUnit]=316 AND [PPS_Research_TABLE_Main].iAutoIndex= 12914
GROUP BY [PPS_Research_TABLE_Main].cMEAPlanName
,[PPS_Research_TABLE_Main].cMEAPlanNumber

SELECT *-- iUnitPercentMoney
FROM
PPS_Research_TABLE_AchievementPeople
--[PPS_Research_TABLE_Main]
WHERE 
--[PPS_Research_TABLE_Main].cPlanSN=N'110-N-313-EDU-U-068'
PPS_Research_TABLE_AchievementPeople.iMap2Main=12776


SELECT *-- iUnitPercentMoney
FROM
[PPS_Research_TABLE_Main]
WHERE 
[PPS_Research_TABLE_Main].cPlanSN=N'110-N-261-GOV-H-042'


/* ���հt�X�� */
SELECT  PPS_Research_TYPE_Department.cName AS ���
,SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercentMoney) AS �`�p
,SUM([PPS_Research_TABLE_Main].iMyselfMoney*(CAST(PPS_Research_TABLE_AchievementPeople.iUnitPercent AS FLOAT)/10000))AS ���հt�X��

  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
	
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex

WHERE YEAR([dPlanStartDate]) =2021 
GROUP BY  PPS_Research_TYPE_Department.cName

--�d�ݩ���
SELECT PPS_Research_TYPE_Department.cName,
[PPS_Research_TABLE_Main].cPlanSN,PPS_Research_TABLE_AchievementPeople.iUnitPercentMoney
--[PPS_Research_TABLE_Main].cPlanSN,[PPS_Research_TABLE_Main].iMyselfMoney AS ���հt�X��
  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
	
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C���O] ON [PPS_Research_TYPE_�{�C���O].[�{�C���OID] = [dbo].[PPS_Research_TYPE_�{�C����].[�{�C���OID]

WHERE YEAR([dPlanStartDate]) =2021 AND  PPS_Research_TYPE_Department.cName =N'���Ƥu�{�t(��)' AND  [PPS_Research_TYPE_�{�C���O].[�{�C���OID]=6


--�d�ݬY�p�e����
SELECT  PPS_Research_TABLE_AchievementPeople.cUnit,[advedusys].[dbo].[STD_Department].cName,
[PPS_Research_TABLE_Main].cPlanSN,PPS_Research_TABLE_AchievementPeople.iUnitPercentMoney
--[PPS_Research_TABLE_Main].cPlanSN,[PPS_Research_TABLE_Main].iMyselfMoney AS ���հt�X��
  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
	
INNER JOIN  [advedusys].[dbo].[STD_Department] ON  SUBSTRING(PPS_Research_TABLE_AchievementPeople.cHCode,15,3) = [advedusys].[dbo].[STD_Department].[cFCode_3]
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C���O] ON [PPS_Research_TYPE_�{�C���O].[�{�C���OID] = [dbo].[PPS_Research_TYPE_�{�C����].[�{�C���OID]
WHERE 
[PPS_Research_TABLE_Main].cPlanSN=N'110-N-261-GOV-H-042'



SELECT * FROM [PPS_Research_TABLE_Main]
WHERE 
[PPS_Research_TABLE_Main].cPlanSN=N'110-N-261-GOV-H-042'


SELECT SUBSTRING(cHCode,15,3) FROM 
PPS_Research_TABLE_AchievementPeople
WHERE iMap2Main=12776


T093000022
D
T
CE
PMD022A0101


