--============================================================
--LUXURY RESOURCES
--============================================================
INSERT INTO Resource_YieldChanges 
		(ResourceType,			YieldType,			YieldChange)
VALUES	('RESOURCE_COFFEE',		'YIELD_PRODUCTION',	1),
		('RESOURCE_DYES',		'YIELD_GOLD',		1),
		('RESOURCE_INCENSE',	'YIELD_CULTURE',	1),
		('RESOURCE_JADE',		'YIELD_FAITH',		1),
		('RESOURCE_MARBLE',		'YIELD_PRODUCTION',	1),
		('RESOURCE_MERCURY',	'YIELD_CULTURE',	1),
		('RESOURCE_PEARLS',		'YIELD_CULTURE',	1),
		('RESOURCE_SILK',		'YIELD_GOLD',		1),
		('RESOURCE_TEA',		'YIELD_CULTURE',	1),
		('RESOURCE_TOBACCO',	'YIELD_CULTURE',	1);

INSERT INTO Resource_YieldChanges (ResourceType, YieldType, YieldChange) SELECT 'RESOURCE_AMBER', 'YIELD_SCIENCE', '1' FROM Resources WHERE ResourceType='RESOURCE_AMBER' ;
INSERT INTO Resource_YieldChanges (ResourceType, YieldType, YieldChange) SELECT 'RESOURCE_TURTLES', 'YIELD_FAITH', '1' FROM Resources WHERE ResourceType='RESOURCE_TURTLES' ;
INSERT INTO Resource_YieldChanges (ResourceType, YieldType, YieldChange) SELECT 'RESOURCE_SUK_OBSIDIAN', 'YIELD_PRODUCTION', '1' FROM Resources WHERE ResourceType='RESOURCE_SUK_OBSIDIAN' ;
INSERT INTO Resource_YieldChanges (ResourceType, YieldType, YieldChange) SELECT 'RESOURCE_P0K_PENGUINS', 'YIELD_GOLD', '1' FROM Resources WHERE ResourceType='RESOURCE_P0K_PENGUINS' ;
INSERT INTO Resource_YieldChanges (ResourceType, YieldType, YieldChange) SELECT 'RESOURCE_P0K_PAPYRUS', 'YIELD_FAITH', '1' FROM Resources WHERE ResourceType='RESOURCE_P0K_PAPYRUS' ;
--============================================================
--STRATEGIC RESOURCES
--============================================================
INSERT INTO Resource_YieldChanges 
		(ResourceType,			YieldType,			YieldChange)
VALUES	('RESOURCE_ALUMINUM',	'YIELD_PRODUCTION',	1),
		('RESOURCE_IRON',		'YIELD_PRODUCTION',	1);
