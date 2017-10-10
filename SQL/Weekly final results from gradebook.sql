SELECT "category1",
       "coursefullname",
       "courseid",
       "enteredby",
       "feedback",
       "finalgrade",
       "finalgradestr",
       "firstname",
       "gradeitemsidnumber",
       "lastname",
       "timemodified",
       "unit",
       "username"
FROM
    (SELECT g.*,
            u.username AS enteredby,
            (CASE
                 WHEN strpos(g.gradeitemsidnumber,'_')>0 THEN split_part(g.gradeitemsidnumber,'_',1)
                 ELSE ''
             END) AS unit,
            (CASE
                 WHEN strpos(g.gradeitemsidnumber,'_')>1 THEN split_part(g.gradeitemsidnumber,'_',2)
                 ELSE ''
             END) AS VERSION,
            (CASE
                 WHEN strpos(g.gradeitemsidnumber,'_')>2 THEN split_part(g.gradeitemsidnumber,'_',3)
                 ELSE ''
             END) AS attempt,
            (CASE
                 WHEN strpos(g.gradeitemsidnumber,'_')>4 THEN split_part(g.gradeitemsidnumber,'_',5)
                 ELSE ''
             END) AS assessment
     FROM e_grades AS g
     JOIN e_user u ON u.id=g.usermodified) "query"
WHERE "gradeitemsidnumber" LIKE '%_FINAL'
    AND "finalgrade" IS NOT NULL
    AND "category1" = '2017 Courses'
    AND ("timemodified" >= '2017-07-12 00:00:00')
ORDER BY "coursefullname",
         "courseid",
         "unit",
         "lastname",
         "firstname"
LIMIT 400001