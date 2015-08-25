SELECT DISTINCT VILLA_NAME
FROM WEB_VILLA, WEB_VILLA_FEATURE, WEB_FEATURES 
WHERE VILLA_ID = VILLA_FEATURE_VILLA_ID
AND VILLA_FEATURE_ID = FEATURE_ID
AND WEB_FEATURES.FEATURE_NAME = 'Jacuzzi' 
AND NOT (WEB_FEATURES.FEATURE_NAME = 'pets allowed')
;