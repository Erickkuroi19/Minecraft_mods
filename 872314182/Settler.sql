-- Settler
-- Author: Angryr
-- DateCreated: 2/25/2017 5:12:55 PM
--------------------------------------------------------------
-- <Row UnitType="UNIT_SETTLER" BaseMoves="2" Cost="80" AdvisorType="ADVISOR_GENERIC" BaseSightRange="3" ZoneOfControl="false" Domain="DOMAIN_LAND" FormationClass="FORMATION_CLASS_CIVILIAN" FoundCity="true" PopulationCost="1" PrereqPopulation="2" Name="LOC_UNIT_SETTLER_NAME" Description="LOC_UNIT_SETTLER_DESCRIPTION" CanCapture="False" CostProgressionModel="COST_PROGRESSION_PREVIOUS_COPIES" CostProgressionParam1="20" PurchaseYield="YIELD_GOLD" PseudoYieldType="PSEUDOYIELD_UNIT_SETTLER"/>
--------------------------------------------------------------



--
-- SETTLER: +3 Movement, +2 Sight
--
UPDATE Units
SET BaseMoves = 5,
	BaseSightRange = 5,
	Cost = 90
WHERE UnitType = 'UNIT_SETTLER'