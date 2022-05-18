CREATE VIEW [dbo].[View_績效分配明細]
AS
  SELECT SUMM.*,
         SelfMoney.本校配合款
  FROM   (SELECT 年度,
                 pt.單位,
                 '件數'       AS 項目,
                 Isnull([2], 0) AS '科技部計畫',
                 Isnull([3], 0) AS '教育部計畫',
                 Isnull([4], 0) AS '推廣教育',
                 Isnull([5], 0) AS '技術移轉案',
                 Isnull([6], 0) AS '其他計畫'
          FROM   (SELECT Year(M.[dplanstartdate])                  AS 年度,
                         [pps_research_type_認列項目].[認列類別id],
                         TD.cname                                  AS 單位,
                         Cast(Sum(A.iunitpercent)AS FLOAT) / 10000 AS
                         績效分配比
                  FROM   dbo.pps_research_table_main AS M
                         INNER JOIN dbo.pps_research_type_plantype AS TP
                                 ON M.cmap2plantype = TP.cindex
                         INNER JOIN [dbo].[pps_research_type_認列項目]
                                 ON
                         [認列map2plantypeindex] = M.[cmap2plantype]
                         AND
  [pps_research_type_認列項目].[認列類別id]
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
                            [pps_research_type_認列項目].[認列類別id],
                            TD.cname
                  UNION
                  SELECT Year(M.[dplanstartdate])                  AS 年度,
                         [pps_research_type_認列項目].[認列類別id],
                         TD.cname                                  AS 單位,
                         Cast(Sum(A.iunitpercent)AS FLOAT) / 10000 AS
                         績效分配比
                  FROM   dbo.pps_research_table_main AS M
                         INNER JOIN dbo.pps_research_type_plantype AS TP
                                 ON M.cmap2plantype = TP.cindex
                         INNER JOIN [dbo].[pps_research_type_認列項目]
                                 ON
                         [認列map2plantypeindex] = M.[cmap2plantype]
                         AND
  [pps_research_type_認列項目].[認列類別id]
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
                            [pps_research_type_認列項目].[認列類別id],
                            TD.cname
                  UNION
                  SELECT Year(M.[dplanstartdate])                  AS 年度,
                         [pps_research_type_認列項目].[認列類別id],
                         TD.cname                                  AS 單位,
                         Cast(Sum(A.iunitpercent)AS FLOAT) / 10000 AS
                         績效分配比
                  FROM   dbo.pps_research_table_main AS M
                         INNER JOIN dbo.pps_research_type_plantype AS TP
                                 ON M.cmap2plantype = TP.cindex
                         INNER JOIN [dbo].[pps_research_type_認列項目]
                                 ON
                         [認列map2plantypeindex] = M.[cmap2plantype]
                         AND
  [pps_research_type_認列項目].[認列類別id]
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
                            [pps_research_type_認列項目].[認列類別id],
                            TD.cname
                  UNION
                  SELECT Year(M.[dplanstartdate])                  AS 年度,
                         [pps_research_type_認列項目].[認列類別id],
                         TD.cname                                  AS 單位,
                         Cast(Sum(A.iunitpercent)AS FLOAT) / 10000 AS
                         績效分配比
                  FROM   dbo.pps_research_table_main AS M
                         INNER JOIN dbo.pps_research_type_plantype AS TP
                                 ON M.cmap2plantype = TP.cindex
                         INNER JOIN [dbo].[pps_research_type_認列項目]
                                 ON
                         [認列map2plantypeindex] = M.[cmap2plantype]
                         AND
  [pps_research_type_認列項目].[認列類別id]
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
                            [pps_research_type_認列項目].[認列類別id],
                            TD.cname
                  UNION
                  SELECT Year(M.[dplanstartdate])                  AS 年度,
                         [pps_research_type_認列項目].[認列類別id],
                         TD.cname                                  AS 單位,
                         Cast(Sum(A.iunitpercent)AS FLOAT) / 10000 AS
                         績效分配比
                  FROM   dbo.pps_research_table_main AS M
                         INNER JOIN dbo.pps_research_type_plantype AS TP
                                 ON M.cmap2plantype = TP.cindex
                         INNER JOIN [dbo].[pps_research_type_認列項目]
                                 ON
                         [認列map2plantypeindex] = M.[cmap2plantype]
                         AND
  [pps_research_type_認列項目].[認列類別id]
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
                            [pps_research_type_認列項目].[認列類別id],
                            TD.cname) t
                 PIVOT(Sum(績效分配比)
                      FOR [認列類別id] IN([2],
                                              [3],
                                              [4],
                                              [5],
                                              [6]) ) AS pt
          UNION
          SELECT 年度,
                 pt.單位,
                 '金額'       AS 項目,
                 Isnull([2], 0) AS '科技部計畫',
                 Isnull([3], 0) AS '教育部計畫',
                 Isnull([4], 0) AS '推廣教育',
                 Isnull([5], 0) AS '技術移轉案',
                 Isnull([6], 0) AS '其他計畫'
          FROM   (SELECT Year(M.[dplanstartdate]) AS 年度,
                         [pps_research_type_認列項目].[認列類別id],
                         TD.cname                 AS 單位,
                         Sum(A.iunitpercentmoney) AS 績效分配金額
                  FROM   dbo.pps_research_table_main AS M
                         INNER JOIN dbo.pps_research_type_plantype AS TP
                                 ON M.cmap2plantype = TP.cindex
                         INNER JOIN [dbo].[pps_research_type_認列項目]
                                 ON
                         [認列map2plantypeindex] = M.[cmap2plantype]
                         AND
  [pps_research_type_認列項目].[認列類別id]
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
                            [pps_research_type_認列項目].[認列類別id],
                            TD.cname
                  UNION
                  SELECT Year(M.[dplanstartdate]) AS 年度,
                         [pps_research_type_認列項目].[認列類別id],
                         TD.cname                 AS 單位,
                         Sum(A.iunitpercentmoney) AS 績效分配金額
                  FROM   dbo.pps_research_table_main AS M
                         INNER JOIN dbo.pps_research_type_plantype AS TP
                                 ON M.cmap2plantype = TP.cindex
                         INNER JOIN [dbo].[pps_research_type_認列項目]
                                 ON
                         [認列map2plantypeindex] = M.[cmap2plantype]
                         AND
  [pps_research_type_認列項目].[認列類別id]
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
                            [pps_research_type_認列項目].[認列類別id],
                            TD.cname
                  UNION
                  SELECT Year(M.[dplanstartdate]) AS 年度,
                         [pps_research_type_認列項目].[認列類別id],
                         TD.cname                 AS 單位,
                         Sum(A.iunitpercentmoney) AS 績效分配金額
                  FROM   dbo.pps_research_table_main AS M
                         INNER JOIN dbo.pps_research_type_plantype AS TP
                                 ON M.cmap2plantype = TP.cindex
                         INNER JOIN [dbo].[pps_research_type_認列項目]
                                 ON
                         [認列map2plantypeindex] = M.[cmap2plantype]
                         AND
  [pps_research_type_認列項目].[認列類別id]
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
                            [pps_research_type_認列項目].[認列類別id],
                            TD.cname
                  UNION
                  SELECT Year(M.[dplanstartdate]) AS 年度,
                         [pps_research_type_認列項目].[認列類別id],
                         TD.cname                 AS 單位,
                         Sum(A.iunitpercentmoney) AS 績效分配金額
                  FROM   dbo.pps_research_table_main AS M
                         INNER JOIN dbo.pps_research_type_plantype AS TP
                                 ON M.cmap2plantype = TP.cindex
                         INNER JOIN [dbo].[pps_research_type_認列項目]
                                 ON
                         [認列map2plantypeindex] = M.[cmap2plantype]
                         AND
  [pps_research_type_認列項目].[認列類別id]
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
                            [pps_research_type_認列項目].[認列類別id],
                            TD.cname
                  UNION
                  SELECT Year(M.[dplanstartdate]) AS 年度,
                         [pps_research_type_認列項目].[認列類別id],
                         TD.cname                 AS 單位,
                         Sum(A.iunitpercentmoney) AS 績效分配金額
                  FROM   dbo.pps_research_table_main AS M
                         INNER JOIN dbo.pps_research_type_plantype AS TP
                                 ON M.cmap2plantype = TP.cindex
                         INNER JOIN [dbo].[pps_research_type_認列項目]
                                 ON
                         [認列map2plantypeindex] = M.[cmap2plantype]
                         AND
  [pps_research_type_認列項目].[認列類別id]
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
                            [pps_research_type_認列項目].[認列類別id],
                            TD.cname) t
                 PIVOT( Sum(績效分配金額)
                      FOR [認列類別id] IN([2],
                                              [3],
                                              [4],
                                              [5],
                                              [6]) ) AS pt)AS SUMM
         LEFT JOIN (
                   /* 本校配合款 */
                   SELECT TD.cname
                          AS 單位,
                          Sum(M.imyselfmoney * ( Cast(A.iunitpercent AS FLOAT) /
                                                 10000 ))
                          AS
                          本校配合款
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
                    --WHERE YEAR([dPlanStartDate]) =@年度 
                    GROUP  BY TD.cname) AS SelfMoney
                ON SUMM.單位 = SelfMoney.單位 