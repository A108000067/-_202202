SELECT 單位, ISNULL([2],0) AS '科技部計畫', ISNULL([3],0) AS '教育部計畫', ISNULL([4],0) AS '推廣教育', ISNULL([5],0) AS '技術移轉案', ISNULL([6],0) AS '其他計畫'  FROM
(
SELECT [PPS_Research_TYPE_認列項目].[認列類別ID],TD.cName AS 單位, 
SUM(A.iUnitPercentMoney) AS 績效分配金額
FROM dbo.PPS_Research_TABLE_Main AS M 
INNER JOIN dbo.PPS_Research_TYPE_PlanType AS TP ON M.cMap2PlanType = TP.cIndex 
INNER JOIN [dbo].[PPS_Research_TYPE_認列項目] ON [認列Map2PlanTypeIndex]=M.[cMap2PlanType] 
AND [PPS_Research_TYPE_認列項目].[認列類別ID] = 2
INNER JOIN
(
SELECT A.iMap2Main, A.cHCode, M.cPlanDepartmentMap2Department AS cPlanDepartmentIndex, a.bIsMaster, A.iUnitPercent, A.iUnitPercentMoney
FROM dbo.PPS_Research_TABLE_AchievementPeople AS A INNER JOIN
    dbo.PPS_Research_TABLE_Main AS M ON A.iMap2Main = M.iAutoIndex AND A.bIsMaster = 1
UNION
SELECT A.iMap2Main, A.cHCode, C.cUnitInside AS cPlanDepartmentIndex, a.bIsMaster, A.iUnitPercent, A.iUnitPercentMoney
FROM dbo.PPS_Research_TABLE_AchievementPeople AS A INNER JOIN
    dbo.PPS_Research_TABLE_CoMaster AS C ON A.iMap2Main = C.iMap2Main AND A.bIsMaster = 0 
	AND A.cHCode = C.cHCodeInside AND A.cUnit = C.cUnitInside

)AS A ON M.iAutoIndex = A.iMap2Main AND M.bPlanMoneyIntoSchool = 1 AND M.bPlanStateCheck = 1 
INNER JOIN
dbo.PPS_Research_TYPE_Department AS TD ON A.cPlanDepartmentIndex = TD.cIndex
WHERE  YEAR(M.[dPlanStartDate]) =2021 
GROUP BY [PPS_Research_TYPE_認列項目].[認列類別ID], TD.cName

UNION

SELECT [PPS_Research_TYPE_認列項目].[認列類別ID],TD.cName AS 單位, 
SUM(A.iUnitPercentMoney) AS 績效分配金額
FROM dbo.PPS_Research_TABLE_Main AS M 
INNER JOIN dbo.PPS_Research_TYPE_PlanType AS TP ON M.cMap2PlanType = TP.cIndex 
INNER JOIN [dbo].[PPS_Research_TYPE_認列項目] ON [認列Map2PlanTypeIndex]=M.[cMap2PlanType] 
AND [PPS_Research_TYPE_認列項目].[認列類別ID] = 3
INNER JOIN
(
SELECT A.iMap2Main, A.cHCode, M.cPlanDepartmentMap2Department AS cPlanDepartmentIndex, a.bIsMaster, A.iUnitPercent, A.iUnitPercentMoney
FROM dbo.PPS_Research_TABLE_AchievementPeople AS A INNER JOIN
    dbo.PPS_Research_TABLE_Main AS M ON A.iMap2Main = M.iAutoIndex AND A.bIsMaster = 1
UNION
SELECT A.iMap2Main, A.cHCode, C.cUnitInside AS cPlanDepartmentIndex, a.bIsMaster, A.iUnitPercent, A.iUnitPercentMoney
FROM dbo.PPS_Research_TABLE_AchievementPeople AS A INNER JOIN
    dbo.PPS_Research_TABLE_CoMaster AS C ON A.iMap2Main = C.iMap2Main AND A.bIsMaster = 0 
	AND A.cHCode = C.cHCodeInside AND A.cUnit = C.cUnitInside

)AS A ON M.iAutoIndex = A.iMap2Main AND M.bPlanMoneyIntoSchool = 1 AND M.bPlanStateCheck = 1 
INNER JOIN
dbo.PPS_Research_TYPE_Department AS TD ON A.cPlanDepartmentIndex = TD.cIndex
WHERE  YEAR(M.[dPlanStartDate]) =2021 
GROUP BY [PPS_Research_TYPE_認列項目].[認列類別ID], TD.cName


UNION

SELECT [PPS_Research_TYPE_認列項目].[認列類別ID],TD.cName AS 單位, 
SUM(A.iUnitPercentMoney) AS 績效分配金額
FROM dbo.PPS_Research_TABLE_Main AS M 
INNER JOIN dbo.PPS_Research_TYPE_PlanType AS TP ON M.cMap2PlanType = TP.cIndex 
INNER JOIN [dbo].[PPS_Research_TYPE_認列項目] ON [認列Map2PlanTypeIndex]=M.[cMap2PlanType] 
AND [PPS_Research_TYPE_認列項目].[認列類別ID] = 4
INNER JOIN
(
SELECT A.iMap2Main, A.cHCode, M.cPlanDepartmentMap2Department AS cPlanDepartmentIndex, a.bIsMaster, A.iUnitPercent, A.iUnitPercentMoney
FROM dbo.PPS_Research_TABLE_AchievementPeople AS A INNER JOIN
    dbo.PPS_Research_TABLE_Main AS M ON A.iMap2Main = M.iAutoIndex AND A.bIsMaster = 1
UNION
SELECT A.iMap2Main, A.cHCode, C.cUnitInside AS cPlanDepartmentIndex, a.bIsMaster, A.iUnitPercent, A.iUnitPercentMoney
FROM dbo.PPS_Research_TABLE_AchievementPeople AS A INNER JOIN
    dbo.PPS_Research_TABLE_CoMaster AS C ON A.iMap2Main = C.iMap2Main AND A.bIsMaster = 0 
	AND A.cHCode = C.cHCodeInside AND A.cUnit = C.cUnitInside

)AS A ON M.iAutoIndex = A.iMap2Main AND M.bPlanMoneyIntoSchool = 1 AND M.bPlanStateCheck = 1 
INNER JOIN
dbo.PPS_Research_TYPE_Department AS TD ON A.cPlanDepartmentIndex = TD.cIndex
WHERE  YEAR(M.[dPlanStartDate]) =2021 
GROUP BY [PPS_Research_TYPE_認列項目].[認列類別ID], TD.cName


UNION

SELECT [PPS_Research_TYPE_認列項目].[認列類別ID],TD.cName AS 單位, 
SUM(A.iUnitPercentMoney) AS 績效分配金額
FROM dbo.PPS_Research_TABLE_Main AS M 
INNER JOIN dbo.PPS_Research_TYPE_PlanType AS TP ON M.cMap2PlanType = TP.cIndex 
INNER JOIN [dbo].[PPS_Research_TYPE_認列項目] ON [認列Map2PlanTypeIndex]=M.[cMap2PlanType] 
AND [PPS_Research_TYPE_認列項目].[認列類別ID] = 5
INNER JOIN
(
SELECT A.iMap2Main, A.cHCode, M.cPlanDepartmentMap2Department AS cPlanDepartmentIndex, a.bIsMaster, A.iUnitPercent, A.iUnitPercentMoney
FROM dbo.PPS_Research_TABLE_AchievementPeople AS A INNER JOIN
    dbo.PPS_Research_TABLE_Main AS M ON A.iMap2Main = M.iAutoIndex AND A.bIsMaster = 1
UNION
SELECT A.iMap2Main, A.cHCode, C.cUnitInside AS cPlanDepartmentIndex, a.bIsMaster, A.iUnitPercent, A.iUnitPercentMoney
FROM dbo.PPS_Research_TABLE_AchievementPeople AS A INNER JOIN
    dbo.PPS_Research_TABLE_CoMaster AS C ON A.iMap2Main = C.iMap2Main AND A.bIsMaster = 0 
	AND A.cHCode = C.cHCodeInside AND A.cUnit = C.cUnitInside

)AS A ON M.iAutoIndex = A.iMap2Main AND M.bPlanMoneyIntoSchool = 1 AND M.bPlanStateCheck = 1 
INNER JOIN
dbo.PPS_Research_TYPE_Department AS TD ON A.cPlanDepartmentIndex = TD.cIndex
WHERE  YEAR(M.[dPlanStartDate]) =2021 
GROUP BY [PPS_Research_TYPE_認列項目].[認列類別ID], TD.cName

UNION

SELECT [PPS_Research_TYPE_認列項目].[認列類別ID],TD.cName AS 單位, 
SUM(A.iUnitPercentMoney) AS 績效分配金額
FROM dbo.PPS_Research_TABLE_Main AS M 
INNER JOIN dbo.PPS_Research_TYPE_PlanType AS TP ON M.cMap2PlanType = TP.cIndex 
INNER JOIN [dbo].[PPS_Research_TYPE_認列項目] ON [認列Map2PlanTypeIndex]=M.[cMap2PlanType] 
AND [PPS_Research_TYPE_認列項目].[認列類別ID] = 6
INNER JOIN
(
SELECT A.iMap2Main, A.cHCode, M.cPlanDepartmentMap2Department AS cPlanDepartmentIndex, a.bIsMaster, A.iUnitPercent, A.iUnitPercentMoney
FROM dbo.PPS_Research_TABLE_AchievementPeople AS A INNER JOIN
    dbo.PPS_Research_TABLE_Main AS M ON A.iMap2Main = M.iAutoIndex AND A.bIsMaster = 1
UNION
SELECT A.iMap2Main, A.cHCode, C.cUnitInside AS cPlanDepartmentIndex, a.bIsMaster, A.iUnitPercent, A.iUnitPercentMoney
FROM dbo.PPS_Research_TABLE_AchievementPeople AS A INNER JOIN
    dbo.PPS_Research_TABLE_CoMaster AS C ON A.iMap2Main = C.iMap2Main AND A.bIsMaster = 0 
	AND A.cHCode = C.cHCodeInside AND A.cUnit = C.cUnitInside

)AS A ON M.iAutoIndex = A.iMap2Main AND M.bPlanMoneyIntoSchool = 1 AND M.bPlanStateCheck = 1 
INNER JOIN
dbo.PPS_Research_TYPE_Department AS TD ON A.cPlanDepartmentIndex = TD.cIndex
WHERE  YEAR(M.[dPlanStartDate]) =2021 
GROUP BY [PPS_Research_TYPE_認列項目].[認列類別ID], TD.cName
) t
PIVOT(
SUM(績效分配金額)
FOR [認列類別ID] in([2],[3],[4],[5],[6])
) AS PT



