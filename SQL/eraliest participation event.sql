SELECT ucma.category1,
       ucma.category2,
       ucma.category3,
       ucma.category4,
       ucma.category5,
       ucma.category6,
       ucma.logid,
       ucma.logtime,
       ucma.loginfo,
       ucma.logurl,
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
FROM
  (SELECT courseid,
          cmid,
          username,
          MIN(logtime) AS ml
   FROM e_user_course_module_access
   GROUP BY courseid,
            cmid,
            username) t
JOIN e_user_course_module_access ucma ON t.cmid = ucma.cmid
AND t.ml = ucma.logtime ;