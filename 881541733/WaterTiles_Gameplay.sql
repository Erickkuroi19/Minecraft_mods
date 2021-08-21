--===================================
-- SQL by p0kiehl
--===================================	
-- Adjacency_YieldChanges
-------------------------------------	
INSERT INTO Adjacency_YieldChanges
		(ID,								Description,	YieldType,			YieldChange,	TilesRequired,	AdjacentTerrain,	PreReqTech)
VALUES	('p0k_CityCenter_Coast_Food',		'Placeholder',	'YIELD_FOOD',		1,				1,				'TERRAIN_COAST',	'TECH_SAILING'),
		('p0k_CityCenter_Coast_Gold',		'Placeholder',	'YIELD_GOLD',		1,				1,				'TERRAIN_COAST',	'TECH_SAILING'),
		('p0k_CityCenter_Coast_Production',	'Placeholder',	'YIELD_PRODUCTION',	1,				1,				'TERRAIN_COAST',	'TECH_SHIPBUILDING');
-------------------------------------
-- Buildings
-------------------------------------
UPDATE Buildings 
SET Housing = '1' 
WHERE BuildingType = 'BUILDING_SHIPYARD' OR BuildingType='BUILDING_SEAPORT';
-------------------------------------
-- Building_YieldChanges
-------------------------------------
INSERT INTO Building_YieldChanges 
		(BuildingType,			YieldType,			YieldChange) 
VALUES	('BUILDING_SEAPORT',	'YIELD_PRODUCTION', 1);

UPDATE Building_YieldChanges 
SET YieldChange='2' 
WHERE BuildingType='BUILDING_SHIPYARD';
-------------------------------------
-- District_Adjacencies
-------------------------------------	
INSERT INTO District_Adjacencies
		(DistrictType,				YieldChangeId)
VALUES	('DISTRICT_CITY_CENTER',	'p0k_CityCenter_Coast_Food'),
		('DISTRICT_CITY_CENTER',	'p0k_CityCenter_Coast_Gold'),
		('DISTRICT_CITY_CENTER',	'p0k_CityCenter_Coast_Production');
-------------------------------------	
-- District_CitizenYieldChanges
-------------------------------------
INSERT INTO District_CitizenYieldChanges
		(DistrictType,		YieldType,			YieldChange)
VALUES	('DISTRICT_HARBOR',	'YIELD_PRODUCTION',	1);

INSERT OR REPLACE INTO District_CitizenYieldChanges
		(DistrictType,							YieldType,			YieldChange)
SELECT	CivUniqueDistrictType,					'YIELD_PRODUCTION',	1			
FROM DistrictReplaces 
WHERE ReplacesDistrictType='DISTRICT_HARBOR';
-------------------------------------	
-- District_CitizenYieldChanges
-------------------------------------
INSERT INTO Building_CitizenYieldChanges
		(BuildingType,			YieldType,		YieldChange)
SELECT	'BUILDING_SEAPORT',	'YIELD_PRODUCTION',	1
WHERE EXISTS
(SELECT * FROM Building_CitizenYieldChanges WHERE BuildingType = 'BUILDING_SEAPORT');
-------------------------------------	
-- RequirementSets
-------------------------------------	
INSERT INTO RequirementSets 
		(RequirementSetId,			RequirementSetType) 
VALUES	('P0K_BCWT_PLOT_HAS_WATER',	'REQUIREMENTSET_TEST_ANY');
-------------------------------------	
-- RequirementSetRequirements
-------------------------------------
INSERT INTO RequirementSetRequirements 
		(RequirementSetId,			RequirementId) 
VALUES	('P0K_BCWT_PLOT_HAS_WATER',	'REQUIRES_TERRAIN_COAST'),
		('P0K_BCWT_PLOT_HAS_WATER',	'REQUIRES_TERRAIN_OCEAN');
-------------------------------------	
-- Modifiers
-------------------------------------
-- Instead of making new modifiers, update the existing ones with new Requirements for efficiency where possible.
UPDATE Modifiers
SET SubjectRequirementSetId = 'PLOT_HAS_COAST_REQUIREMENTS'
WHERE ModifierId = 'SHIPYARD_UNIMPROVED_COAST_PRODUCTION';

UPDATE Modifiers
SET SubjectRequirementSetId = 'P0K_BCWT_PLOT_HAS_WATER'
WHERE ModifierId = 'SEAPORT_COAST_GOLD';

INSERT INTO Modifiers
		(ModifierId,						ModifierType,									SubjectRequirementSetId)
VALUES	('P0K_HARBOR_WATER_FOOD',			'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'P0K_BCWT_PLOT_HAS_WATER'),
		('P0K_SEAPORT_FISHINGBOAT_FOOD',	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'PLOT_HAS_FISHINGBOATS_REQUIREMENTS');
-------------------------------------	
-- ModifierArguments
-------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,						Name,			Value)
VALUES	('P0K_HARBOR_WATER_FOOD',			'YieldType',	'YIELD_FOOD'),
		('P0K_HARBOR_WATER_FOOD',			'Amount',		1),
		('P0K_SEAPORT_FISHINGBOAT_FOOD',	'YieldType',	'YIELD_FOOD'),
		('P0K_SEAPORT_FISHINGBOAT_FOOD',	'Amount',		1);
-------------------------------------	
-- DistrictModifiers
-------------------------------------
INSERT INTO DistrictModifiers 
		(DistrictType,		ModifierId)
VALUES	('DISTRICT_HARBOR',	'P0K_HARBOR_WATER_FOOD');

INSERT OR REPLACE INTO DistrictModifiers
		(DistrictType,				ModifierId)
SELECT	CivUniqueDistrictType,	'P0K_HARBOR_WATER_FOOD' 
FROM DistrictReplaces 
WHERE ReplacesDistrictType='DISTRICT_HARBOR';
-------------------------------------	
-- BuildingModifiers
-------------------------------------
INSERT INTO BuildingModifiers
		(BuildingType,			ModifierId)
VALUES	('BUILDING_SEAPORT',	'P0K_SEAPORT_FISHINGBOAT_FOOD');