------------------
SELECT  --[PPS_Research_TYPE_認列類別].[認列類別ID], PPS_Research_TABLE_AchievementPeople.[cUnit], PPS_Research_TYPE_Department.cName AS 單位
--[PPS_Research_TABLE_Main].*
--,CAST(SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercent) AS FLOAT)/10000 AS 績效分配比
PPS_Research_TABLE_AchievementPeople.iUnitPercentMoney

  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
INNER JOIN [dbo].[PPS_Research_TYPE_認列項目] ON [認列Map2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_認列類別] ON [PPS_Research_TYPE_認列類別].[認列類別ID] = [dbo].[PPS_Research_TYPE_認列項目].[認列類別ID]
WHERE YEAR([dPlanStartDate]) =2021 AND [PPS_Research_TYPE_認列類別].[認列類別ID]=4 AND PPS_Research_TABLE_AchievementPeople.[cUnit]=316 AND [PPS_Research_TABLE_Main].iAutoIndex= 12914
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


/* 本校配合款 */
SELECT  PPS_Research_TYPE_Department.cName AS 單位
,SUM(PPS_Research_TABLE_AchievementPeople.iUnitPercentMoney) AS 總計
,SUM([PPS_Research_TABLE_Main].iMyselfMoney*(CAST(PPS_Research_TABLE_AchievementPeople.iUnitPercent AS FLOAT)/10000))AS 本校配合款

  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
	
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex

