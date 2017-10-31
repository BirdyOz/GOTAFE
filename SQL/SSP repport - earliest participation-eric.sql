SELECT ("firstname" || ' ' || "lastname") as "concatenate_firstname_z_lastname",
       "cmid",
       "courseid",
       "email",
       "firstname",
       "lastname",
       "moduleidnumber",
       "modulename",
       "roleenrolled",
       "unit",
       "username",
       "version",
	   min(logtime) as logtime,
	   array_to_string(array_agg("action"), ',') as actions
FROM
    (SELECT ucma.category1,
            ucma.category2,
            ucma.category3,
            ucma.category4,
            ucma.category5,
            ucma.category6,
            ucma.logtime,
            ucma.loginfo,
            ucma.action,
            ucma.userid,
            ucma.username,
            ucma.firstname,
            ucma.lastname,
            ucma.email,
            ucma.rolearchetype,
            ucma.courseid,
            ucma.courseshortname,
            ucma.coursefullname,
            ucma.moduleid,
            ucma.modulename,
            ucma.moduleidnumber,
            ucma.cmid,
            ucma.itemname,
            ucma.topicnumber,
            ucma.roleenrolled,
            (CASE
                 WHEN strpos(ucma.moduleidnumber,'_')>0 THEN split_part(ucma.moduleidnumber,'_',1)
                 ELSE ''
             END) AS unit,
            (CASE
                 WHEN strpos(ucma.moduleidnumber,'_')>1 THEN split_part(ucma.moduleidnumber,'_',2)
                 ELSE ''
             END) AS VERSION,
            (CASE
                 WHEN strpos(ucma.moduleidnumber,'_')>2 THEN split_part(ucma.moduleidnumber,'_',3)
                 ELSE ''
             END) AS attempt,
            (CASE
                 WHEN strpos(ucma.moduleidnumber,'_')>4 THEN split_part(ucma.moduleidnumber,'_',5)
                 ELSE ''
             END) AS assessment
     FROM e_user_course_module_access ucma
     GROUP BY ucma.category1,
              ucma.category2,
              ucma.category3,
              ucma.category4,
              ucma.category5,
              ucma.category6,
			  ucma.logtime,
              ucma.loginfo,
              ucma.action,
              ucma.userid,
              ucma.username,
              ucma.firstname,
              ucma.lastname,
              ucma.email,
              ucma.rolearchetype,
              ucma.courseid,
              ucma.courseshortname,
              ucma.coursefullname,
              ucma.moduleid,
              ucma.modulename,
              ucma.moduleidnumber,
              ucma.cmid,
              ucma.itemname,
              ucma.topicnumber,
              ucma.roleenrolled, (CASE
                                      WHEN strpos(ucma.moduleidnumber,'_')>0 THEN split_part(ucma.moduleidnumber,'_',1)
                                      ELSE ''
                                  END) , (CASE
                                              WHEN strpos(ucma.moduleidnumber,'_')>1 THEN split_part(ucma.moduleidnumber,'_',2)
                                              ELSE ''
                                          END) , (CASE
                                                      WHEN strpos(ucma.moduleidnumber,'_')>2 THEN split_part(ucma.moduleidnumber,'_',3)
                                                      ELSE ''
                                                  END) , (CASE
                                                              WHEN strpos(ucma.moduleidnumber,'_')>4 THEN split_part(ucma.moduleidnumber,'_',5)
                                                              ELSE ''
                                                          END)) "query"
WHERE ("logtime" BETWEEN '2017-01-01 00:00:00' AND '2017-12-31 23:59:59')
    AND "moduleidnumber" LIKE '%_SSP'
    AND ("modulename" || ' - ' || "action") IN ('assign - submit for grading',
                                                'forum - add post',
                                                'glossary - add entry',
                                                'glossary - update entry',
                                                'lesson - end',
                                                'quiz - attempt',
                                                'forum - update post')
    AND "email" LIKE '%@student.gotafe.vic.edu.au'
    AND substr("username", 1, 1) IN ('0',
                                     '1',
                                     '2',
                                     '3',
                                     '5',
                                     '8',
                                     '9')
    AND ("roleenrolled" != 0
         OR "roleenrolled" IS NULL)
    AND "unit" = 'ACMVET405A'

GROUP BY
("firstname" || ' ' || "lastname"),
       "cmid",
       "courseid",
       "email",
       "firstname",
       "lastname",
       "moduleidnumber",
       "modulename",
       "roleenrolled",
       "unit",
       "username",
       "version"
ORDER BY "unit",
         "concatenate_firstname_z_lastname"

LIMIT 400001
;