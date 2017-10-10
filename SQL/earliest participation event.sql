SELECT ucma.category1,
       ucma.category2,
       ucma.category3,
       ucma.category4,
       ucma.category5,
       ucma.category6,
       min(ucma.logtime) AS logtime,
       to_char( ucma.logtime, 'DD/MM/YYYY') as re_format,
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
                                                     END)