WHERE YEAR([dPlanStartDate]) =2021 
GROUP BY  PPS_Research_TYPE_Department.cName

--查看明細
SELECT PPS_Research_TYPE_Department.cName,
[PPS_Research_TABLE_Main].cPlanSN,PPS_Research_TABLE_AchievementPeople.iUnitPercentMoney
--[PPS_Research_TABLE_Main].cPlanSN,[PPS_Research_TABLE_Main].iMyselfMoney AS 本校配合款
  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
	
INNER JOIN PPS_Research_TYPE_Department ON PPS_Research_TABLE_AchievementPeople.cUnit = PPS_Research_TYPE_Department.cIndex
INNER JOIN [dbo].[PPS_Research_TYPE_認列項目] ON [認列Map2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_認列類別] ON [PPS_Research_TYPE_認列類別].[認列類別ID] = [dbo].[PPS_Research_TYPE_認列項目].[認列類別ID]

WHERE YEAR([dPlanStartDate]) =2021 AND  PPS_Research_TYPE_Department.cName =N'材料工程系(所)' AND  [PPS_Research_TYPE_認列類別].[認列類別ID]=6


--查看某計畫明細
SELECT  PPS_Research_TABLE_AchievementPeople.cUnit,[advedusys].[dbo].[STD_Department].cName,
[PPS_Research_TABLE_Main].cPlanSN,PPS_Research_TABLE_AchievementPeople.iUnitPercentMoney
--[PPS_Research_TABLE_Main].cPlanSN,[PPS_Research_TABLE_Main].iMyselfMoney AS 本校配合款
  FROM [PPS_Research_TABLE_Main]
  INNER JOIN
	PPS_Research_TABLE_AchievementPeople ON 
	PPS_Research_TABLE_AchievementPeople.iMap2Main =  PPS_Research_TABLE_Main.iAutoIndex
	
INNER JOIN  [advedusys].[dbo].[STD_Department] ON  SUBSTRING(PPS_Research_TABLE_AchievementPeople.cHCode,15,3) = [advedusys].[dbo].[STD_Department].[cFCode_3]
INNER JOIN [dbo].[PPS_Research_TYPE_認列項目] ON [認列Map2PlanTypeIndex]=[PPS_Research_TABLE_Main].[cMap2PlanType]
INNER JOIN [dbo].[PPS_Research_TYPE_認列類別] ON [PPS_Research_TYPE_認列類別].[認列類別ID] = [dbo].[PPS_Research_TYPE_認列項目].[認列類別ID]
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


