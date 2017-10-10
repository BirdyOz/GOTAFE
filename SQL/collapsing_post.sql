SELECT distinct temp.earliest, temp.courseid, ucma.*
FROM
    (SELECT  distinct username,
            courseid,
            min(logtime) AS earliest
     FROM e_user_course_module_access
     WHERE username = '100194037'
         AND moduleidnumber LIKE '%_SSP'
         AND action like '% post'
     GROUP BY courseid,
              username) TEMP
JOIN e_user_course_module_access ucma ON  ucma.courseid = temp.courseid
AND temp.username = ucma.username AND temp.earliest = ucma.logtime