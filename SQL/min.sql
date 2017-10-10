SELECT t.earliest,
       ucma.*,
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
FROM e_user_course_module_access AS ucma
INNER JOIN
    (SELECT username,
            courseid,
            min(logtime) AS earliest
     FROM e_user_course_module_access
     WHERE moduleidnumber LIKE '%SSP'
         AND ("modulename" || ' - ' || "action") IN ('assign - submit for grading',
                                                     'forum - add post',
                                                     'forum - update post',
                                                     'glossary - add entry',
                                                     'glossary - update entry',
                                                     'lesson - end',
                                                     'quiz - attempt')
         AND "email" LIKE '%@student.gotafe.vic.edu.au'
         AND substr("username", 1, 1) IN ('0',
                                          '1',
                                          '2',
                                          '3',
                                          '4',
                                          '5',
                                          '6',
                                          '7',
                                          '8',
                                          '9')
     GROUP BY courseid,
              username) AS t ON ucma.username = t.username
AND ucma.courseid = t.courseid
AND ucma.logtime = t.earliest
WHERE ("modulename" || ' - ' || "action") IN ('assign - submit for grading',
                                              'forum - add post',
                                              'forum - update post',
                                              'glossary - add entry',
                                              'glossary - update entry',
                                              'lesson - end',
                                              'quiz - attempt')