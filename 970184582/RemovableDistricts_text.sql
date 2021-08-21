--Author: qqqbbb

INSERT INTO LocalizedText ( Language, Tag, Text )
 SELECT 'en_US', 'LOC_PROJECT_REMOVE'||substr(Tag, 4), 'Remove '||Text 
FROM LocalizedText WHERE Language = 'en_US' AND Tag LIKE 'LOC_DISTRICT%NAME';