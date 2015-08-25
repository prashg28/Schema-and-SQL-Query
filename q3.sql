SELECT USER_FIRST_NAME, USER_LAST_NAME
FROM WEB_USER
WHERE USER_ID
IN  (SELECT RENT_USER_ID 
      FROM WEB_RENT
      WHERE RENT_COUPON_ID IS NOT NULL 
      AND RENT_COUPON_ID IN (SELECT COUPON_ID 
                              FROM WEB_COUPON_ID 
                              WHERE COUPON_DISCOUNT > 10
                              )
      )
;