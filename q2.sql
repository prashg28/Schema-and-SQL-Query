SELECT USER_FIRST_NAME, USER_LAST_NAME, TOTAL VILLA_OWNED
FROM WEB_USER,
  (SELECT VILLA_OWNER_ID, COUNT(VILLA_ID) AS TOTAL
      FROM WEB_VILLA
      GROUP BY VILLA_OWNER_ID
      ) OWNER_COUNT
WHERE USER_ID = OWNER_COUNT.VILLA_OWNER_ID
ORDER BY TOTAL
;