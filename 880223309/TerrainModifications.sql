--===================================
-- SQL by p0kiehl
--===================================	
-- Feature_AdjacentYields
-------------------------------------	
--Oasis now improves surrounding tiles.
INSERT INTO Feature_AdjacentYields 
		(FeatureType,		YieldType,		YieldChange) 
VALUES	('FEATURE_OASIS',	'YIELD_FOOD',	1),
		('FEATURE_OASIS',	'YIELD_GOLD',	1);
-------------------------------------
-- Feature_YieldChanges
-------------------------------------
--Oasis now has +1 production and +2 gold.
INSERT INTO Feature_YieldChanges 
		(FeatureType,		YieldType,			YieldChange) 
VALUES	('FEATURE_OASIS',	'YIELD_PRODUCTION', 1);

INSERT OR REPLACE INTO Feature_YieldChanges
		(FeatureType,					YieldType,		YieldChange)
SELECT	'FEATURE_EYE_OF_THE_SAHARA',	'YIELD_FOOD',	1 FROM Features WHERE FeatureType='FEATURE_EYE_OF_THE_SAHARA';

INSERT OR REPLACE INTO Feature_YieldChanges
		(FeatureType,					YieldType,		YieldChange)
SELECT	'FEATURE_WHITEDESERT',			'YIELD_FOOD',	1 FROM Features WHERE FeatureType='FEATURE_WHITEDESERT';

UPDATE Feature_YieldChanges SET YieldChange = 2 WHERE FeatureType='FEATURE_OASIS' AND YieldType='YIELD_GOLD';

UPDATE Feature_YieldChanges SET YieldChange = 2 WHERE FeatureType='FEATURE_OASIS' AND YieldType='YIELD_FOOD'; -- to balance out that deserts now yield +1 food alone
-------------------------------------
-- Improvement_ValidTerrains
-------------------------------------
INSERT INTO Improvement_ValidTerrains 
		(ImprovementType,		TerrainType,			PrereqTech, PrereqCivic) 
VALUES	('IMPROVEMENT_FARM',	'TERRAIN_TUNDRA',		NULL,		NULL),
		('IMPROVEMENT_FARM',	'TERRAIN_TUNDRA_HILLS',	NULL,		'CIVIC_CIVIL_ENGINEERING');
-------------------------------------
-- Terrain_YieldChanges
-------------------------------------
INSERT INTO Terrain_YieldChanges 
		(TerrainType,				YieldType,		YieldChange) 
VALUES	('TERRAIN_DESERT',			'YIELD_FOOD',	1),
		('TERRAIN_DESERT_HILLS',	'YIELD_FOOD',	1),
		('TERRAIN_SNOW',			'YIELD_FOOD',	1),
		('TERRAIN_SNOW_HILLS',		'YIELD_FOOD',	1);