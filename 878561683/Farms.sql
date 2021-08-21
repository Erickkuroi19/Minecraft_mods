-- Farms
-- Author: Angryr
-- DateCreated: 3/6/2017 8:09:42 PM
--------------------------------------------------------------
-- <Row ImprovementType="IMPROVEMENT_FARM" Name="LOC_IMPROVEMENT_FARM_NAME" Description="LOC_IMPROVEMENT_FARM_DESCRIPTION" Icon="ICON_IMPROVEMENT_FARM" PlunderType="PLUNDER_HEAL" PlunderAmount="100" Buildable="true" Housing="1" TilesRequired="2"/>
--------------------------------------------------------------

UPDATE Improvements
SET TilesRequired = 1,
	Housing = 1
WHERE ImprovementType = 'IMPROVEMENT_FARM';