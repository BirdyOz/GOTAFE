SELECT count(*) AS "CountAll",
       count("courseid") AS "CountAll_courseid",
       Max("userlastaccess") AS "Max_userlastaccess",
       Min("userfirstaccess") AS "Min_userfirstaccess",
       Sum("courseid") AS "Sum_courseid",
       "coursefullname"
FROM "public"."e_user_course_access"
WHERE "category1" = '2017 Courses'
  AND (("userfirstaccess" IS NOT NULL))
  AND "rolearchetype" = 'student'
  AND "email" ILIKE '%@student%'
  AND substr("email", 1, 1) IN ('0',
                                '1',
                                '2',
                                '9')
GROUP BY "coursefullname"
ORDER BY "coursefullname" LIMIT 400001