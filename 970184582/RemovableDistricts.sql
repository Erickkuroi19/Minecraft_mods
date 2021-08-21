--Author: original concept by TC. Rewrite by qqqbbb. Edited again by TC.

INSERT INTO Types ( Type, Kind )
 SELECT 'PROJECT_REMOVE_'||DistrictType, 'KIND_PROJECT' 
-- FROM Districts WHERE RequiresPlacement = 1 AND MaxPerPlayer = -1.0 AND OnePerCity = 1;
FROM Districts WHERE RequiresPlacement = 1 AND MaxPerPlayer = -1.0;


INSERT INTO Projects (
    ProjectType,
    Name,
    ShortName,
    Description,
    Cost,
    CostProgressionModel,
    CostProgressionParam1,
    PrereqDistrict )
SELECT 	
	'PROJECT_REMOVE_'||DistrictType,
	CASE WHEN instr(Name, 'LOC_') = 0 THEN 'Remove '||Name ELSE 'LOC_PROJECT_REMOVE'||substr(Name, 4) END,
	CASE WHEN instr(Name, 'LOC_') = 0 THEN 'Remove '||Name ELSE 'LOC_PROJECT_REMOVE'||substr(Name, 4) END,
    'Removes the district with all its buildings.',
    27,
    'COST_PROGRESSION_NUM_UNDER_AVG_PLUS_TECH',
    20,
    DistrictType
-- FROM Districts WHERE RequiresPlacement = 1 AND MaxPerPlayer = -1.0 AND OnePerCity = 1;
FROM Districts WHERE RequiresPlacement = 1 AND MaxPerPlayer = -1.0;

CREATE TABLE "RD_civType_uniqueDistrictType" (
		"CivType" TEXT NOT NULL,
		"ReplacedDistrictType" TEXT NOT NULL,
		"UniqueDistrictType" TEXT NOT NULL);

INSERT INTO RD_civType_uniqueDistrictType ( CivType, ReplacedDistrictType, UniqueDistrictType )
 SELECT a.CivilizationType, c.ReplacesDistrictType, b.DistrictType FROM CivilizationTraits AS a, Districts AS b, DistrictReplaces AS c WHERE a.TraitType = b.TraitType AND c.CivUniqueDistrictType = b.DistrictType ;

--We do this so multiple remove projects don't show up when you have a unique district replacement
DELETE FROM Projects
WHERE (Projects.PrereqDistrict IN (SELECT RD_civType_uniqueDistrictType.UniqueDistrictType FROM RD_civType_uniqueDistrictType) AND Projects.ProjectType LIKE 'PROJECT_REMOVE_%');