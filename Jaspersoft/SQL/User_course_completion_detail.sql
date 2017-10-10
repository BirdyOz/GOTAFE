SELECT c.category1 ,
       c.category2 ,
       c.category3 ,
       c.category4 ,
       c.category5 ,
       c.category6 ,
       uccd.c1id ,
       uccd.c2id ,
       uccd.userid ,
       uccd.username ,
       uccd.useridnumber ,
       uccd.firstname ,
       uccd.lastname ,
       uccd.email ,
       uccd.courseid ,
       uccd.courseshortname ,
       uccd.coursefullname ,
       uccd.courseidnumber ,
       uccd.criteriaid ,
       uccd.finalgrade ,
       uccd.finalgradescale ,
       uccd.unenroled ,
       uccd.timecompleted ,
       uccd.criteriatype ,
       uccd.moduleid ,
       uccd.module ,
       uccd.cmid ,
       uccd.moduleidnumber ,
       uccd.moduleinstance ,
       uccd.courseinstance ,
       uccd.enrolperiod ,
       uccd.timeend ,
       uccd.gradepass ,
       uccd.rolename ,
       uccd.roleshortname ,
       uccd.roledescription ,
       uccd.rolearchetype ,
       (CASE
            WHEN strpos(uccd.moduleidnumber,'_')>0 THEN split_part(uccd.moduleidnumber,'_',1)
            ELSE ''
        END) AS unit ,
       (CASE
            WHEN strpos(uccd.moduleidnumber,'_')>1 THEN split_part(uccd.moduleidnumber,'_',2)
            ELSE ''
        END) AS VERSION ,
       (CASE
            WHEN strpos(uccd.moduleidnumber,'_')>2 THEN split_part(uccd.moduleidnumber,'_',3)
            ELSE ''
        END) AS attempt ,
       (CASE
            WHEN strpos(uccd.moduleidnumber,'_')>4 THEN split_part(uccd.moduleidnumber,'_',5)
            ELSE ''
        END) AS assessment
FROM e_user_course_completion_detail uccd
JOIN e_course c ON c.id=uccd.courseid
WHERE strpos(uccd.moduleidnumber,'_')>0