CREATE VIEW LIKE_COUNT AS
SELECT LIKE_REVIEW_ID, COUNT(*) REVIEW_COUNT
            FROM WEB_LIKE
            GROUP BY LIKE_REVIEW_ID
;

CREATE VIEW VILLA_MAX_REVIEW AS 
SELECT  REVIEW_VILLA_ID VILLA_MAX_REVIEW_ID , MAX(REVIEW_COUNT) MAX_REVIEW_COUNT
      FROM WEB_REVIEW,LIKE_COUNT    
      WHERE LIKE_REVIEW_ID = REVIEW_ID
      GROUP BY REVIEW_VILLA_ID
;
CREATE VIEW MAX_USER_VILLA_REVIEW AS
    SELECT REVIEW_USER_ID
    FROM LIKE_COUNT,VILLA_MAX_REVIEW,WEB_REVIEW
    WHERE REVIEW_ID = LIKE_REVIEW_ID
    AND REVIEW_VILLA_ID = VILLA_MAX_REVIEW_ID
    AND MAX_REVIEW_COUNT = REVIEW_COUNT
;


CREATE VIEW USER_COUNT AS 
SELECT REVIEW_USER_ID, COUNT(*) USER_COUNT_REVIEW
FROM MAX_USER_VILLA_REVIEW
GROUP BY  REVIEW_USER_ID
;

/*
SELECT * FROM LIKE_COUNT;
SELECT * FROM VILLA_MAX_REVIEW;
SELECT * FROM MAX_USER_VILLA_REVIEW;
SELECT * FROM USER_COUNT;
*/
SELECT USER_FIRST_NAME, USER_LAST_NAME 
FROM WEB_USER
WHERE USER_ID IN (SELECT REVIEW_USER_ID
                    FROM USER_COUNT
                    WHERE USER_COUNT_REVIEW IN (SELECT MAX(USER_COUNT_REVIEW) FROM USER_COUNT)
                    )
;

DROP VIEW VILLA_MAX_REVIEW;
DROP VIEW LIKE_COUNT;
DROP VIEW MAX_USER_VILLA_REVIEW;
DROP VIEW USER_COUNT;