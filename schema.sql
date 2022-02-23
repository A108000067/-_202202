/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
SELECT TOP (1000) [cIndex]
	,[cName]
	,[bState]
	,[cNote]
	,[iSort]
FROM [unit_D_A_RD].[dbo].[PPS_Research_TYPE_PlanType]
WHERE cIndex IN (
		'R'
		,'S'
		)

CREATE TABLE [dbo].[PPS_Research_TYPE_認列類別] (
	[認列類別ID] [int] IDENTITY(1, 1) NOT NULL
	,[認列類別名稱] [nvarchar](20) NOT NULL
	,[是否顯示] [bit] NOT NULL
	)


INSERT INTO [dbo].[PPS_Research_TYPE_認列類別] ([認列類別名稱],[是否顯示])
VALUES ('行政職務計畫案',1)
	,('科技部計畫',1)
	,('教育部計畫',1)
	,('推廣教育',1)
	,('技術移轉案',1)
	,('其他計畫',1)
	,('刪除',0)

CREATE TABLE [dbo].[PPS_Research_TYPE_認列項目] (
	[認列項目ID] [int] IDENTITY(1, 1) NOT NULL
	,[認列類別ID] [int] NOT NULL
	,[認列Map2PlanTypeIndex] [nvarchar](1) NULL
	,[cName] [nvarchar](20) NULL
	)


INSERT INTO [dbo].[PPS_Research_TYPE_認列項目] ([認列類別ID],[認列Map2PlanTypeIndex],[cName])
VALUES (2,'R','政府學術研究計畫')
	,(2,'S','科技部產學案')
	,(3,'Q','教育部產學案')
	,(3,'T','教育部計畫型獎助案')
	,(3,'U','教育部其他案件')
	,(4,'N','推廣教育-自辦班')
	,(4,'V','推廣教育-委訓計畫')
	,(4,'5','交流訓練計畫')
	,(5,'1','技術移轉案(有學校配合款)')
	,(5,'2','技術移轉案(無學校配合款)')
	,(5,'3','公部門計畫衍伸之技術移轉(有學校配合款)')
	,(5,'4','公部門計畫衍伸之技術移轉(無學校配合款)')
	,(6,'A','其他政府產學案')
	,(6,'B','企業產學計畫')
	,(6,'C','特殊專班')
	,(6,'I','其他單位其他案件')
	,(6,'J','經濟部其他案件')
	,(6,'K','企業其他案件')
	,(6,'L','經濟部產學案')
	,(6,'G','基礎環構計畫')
	,(6,'D','策略聯盟案')
	,(6,'O','顧問諮詢案')
	,(6,'H','其他政府其他案件')
	,(6,'F','其他單位產學計畫')
	,(7,'E','捐贈案')
	,(7,'M','校內補助案')
	,(7,'Z','行政職務計畫案')


CREATE TABLE [dbo].[PPS_Research_TYPE_認列執行單位] (
	[認列執行單位ID] [int] IDENTITY(1, 1) NOT NULL
	,[認列執行單位名稱] [nvarchar](20) NOT NULL
	,[是否顯示] [bit] NOT NULL
	)


INSERT INTO [dbo].[PPS_Research_TYPE_認列執行單位] ([認列執行單位名稱])
VALUES ('通識教育中心')
	,('進修推廣處')
	,('刪除')