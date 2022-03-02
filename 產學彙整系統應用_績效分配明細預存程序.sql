-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE 研發P績效分配明細 
	-- Add the parameters for the stored procedure here
	@年度 int = 2021
	AS
BEGIN
	
SELECT SUMM.*, SelfMoney.本校配合款 FROM 
(SELECT PT.單位, '件數' AS 項目,ISNULL([2],0) AS '科技部計畫', ISNULL([3],0) AS '教育部計畫', ISNULL([4],0) AS '推廣教育'
, ISNULL([5],0) AS '技術移轉案', ISNULL([6],0) AS '其他計畫' 
FROM
(
SELECT [PPS_Research_TYPE_認列項目].[認列類別ID],TD.cName AS 單位, 
CAST(SUM(A.iUnitPercent)AS FLOAT)/10000 AS 績效分配比

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
WHERE  YEAR(M.[dPlanStartDate]) =@年度 
GROUP BY [PPS_Research_TYPE_認列項目].[認列類別ID], TD.cName

UNION

SELECT [PPS_Research_TYPE_認列項目].[認列類別ID],TD.cName AS 單位, 
CAST(SUM(A.iUnitPercent)AS FLOAT)/10000 AS 績效分配比

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
WHERE  YEAR(M.[dPlanStartDate]) =@年度 
GROUP BY [PPS_Research_TYPE_認列項目].[認列類別ID], TD.cName


UNION

SELECT [PPS_Research_TYPE_認列項目].[認列類別ID],TD.cName AS 單位, 
CAST(SUM(A.iUnitPercent)AS FLOAT)/10000 AS 績效分配比

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
WHERE  YEAR(M.[dPlanStartDate]) =@年度 
GROUP BY [PPS_Research_TYPE_認列項目].[認列類別ID], TD.cName


UNION

SELECT [PPS_Research_TYPE_認列項目].[認列類別ID],TD.cName AS 單位, 
CAST(SUM(A.iUnitPercent)AS FLOAT)/10000 AS 績效分配比

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
WHERE  YEAR(M.[dPlanStartDate]) =@年度 
GROUP BY [PPS_Research_TYPE_認列項目].[認列類別ID], TD.cName

UNION

SELECT [PPS_Research_TYPE_認列項目].[認列類別ID],TD.cName AS 單位, 
CAST(SUM(A.iUnitPercent)AS FLOAT)/10000 AS 績效分配比

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
WHERE  YEAR(M.[dPlanStartDate]) =@年度 
GROUP BY [PPS_Research_TYPE_認列項目].[認列類別ID], TD.cName
) t
PIVOT(SUM(績效分配比)
FOR [認列類別ID] in([2],[3],[4],[5],[6])
) AS PT

UNION

SELECT PT.單位,  '金額' AS 項目,ISNULL([2],0) AS '科技部計畫', ISNULL([3],0) AS '教育部計畫', ISNULL([4],0) AS '推廣教育', ISNULL([5],0) AS '技術移轉案', ISNULL([6],0) AS '其他計畫'  FROM
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
WHERE  YEAR(M.[dPlanStartDate]) =@年度 
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
WHERE  YEAR(M.[dPlanStartDate]) =@年度 
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
WHERE  YEAR(M.[dPlanStartDate]) =@年度 
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
WHERE  YEAR(M.[dPlanStartDate]) =@年度 
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
WHERE  YEAR(M.[dPlanStartDate]) =@年度 
GROUP BY [PPS_Research_TYPE_認列項目].[認列類別ID], TD.cName
) t
PIVOT(
SUM(績效分配金額)
FOR [認列類別ID] in([2],[3],[4],[5],[6])
) AS PT
)AS SUMM
LEFT JOIN 
(
/* 本校配合款 */
SELECT  TD.cName AS 單位
,SUM(M.iMyselfMoney*(CAST(A.iUnitPercent AS FLOAT)/10000))AS 本校配合款
FROM [PPS_Research_TABLE_Main] AS M 
	INNER JOIN
(
SELECT A.iMap2Main, A.cHCode, M.cPlanDepartmentMap2Department AS cPlanDepartmentIndex, a.bIsMaster, A.iUnitPercent
FROM dbo.PPS_Research_TABLE_AchievementPeople AS A INNER JOIN
    dbo.PPS_Research_TABLE_Main AS M ON A.iMap2Main = M.iAutoIndex AND A.bIsMaster = 1
UNION
SELECT A.iMap2Main, A.cHCode, C.cUnitInside AS cPlanDepartmentIndex, a.bIsMaster, A.iUnitPercent
FROM dbo.PPS_Research_TABLE_AchievementPeople AS A INNER JOIN
    dbo.PPS_Research_TABLE_CoMaster AS C ON A.iMap2Main = C.iMap2Main AND A.bIsMaster = 0 
	AND A.cHCode = C.cHCodeInside AND A.cUnit = C.cUnitInside
)AS A ON M.iAutoIndex = A.iMap2Main AND M.bPlanMoneyIntoSchool = 1 AND M.bPlanStateCheck = 1 
INNER JOIN
dbo.PPS_Research_TYPE_Department AS TD ON A.cPlanDepartmentIndex = TD.cIndex

WHERE YEAR([dPlanStartDate]) =@年度 
GROUP BY  TD.cName
) AS SelfMoney ON SUMM.單位=SelfMoney.單位

END
GO

