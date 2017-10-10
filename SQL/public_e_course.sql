SELECT c.id,
       ccategories.category1,
       ccategories.category2,
       ccategories.category3,
       ccategories.category4,
       ccategories.category5,
       ccategories.category6,
       c.fullname,
       c.shortname,
       c.idnumber,
       c.summary,
       format,
       showgrades,
       newsitems,
       to_timestamp(startdate) AS startdate,
       marker,
       maxbytes,
       showreports,
       visible,
       groupmode,
       groupmodeforce,
       defaultgroupingid,
       lang,
       theme,
       to_timestamp(timecreated) AS timecreated,
       to_timestamp(timemodified) AS timemodified,
       requested,
       enablecompletion,
       legacyfiles,
       summaryformat,
       completionnotify,
       visibleold,
       calendartype,
       cacherev,
       (CASE
            WHEN e.total::integer>0 THEN e.total
            ELSE 0
        END) AS totalstudents,
       (CASE
            WHEN a.total::integer>0 THEN a.total
            ELSE 0
        END) AS totalactivestudents_7days,
       round(cast((a.total/e.total::float)*100::float AS numeric),
             2) AS percentage_7days,
       (CASE
            WHEN b.total::integer>0 THEN b.total
            ELSE 0
        END) AS totalactivestudents_1day,
       (CASE
            WHEN d.total::integer>0 THEN d.total
            ELSE 0
        END) AS totalactivestudents_30days,
       (CASE
            WHEN f.total::integer>0 THEN f.total
            ELSE 0
        END) AS totalactivestudents_thisyear
FROM mdl_course c
LEFT JOIN
    ( SELECT uce.courseid ,
             count(DISTINCT uce.userid) AS total
     FROM e_user_course_enrolments uce
     WHERE uce.rolearchetype LIKE '%student%'
     GROUP BY uce.courseid)AS e ON e.courseid=c.id
AND e.total>=0
LEFT JOIN
    ( SELECT uca.courseid ,
             count(DISTINCT uca.userid) AS total
     FROM e_user_course_access uca
     JOIN e_user_course_enrolments uce1 ON uce1.userid=uca.userid
     AND uce1.courseid=uca.courseid
     AND uce1.rolearchetype LIKE '%student%'
     WHERE uca.userlastaccess > now()::date - 7
     GROUP BY uca.courseid) AS a ON a.courseid=c.id
AND a.total>=0
LEFT JOIN
    ( SELECT uca.courseid ,
             count(DISTINCT uca.userid) AS total
     FROM e_user_course_access uca
     JOIN e_user_course_enrolments uce1 ON uce1.userid=uca.userid
     AND uce1.courseid=uca.courseid
     AND uce1.rolearchetype LIKE '%student%'
     WHERE uca.userlastaccess > now()::date - 1
     GROUP BY uca.courseid) AS b ON b.courseid=c.id
AND b.total>=0
LEFT JOIN
    ( SELECT uca.courseid ,
             count(DISTINCT uca.userid) AS total
     FROM e_user_course_access uca
     JOIN e_user_course_enrolments uce1 ON uce1.userid=uca.userid
     AND uce1.courseid=uca.courseid
     AND uce1.rolearchetype LIKE '%student%'
     WHERE uca.userlastaccess > now()::date - 30
     GROUP BY uca.courseid) AS d ON d.courseid=c.id
AND d.total>=0
LEFT JOIN
    ( SELECT uca.courseid ,
             count(DISTINCT uca.userid) AS total
     FROM e_user_course_access uca
     JOIN e_user_course_enrolments uce1 ON uce1.userid=uca.userid
     AND uce1.courseid=uca.courseid
     AND uce1.rolearchetype LIKE '%student%'
     WHERE date_part('year', uca.userlastaccess) = date_part('year', CURRENT_DATE)
     GROUP BY uca.courseid) AS f ON f.courseid=c.id
AND f.total>=0
JOIN
    (SELECT ccourse.id AS id,
            ccat1.name AS category1,
            ccat2.name AS category2,
            ccat3.name AS category3,
            ccat4.name AS category4,
            ccat5.name AS category5,
            ccat6.name AS category6
     FROM mdl_course_categories AS ccat
     JOIN mdl_course AS ccourse ON ccourse.category=ccat.id
     LEFT OUTER JOIN mdl_course_categories AS ccat1 ON Nullif(Split_part(ccat.path, '/', 2), '') :: INTEGER = ccat1.id
     LEFT OUTER JOIN mdl_course_categories AS ccat2 ON Nullif(Split_part(ccat.path, '/', 3), '') :: INTEGER = ccat2.id
     LEFT OUTER JOIN mdl_course_categories AS ccat3 ON Nullif(Split_part(ccat.path, '/', 4), '') :: INTEGER = ccat3.id
     LEFT OUTER JOIN mdl_course_categories AS ccat4 ON Nullif(Split_part(ccat.path, '/', 5), '') :: INTEGER = ccat4.id
     LEFT OUTER JOIN mdl_course_categories AS ccat5 ON Nullif(Split_part(ccat.path, '/', 6), '') :: INTEGER = ccat5.id
     LEFT OUTER JOIN mdl_course_categories AS ccat6 ON Nullif(Split_part(ccat.path, '/', 7), '') :: INTEGER = ccat6.id) AS ccategories ON ccategories.id=c.id

