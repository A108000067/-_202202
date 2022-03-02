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
CREATE PROCEDURE ��oP�Z�Ĥ��t���� 
	-- Add the parameters for the stored procedure here
	@�~�� int = 2021
	AS
BEGIN
	
SELECT SUMM.*, SelfMoney.���հt�X�� FROM 
(SELECT PT.���, '���' AS ����,ISNULL([2],0) AS '��޳��p�e', ISNULL([3],0) AS '�Ш|���p�e', ISNULL([4],0) AS '���s�Ш|'
, ISNULL([5],0) AS '�޳N�����', ISNULL([6],0) AS '��L�p�e' 
FROM
(
SELECT [PPS_Research_TYPE_�{�C����].[�{�C���OID],TD.cName AS ���, 
CAST(SUM(A.iUnitPercent)AS FLOAT)/10000 AS �Z�Ĥ��t��

FROM dbo.PPS_Research_TABLE_Main AS M 
INNER JOIN dbo.PPS_Research_TYPE_PlanType AS TP ON M.cMap2PlanType = TP.cIndex 
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=M.[cMap2PlanType] 
AND [PPS_Research_TYPE_�{�C����].[�{�C���OID] = 2
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
WHERE  YEAR(M.[dPlanStartDate]) =@�~�� 
GROUP BY [PPS_Research_TYPE_�{�C����].[�{�C���OID], TD.cName

UNION

SELECT [PPS_Research_TYPE_�{�C����].[�{�C���OID],TD.cName AS ���, 
CAST(SUM(A.iUnitPercent)AS FLOAT)/10000 AS �Z�Ĥ��t��

FROM dbo.PPS_Research_TABLE_Main AS M 
INNER JOIN dbo.PPS_Research_TYPE_PlanType AS TP ON M.cMap2PlanType = TP.cIndex 
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=M.[cMap2PlanType] 
AND [PPS_Research_TYPE_�{�C����].[�{�C���OID] = 3
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
WHERE  YEAR(M.[dPlanStartDate]) =@�~�� 
GROUP BY [PPS_Research_TYPE_�{�C����].[�{�C���OID], TD.cName


UNION

SELECT [PPS_Research_TYPE_�{�C����].[�{�C���OID],TD.cName AS ���, 
CAST(SUM(A.iUnitPercent)AS FLOAT)/10000 AS �Z�Ĥ��t��

FROM dbo.PPS_Research_TABLE_Main AS M 
INNER JOIN dbo.PPS_Research_TYPE_PlanType AS TP ON M.cMap2PlanType = TP.cIndex 
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=M.[cMap2PlanType] 
AND [PPS_Research_TYPE_�{�C����].[�{�C���OID] = 4
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
WHERE  YEAR(M.[dPlanStartDate]) =@�~�� 
GROUP BY [PPS_Research_TYPE_�{�C����].[�{�C���OID], TD.cName


UNION

SELECT [PPS_Research_TYPE_�{�C����].[�{�C���OID],TD.cName AS ���, 
CAST(SUM(A.iUnitPercent)AS FLOAT)/10000 AS �Z�Ĥ��t��

FROM dbo.PPS_Research_TABLE_Main AS M 
INNER JOIN dbo.PPS_Research_TYPE_PlanType AS TP ON M.cMap2PlanType = TP.cIndex 
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=M.[cMap2PlanType] 
AND [PPS_Research_TYPE_�{�C����].[�{�C���OID] = 5
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
WHERE  YEAR(M.[dPlanStartDate]) =@�~�� 
GROUP BY [PPS_Research_TYPE_�{�C����].[�{�C���OID], TD.cName

UNION

SELECT [PPS_Research_TYPE_�{�C����].[�{�C���OID],TD.cName AS ���, 
CAST(SUM(A.iUnitPercent)AS FLOAT)/10000 AS �Z�Ĥ��t��

FROM dbo.PPS_Research_TABLE_Main AS M 
INNER JOIN dbo.PPS_Research_TYPE_PlanType AS TP ON M.cMap2PlanType = TP.cIndex 
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=M.[cMap2PlanType] 
AND [PPS_Research_TYPE_�{�C����].[�{�C���OID] = 6
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
WHERE  YEAR(M.[dPlanStartDate]) =@�~�� 
GROUP BY [PPS_Research_TYPE_�{�C����].[�{�C���OID], TD.cName
) t
PIVOT(SUM(�Z�Ĥ��t��)
FOR [�{�C���OID] in([2],[3],[4],[5],[6])
) AS PT

UNION

SELECT PT.���,  '���B' AS ����,ISNULL([2],0) AS '��޳��p�e', ISNULL([3],0) AS '�Ш|���p�e', ISNULL([4],0) AS '���s�Ш|', ISNULL([5],0) AS '�޳N�����', ISNULL([6],0) AS '��L�p�e'  FROM
(
SELECT [PPS_Research_TYPE_�{�C����].[�{�C���OID],TD.cName AS ���, 
SUM(A.iUnitPercentMoney) AS �Z�Ĥ��t���B
FROM dbo.PPS_Research_TABLE_Main AS M 
INNER JOIN dbo.PPS_Research_TYPE_PlanType AS TP ON M.cMap2PlanType = TP.cIndex 
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=M.[cMap2PlanType] 
AND [PPS_Research_TYPE_�{�C����].[�{�C���OID] = 2
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
WHERE  YEAR(M.[dPlanStartDate]) =@�~�� 
GROUP BY [PPS_Research_TYPE_�{�C����].[�{�C���OID], TD.cName

UNION

SELECT [PPS_Research_TYPE_�{�C����].[�{�C���OID],TD.cName AS ���, 
SUM(A.iUnitPercentMoney) AS �Z�Ĥ��t���B
FROM dbo.PPS_Research_TABLE_Main AS M 
INNER JOIN dbo.PPS_Research_TYPE_PlanType AS TP ON M.cMap2PlanType = TP.cIndex 
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=M.[cMap2PlanType] 
AND [PPS_Research_TYPE_�{�C����].[�{�C���OID] = 3
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
WHERE  YEAR(M.[dPlanStartDate]) =@�~�� 
GROUP BY [PPS_Research_TYPE_�{�C����].[�{�C���OID], TD.cName


UNION

SELECT [PPS_Research_TYPE_�{�C����].[�{�C���OID],TD.cName AS ���, 
SUM(A.iUnitPercentMoney) AS �Z�Ĥ��t���B
FROM dbo.PPS_Research_TABLE_Main AS M 
INNER JOIN dbo.PPS_Research_TYPE_PlanType AS TP ON M.cMap2PlanType = TP.cIndex 
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=M.[cMap2PlanType] 
AND [PPS_Research_TYPE_�{�C����].[�{�C���OID] = 4
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
WHERE  YEAR(M.[dPlanStartDate]) =@�~�� 
GROUP BY [PPS_Research_TYPE_�{�C����].[�{�C���OID], TD.cName


UNION

SELECT [PPS_Research_TYPE_�{�C����].[�{�C���OID],TD.cName AS ���, 
SUM(A.iUnitPercentMoney) AS �Z�Ĥ��t���B
FROM dbo.PPS_Research_TABLE_Main AS M 
INNER JOIN dbo.PPS_Research_TYPE_PlanType AS TP ON M.cMap2PlanType = TP.cIndex 
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=M.[cMap2PlanType] 
AND [PPS_Research_TYPE_�{�C����].[�{�C���OID] = 5
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
WHERE  YEAR(M.[dPlanStartDate]) =@�~�� 
GROUP BY [PPS_Research_TYPE_�{�C����].[�{�C���OID], TD.cName

UNION

SELECT [PPS_Research_TYPE_�{�C����].[�{�C���OID],TD.cName AS ���, 
SUM(A.iUnitPercentMoney) AS �Z�Ĥ��t���B
FROM dbo.PPS_Research_TABLE_Main AS M 
INNER JOIN dbo.PPS_Research_TYPE_PlanType AS TP ON M.cMap2PlanType = TP.cIndex 
INNER JOIN [dbo].[PPS_Research_TYPE_�{�C����] ON [�{�CMap2PlanTypeIndex]=M.[cMap2PlanType] 
AND [PPS_Research_TYPE_�{�C����].[�{�C���OID] = 6
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
WHERE  YEAR(M.[dPlanStartDate]) =@�~�� 
GROUP BY [PPS_Research_TYPE_�{�C����].[�{�C���OID], TD.cName
) t
PIVOT(
SUM(�Z�Ĥ��t���B)
FOR [�{�C���OID] in([2],[3],[4],[5],[6])
) AS PT
)AS SUMM
LEFT JOIN 
(
/* ���հt�X�� */
SELECT  TD.cName AS ���
,SUM(M.iMyselfMoney*(CAST(A.iUnitPercent AS FLOAT)/10000))AS ���հt�X��
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

WHERE YEAR([dPlanStartDate]) =@�~�� 
GROUP BY  TD.cName
) AS SelfMoney ON SUMM.���=SelfMoney.���

END
GO

