CREATE VIEW [dbo].[View_�Z�Ĥ��t����]
AS
  SELECT SUMM.*,
         SelfMoney.���հt�X��
  FROM   (SELECT �~��,
                 pt.���,
                 '���'       AS ����,
                 Isnull([2], 0) AS '��޳��p�e',
                 Isnull([3], 0) AS '�Ш|���p�e',
                 Isnull([4], 0) AS '���s�Ш|',
                 Isnull([5], 0) AS '�޳N�����',
                 Isnull([6], 0) AS '��L�p�e'
          FROM   (SELECT Year(M.[dplanstartdate])                  AS �~��,
                         [pps_research_type_�{�C����].[�{�C���Oid],
                         TD.cname                                  AS ���,
                         Cast(Sum(A.iunitpercent)AS FLOAT) / 10000 AS
                         �Z�Ĥ��t��
                  FROM   dbo.pps_research_table_main AS M
                         INNER JOIN dbo.pps_research_type_plantype AS TP
                                 ON M.cmap2plantype = TP.cindex
                         INNER JOIN [dbo].[pps_research_type_�{�C����]
                                 ON
                         [�{�Cmap2plantypeindex] = M.[cmap2plantype]
                         AND
  [pps_research_type_�{�C����].[�{�C���Oid]
  = 2
                         INNER JOIN (
                         SELECT A.imap2main,
                                A.chcode,
                                M.cplandepartmentmap2department AS
                                cPlanDepartmentIndex,
                                a.bismaster,
                                A.iunitpercent,
                                A.iunitpercentmoney
                         FROM   dbo.pps_research_table_achievementpeople AS A
                                INNER JOIN dbo.pps_research_table_main AS M
                                        ON A.imap2main = M.iautoindex
                                           AND A.bismaster = 1
                         UNION
                         SELECT A.imap2main,
                                A.chcode,
                                C.cunitinside AS cPlanDepartmentIndex,
                                a.bismaster,
                                A.iunitpercent,
                                A.iunitpercentmoney
                         FROM   dbo.pps_research_table_achievementpeople AS A
                                INNER JOIN dbo.pps_research_table_comaster AS
                                           C
                                        ON A.imap2main = C.imap2main
                                           AND A.bismaster = 0
                                           AND A.chcode = C.chcodeinside
                                           AND A.cunit = C.cunitinside)AS A
                                 ON M.iautoindex = A.imap2main
                                    AND M.bplanmoneyintoschool = 1
                                    AND M.bplanstatecheck = 1
                         INNER JOIN dbo.pps_research_type_department AS TD
                                 ON A.cplandepartmentindex = TD.cindex
                  GROUP  BY Year(M.[dplanstartdate]),
                            [pps_research_type_�{�C����].[�{�C���Oid],
                            TD.cname
                  UNION
                  SELECT Year(M.[dplanstartdate])                  AS �~��,
                         [pps_research_type_�{�C����].[�{�C���Oid],
                         TD.cname                                  AS ���,
                         Cast(Sum(A.iunitpercent)AS FLOAT) / 10000 AS
                         �Z�Ĥ��t��
                  FROM   dbo.pps_research_table_main AS M
                         INNER JOIN dbo.pps_research_type_plantype AS TP
                                 ON M.cmap2plantype = TP.cindex
                         INNER JOIN [dbo].[pps_research_type_�{�C����]
                                 ON
                         [�{�Cmap2plantypeindex] = M.[cmap2plantype]
                         AND
  [pps_research_type_�{�C����].[�{�C���Oid]
  = 3
                         INNER JOIN (
                         SELECT A.imap2main,
                                A.chcode,
                                M.cplandepartmentmap2department AS
                                cPlanDepartmentIndex,
                                a.bismaster,
                                A.iunitpercent,
                                A.iunitpercentmoney
                         FROM   dbo.pps_research_table_achievementpeople AS A
                                INNER JOIN dbo.pps_research_table_main AS M
                                        ON A.imap2main = M.iautoindex
                                           AND A.bismaster = 1
                         UNION
                         SELECT A.imap2main,
                                A.chcode,
                                C.cunitinside AS cPlanDepartmentIndex,
                                a.bismaster,
                                A.iunitpercent,
                                A.iunitpercentmoney
                         FROM   dbo.pps_research_table_achievementpeople AS A
                                INNER JOIN dbo.pps_research_table_comaster AS
                                           C
                                        ON A.imap2main = C.imap2main
                                           AND A.bismaster = 0
                                           AND A.chcode = C.chcodeinside
                                           AND A.cunit = C.cunitinside)AS A
                                 ON M.iautoindex = A.imap2main
                                    AND M.bplanmoneyintoschool = 1
                                    AND M.bplanstatecheck = 1
                         INNER JOIN dbo.pps_research_type_department AS TD
                                 ON A.cplandepartmentindex = TD.cindex
                  GROUP  BY Year(M.[dplanstartdate]),
                            [pps_research_type_�{�C����].[�{�C���Oid],
                            TD.cname
                  UNION
                  SELECT Year(M.[dplanstartdate])                  AS �~��,
                         [pps_research_type_�{�C����].[�{�C���Oid],
                         TD.cname                                  AS ���,
                         Cast(Sum(A.iunitpercent)AS FLOAT) / 10000 AS
                         �Z�Ĥ��t��
                  FROM   dbo.pps_research_table_main AS M
                         INNER JOIN dbo.pps_research_type_plantype AS TP
                                 ON M.cmap2plantype = TP.cindex
                         INNER JOIN [dbo].[pps_research_type_�{�C����]
                                 ON
                         [�{�Cmap2plantypeindex] = M.[cmap2plantype]
                         AND
  [pps_research_type_�{�C����].[�{�C���Oid]
  = 4
                         INNER JOIN (
                         SELECT A.imap2main,
                                A.chcode,
                                M.cplandepartmentmap2department AS
                                cPlanDepartmentIndex,
                                a.bismaster,
                                A.iunitpercent,
                                A.iunitpercentmoney
                         FROM   dbo.pps_research_table_achievementpeople AS A
                                INNER JOIN dbo.pps_research_table_main AS M
                                        ON A.imap2main = M.iautoindex
                                           AND A.bismaster = 1
                         UNION
                         SELECT A.imap2main,
                                A.chcode,
                                C.cunitinside AS cPlanDepartmentIndex,
                                a.bismaster,
                                A.iunitpercent,
                                A.iunitpercentmoney
                         FROM   dbo.pps_research_table_achievementpeople AS A
                                INNER JOIN dbo.pps_research_table_comaster AS
                                           C
                                        ON A.imap2main = C.imap2main
                                           AND A.bismaster = 0
                                           AND A.chcode = C.chcodeinside
                                           AND A.cunit = C.cunitinside)AS A
                                 ON M.iautoindex = A.imap2main
                                    AND M.bplanmoneyintoschool = 1
                                    AND M.bplanstatecheck = 1
                         INNER JOIN dbo.pps_research_type_department AS TD
                                 ON A.cplandepartmentindex = TD.cindex
                  GROUP  BY Year(M.[dplanstartdate]),
                            [pps_research_type_�{�C����].[�{�C���Oid],
                            TD.cname
                  UNION
                  SELECT Year(M.[dplanstartdate])                  AS �~��,
                         [pps_research_type_�{�C����].[�{�C���Oid],
                         TD.cname                                  AS ���,
                         Cast(Sum(A.iunitpercent)AS FLOAT) / 10000 AS
                         �Z�Ĥ��t��
                  FROM   dbo.pps_research_table_main AS M
                         INNER JOIN dbo.pps_research_type_plantype AS TP
                                 ON M.cmap2plantype = TP.cindex
                         INNER JOIN [dbo].[pps_research_type_�{�C����]
                                 ON
                         [�{�Cmap2plantypeindex] = M.[cmap2plantype]
                         AND
  [pps_research_type_�{�C����].[�{�C���Oid]
  = 5
                         INNER JOIN (
                         SELECT A.imap2main,
                                A.chcode,
                                M.cplandepartmentmap2department AS
                                cPlanDepartmentIndex,
                                a.bismaster,
                                A.iunitpercent,
                                A.iunitpercentmoney
                         FROM   dbo.pps_research_table_achievementpeople AS A
                                INNER JOIN dbo.pps_research_table_main AS M
                                        ON A.imap2main = M.iautoindex
                                           AND A.bismaster = 1
                         UNION
                         SELECT A.imap2main,
                                A.chcode,
                                C.cunitinside AS cPlanDepartmentIndex,
                                a.bismaster,
                                A.iunitpercent,
                                A.iunitpercentmoney
                         FROM   dbo.pps_research_table_achievementpeople AS A
                                INNER JOIN dbo.pps_research_table_comaster AS
                                           C
                                        ON A.imap2main = C.imap2main
                                           AND A.bismaster = 0
                                           AND A.chcode = C.chcodeinside
                                           AND A.cunit = C.cunitinside)AS A
                                 ON M.iautoindex = A.imap2main
                                    AND M.bplanmoneyintoschool = 1
                                    AND M.bplanstatecheck = 1
                         INNER JOIN dbo.pps_research_type_department AS TD
                                 ON A.cplandepartmentindex = TD.cindex
                  GROUP  BY Year(M.[dplanstartdate]),
                            [pps_research_type_�{�C����].[�{�C���Oid],
                            TD.cname
                  UNION
                  SELECT Year(M.[dplanstartdate])                  AS �~��,
                         [pps_research_type_�{�C����].[�{�C���Oid],
                         TD.cname                                  AS ���,
                         Cast(Sum(A.iunitpercent)AS FLOAT) / 10000 AS
                         �Z�Ĥ��t��
                  FROM   dbo.pps_research_table_main AS M
                         INNER JOIN dbo.pps_research_type_plantype AS TP
                                 ON M.cmap2plantype = TP.cindex
                         INNER JOIN [dbo].[pps_research_type_�{�C����]
                                 ON
                         [�{�Cmap2plantypeindex] = M.[cmap2plantype]
                         AND
  [pps_research_type_�{�C����].[�{�C���Oid]
  = 6
                         INNER JOIN (
                         SELECT A.imap2main,
                                A.chcode,
                                M.cplandepartmentmap2department AS
                                cPlanDepartmentIndex,
                                a.bismaster,
                                A.iunitpercent,
                                A.iunitpercentmoney
                         FROM   dbo.pps_research_table_achievementpeople AS A
                                INNER JOIN dbo.pps_research_table_main AS M
                                        ON A.imap2main = M.iautoindex
                                           AND A.bismaster = 1
                         UNION
                         SELECT A.imap2main,
                                A.chcode,
                                C.cunitinside AS cPlanDepartmentIndex,
                                a.bismaster,
                                A.iunitpercent,
                                A.iunitpercentmoney
                         FROM   dbo.pps_research_table_achievementpeople AS A
                                INNER JOIN dbo.pps_research_table_comaster AS
                                           C
                                        ON A.imap2main = C.imap2main
                                           AND A.bismaster = 0
                                           AND A.chcode = C.chcodeinside
                                           AND A.cunit = C.cunitinside)AS A
                                 ON M.iautoindex = A.imap2main
                                    AND M.bplanmoneyintoschool = 1
                                    AND M.bplanstatecheck = 1
                         INNER JOIN dbo.pps_research_type_department AS TD
                                 ON A.cplandepartmentindex = TD.cindex
                  GROUP  BY Year(M.[dplanstartdate]),
                            [pps_research_type_�{�C����].[�{�C���Oid],
                            TD.cname) t
                 PIVOT(Sum(�Z�Ĥ��t��)
                      FOR [�{�C���Oid] IN([2],
                                              [3],
                                              [4],
                                              [5],
                                              [6]) ) AS pt
          UNION
          SELECT �~��,
                 pt.���,
                 '���B'       AS ����,
                 Isnull([2], 0) AS '��޳��p�e',
                 Isnull([3], 0) AS '�Ш|���p�e',
                 Isnull([4], 0) AS '���s�Ш|',
                 Isnull([5], 0) AS '�޳N�����',
                 Isnull([6], 0) AS '��L�p�e'
          FROM   (SELECT Year(M.[dplanstartdate]) AS �~��,
                         [pps_research_type_�{�C����].[�{�C���Oid],
                         TD.cname                 AS ���,
                         Sum(A.iunitpercentmoney) AS �Z�Ĥ��t���B
                  FROM   dbo.pps_research_table_main AS M
                         INNER JOIN dbo.pps_research_type_plantype AS TP
                                 ON M.cmap2plantype = TP.cindex
                         INNER JOIN [dbo].[pps_research_type_�{�C����]
                                 ON
                         [�{�Cmap2plantypeindex] = M.[cmap2plantype]
                         AND
  [pps_research_type_�{�C����].[�{�C���Oid]
  = 2
                         INNER JOIN (
                         SELECT A.imap2main,
                                A.chcode,
                                M.cplandepartmentmap2department AS
                                cPlanDepartmentIndex,
                                a.bismaster,
                                A.iunitpercent,
                                A.iunitpercentmoney
                         FROM   dbo.pps_research_table_achievementpeople AS A
                                INNER JOIN dbo.pps_research_table_main AS M
                                        ON A.imap2main = M.iautoindex
                                           AND A.bismaster = 1
                         UNION
                         SELECT A.imap2main,
                                A.chcode,
                                C.cunitinside AS cPlanDepartmentIndex,
                                a.bismaster,
                                A.iunitpercent,
                                A.iunitpercentmoney
                         FROM   dbo.pps_research_table_achievementpeople AS A
                                INNER JOIN dbo.pps_research_table_comaster AS
                                           C
                                        ON A.imap2main = C.imap2main
                                           AND A.bismaster = 0
                                           AND A.chcode = C.chcodeinside
                                           AND A.cunit = C.cunitinside)AS A
                                 ON M.iautoindex = A.imap2main
                                    AND M.bplanmoneyintoschool = 1
                                    AND M.bplanstatecheck = 1
                         INNER JOIN dbo.pps_research_type_department AS TD
                                 ON A.cplandepartmentindex = TD.cindex
                  GROUP  BY Year(M.[dplanstartdate]),
                            [pps_research_type_�{�C����].[�{�C���Oid],
                            TD.cname
                  UNION
                  SELECT Year(M.[dplanstartdate]) AS �~��,
                         [pps_research_type_�{�C����].[�{�C���Oid],
                         TD.cname                 AS ���,
                         Sum(A.iunitpercentmoney) AS �Z�Ĥ��t���B
                  FROM   dbo.pps_research_table_main AS M
                         INNER JOIN dbo.pps_research_type_plantype AS TP
                                 ON M.cmap2plantype = TP.cindex
                         INNER JOIN [dbo].[pps_research_type_�{�C����]
                                 ON
                         [�{�Cmap2plantypeindex] = M.[cmap2plantype]
                         AND
  [pps_research_type_�{�C����].[�{�C���Oid]
  = 3
                         INNER JOIN (
                         SELECT A.imap2main,
                                A.chcode,
                                M.cplandepartmentmap2department AS
                                cPlanDepartmentIndex,
                                a.bismaster,
                                A.iunitpercent,
                                A.iunitpercentmoney
                         FROM   dbo.pps_research_table_achievementpeople AS A
                                INNER JOIN dbo.pps_research_table_main AS M
                                        ON A.imap2main = M.iautoindex
                                           AND A.bismaster = 1
                         UNION
                         SELECT A.imap2main,
                                A.chcode,
                                C.cunitinside AS cPlanDepartmentIndex,
                                a.bismaster,
                                A.iunitpercent,
                                A.iunitpercentmoney
                         FROM   dbo.pps_research_table_achievementpeople AS A
                                INNER JOIN dbo.pps_research_table_comaster AS
                                           C
                                        ON A.imap2main = C.imap2main
                                           AND A.bismaster = 0
                                           AND A.chcode = C.chcodeinside
                                           AND A.cunit = C.cunitinside)AS A
                                 ON M.iautoindex = A.imap2main
                                    AND M.bplanmoneyintoschool = 1
                                    AND M.bplanstatecheck = 1
                         INNER JOIN dbo.pps_research_type_department AS TD
                                 ON A.cplandepartmentindex = TD.cindex
                  GROUP  BY Year(M.[dplanstartdate]),
                            [pps_research_type_�{�C����].[�{�C���Oid],
                            TD.cname
                  UNION
                  SELECT Year(M.[dplanstartdate]) AS �~��,
                         [pps_research_type_�{�C����].[�{�C���Oid],
                         TD.cname                 AS ���,
                         Sum(A.iunitpercentmoney) AS �Z�Ĥ��t���B
                  FROM   dbo.pps_research_table_main AS M
                         INNER JOIN dbo.pps_research_type_plantype AS TP
                                 ON M.cmap2plantype = TP.cindex
                         INNER JOIN [dbo].[pps_research_type_�{�C����]
                                 ON
                         [�{�Cmap2plantypeindex] = M.[cmap2plantype]
                         AND
  [pps_research_type_�{�C����].[�{�C���Oid]
  = 4
                         INNER JOIN (
                         SELECT A.imap2main,
                                A.chcode,
                                M.cplandepartmentmap2department AS
                                cPlanDepartmentIndex,
                                a.bismaster,
                                A.iunitpercent,
                                A.iunitpercentmoney
                         FROM   dbo.pps_research_table_achievementpeople AS A
                                INNER JOIN dbo.pps_research_table_main AS M
                                        ON A.imap2main = M.iautoindex
                                           AND A.bismaster = 1
                         UNION
                         SELECT A.imap2main,
                                A.chcode,
                                C.cunitinside AS cPlanDepartmentIndex,
                                a.bismaster,
                                A.iunitpercent,
                                A.iunitpercentmoney
                         FROM   dbo.pps_research_table_achievementpeople AS A
                                INNER JOIN dbo.pps_research_table_comaster AS
                                           C
                                        ON A.imap2main = C.imap2main
                                           AND A.bismaster = 0
                                           AND A.chcode = C.chcodeinside
                                           AND A.cunit = C.cunitinside)AS A
                                 ON M.iautoindex = A.imap2main
                                    AND M.bplanmoneyintoschool = 1
                                    AND M.bplanstatecheck = 1
                         INNER JOIN dbo.pps_research_type_department AS TD
                                 ON A.cplandepartmentindex = TD.cindex
                  GROUP  BY Year(M.[dplanstartdate]),
                            [pps_research_type_�{�C����].[�{�C���Oid],
                            TD.cname
                  UNION
                  SELECT Year(M.[dplanstartdate]) AS �~��,
                         [pps_research_type_�{�C����].[�{�C���Oid],
                         TD.cname                 AS ���,
                         Sum(A.iunitpercentmoney) AS �Z�Ĥ��t���B
                  FROM   dbo.pps_research_table_main AS M
                         INNER JOIN dbo.pps_research_type_plantype AS TP
                                 ON M.cmap2plantype = TP.cindex
                         INNER JOIN [dbo].[pps_research_type_�{�C����]
                                 ON
                         [�{�Cmap2plantypeindex] = M.[cmap2plantype]
                         AND
  [pps_research_type_�{�C����].[�{�C���Oid]
  = 5
                         INNER JOIN (
                         SELECT A.imap2main,
                                A.chcode,
                                M.cplandepartmentmap2department AS
                                cPlanDepartmentIndex,
                                a.bismaster,
                                A.iunitpercent,
                                A.iunitpercentmoney
                         FROM   dbo.pps_research_table_achievementpeople AS A
                                INNER JOIN dbo.pps_research_table_main AS M
                                        ON A.imap2main = M.iautoindex
                                           AND A.bismaster = 1
                         UNION
                         SELECT A.imap2main,
                                A.chcode,
                                C.cunitinside AS cPlanDepartmentIndex,
                                a.bismaster,
                                A.iunitpercent,
                                A.iunitpercentmoney
                         FROM   dbo.pps_research_table_achievementpeople AS A
                                INNER JOIN dbo.pps_research_table_comaster AS
                                           C
                                        ON A.imap2main = C.imap2main
                                           AND A.bismaster = 0
                                           AND A.chcode = C.chcodeinside
                                           AND A.cunit = C.cunitinside)AS A
                                 ON M.iautoindex = A.imap2main
                                    AND M.bplanmoneyintoschool = 1
                                    AND M.bplanstatecheck = 1
                         INNER JOIN dbo.pps_research_type_department AS TD
                                 ON A.cplandepartmentindex = TD.cindex
                  GROUP  BY Year(M.[dplanstartdate]),
                            [pps_research_type_�{�C����].[�{�C���Oid],
                            TD.cname
                  UNION
                  SELECT Year(M.[dplanstartdate]) AS �~��,
                         [pps_research_type_�{�C����].[�{�C���Oid],
                         TD.cname                 AS ���,
                         Sum(A.iunitpercentmoney) AS �Z�Ĥ��t���B
                  FROM   dbo.pps_research_table_main AS M
                         INNER JOIN dbo.pps_research_type_plantype AS TP
                                 ON M.cmap2plantype = TP.cindex
                         INNER JOIN [dbo].[pps_research_type_�{�C����]
                                 ON
                         [�{�Cmap2plantypeindex] = M.[cmap2plantype]
                         AND
  [pps_research_type_�{�C����].[�{�C���Oid]
  = 6
                         INNER JOIN (
                         SELECT A.imap2main,
                                A.chcode,
                                M.cplandepartmentmap2department AS
                                cPlanDepartmentIndex,
                                a.bismaster,
                                A.iunitpercent,
                                A.iunitpercentmoney
                         FROM   dbo.pps_research_table_achievementpeople AS A
                                INNER JOIN dbo.pps_research_table_main AS M
                                        ON A.imap2main = M.iautoindex
                                           AND A.bismaster = 1
                         UNION
                         SELECT A.imap2main,
                                A.chcode,
                                C.cunitinside AS cPlanDepartmentIndex,
                                a.bismaster,
                                A.iunitpercent,
                                A.iunitpercentmoney
                         FROM   dbo.pps_research_table_achievementpeople AS A
                                INNER JOIN dbo.pps_research_table_comaster AS
                                           C
                                        ON A.imap2main = C.imap2main
                                           AND A.bismaster = 0
                                           AND A.chcode = C.chcodeinside
                                           AND A.cunit = C.cunitinside)AS A
                                 ON M.iautoindex = A.imap2main
                                    AND M.bplanmoneyintoschool = 1
                                    AND M.bplanstatecheck = 1
                         INNER JOIN dbo.pps_research_type_department AS TD
                                 ON A.cplandepartmentindex = TD.cindex
                  GROUP  BY Year(M.[dplanstartdate]),
                            [pps_research_type_�{�C����].[�{�C���Oid],
                            TD.cname) t
                 PIVOT( Sum(�Z�Ĥ��t���B)
                      FOR [�{�C���Oid] IN([2],
                                              [3],
                                              [4],
                                              [5],
                                              [6]) ) AS pt)AS SUMM
         LEFT JOIN (
                   /* ���հt�X�� */
                   SELECT TD.cname
                          AS ���,
                          Sum(M.imyselfmoney * ( Cast(A.iunitpercent AS FLOAT) /
                                                 10000 ))
                          AS
                          ���հt�X��
                    FROM   [pps_research_table_main] AS M
                           INNER JOIN (
                           SELECT A.imap2main,
                                  A.chcode,
                                  M.cplandepartmentmap2department AS
                                  cPlanDepartmentIndex,
                                  a.bismaster,
                                  A.iunitpercent
                           FROM   dbo.pps_research_table_achievementpeople AS
                                  A
                                  INNER JOIN dbo.pps_research_table_main AS M
                                          ON A.imap2main = M.iautoindex
                                             AND A.bismaster = 1
                           UNION
                           SELECT A.imap2main,
                                  A.chcode,
                                  C.cunitinside AS cPlanDepartmentIndex,
                                  a.bismaster,
                                  A.iunitpercent
                           FROM   dbo.pps_research_table_achievementpeople AS
                                  A
                                  INNER JOIN dbo.pps_research_table_comaster
                                             AS C
                                          ON A.imap2main = C.imap2main
                                             AND A.bismaster = 0
                                             AND A.chcode = C.chcodeinside
                                             AND A.cunit = C.cunitinside)AS A
                                   ON M.iautoindex = A.imap2main
                                      AND M.bplanmoneyintoschool = 1
                                      AND M.bplanstatecheck = 1
                           INNER JOIN dbo.pps_research_type_department AS TD
                                   ON A.cplandepartmentindex = TD.cindex
                    --WHERE YEAR([dPlanStartDate]) =@�~�� 
                    GROUP  BY TD.cname) AS SelfMoney
                ON SUMM.��� = SelfMoney.��� 