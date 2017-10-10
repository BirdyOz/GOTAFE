SELECT *,
       (
            WHEN strpos(cm.idnumber,'_')>0 THEN split_part(cm.idnumber,'_',1)
            ELSE ''
        END) AS unit,
       (CASE
            WHEN strpos(cm.idnumber,'_')>1 THEN split_part(cm.idnumber,'_',2)
            ELSE ''
        END) AS VERSION,
       (CASE
            WHEN strpos(cm.idnumber,'_')>2 THEN split_part(cm.idnumber,'_',3)
            ELSE ''
        END) AS attempt,
       (CASE
            WHEN strpos(cm.idnumber,'_')>3 THEN split_part(cm.idnumber,'_',4)
            ELSE ''
        END) AS cid,
       (CASE
            WHEN strpos(cm.idnumber,'_')>4 THEN split_part(cm.idnumber,'_',5)
            ELSE ''
        END) AS assessment
FROM e_course_modules AS cm
WHERE cm.category1 = '2017 Courses'
    AND (cm.idnumber LIKE '%SSP'
         OR cm.idnumber LIKE '%FINAL')
    AND cm.coursefullname LIKE '%2017)'