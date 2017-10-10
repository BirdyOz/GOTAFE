SELECT uca.category1 ,
       uca.category2 ,
       uca.category3 ,
       uca.category4 ,
       uca.category5 ,
       uca.category6 ,
       uca.courseid ,
       uca.courseshortname ,
       uca.coursefullname ,
       uca.coursevisible ,
       uca.courseformat ,
       uca.rolearchetype ,
       sum(CASE WHEN uca.userlastaccess IS NULL THEN 0 ELSE 1 END) AS totalactiveusers ,
       count(uca.userid) AS totalusers
FROM e_user_course_access uca
WHERE uca.userlastaccess BETWEEN '2016-01-01' AND '2016-12-31'
GROUP BY uca.category1 ,
         uca.category2 ,
         uca.category3 ,
         uca.category4 ,
         uca.category5 ,
         uca.category6 ,
         uca.courseid ,
         uca.courseshortname ,
         uca.coursefullname ,
         uca.coursevisible ,
         uca.courseformat ,
         uca.rolearchetype