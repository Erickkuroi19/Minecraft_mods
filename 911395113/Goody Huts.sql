
----------------------------------------------------------------------

-- Goody Hut subtype weighting. For now, leave as equal weighting.
-- These are the default values. All categories will appear with equal frequency.

--UPDATE GoodyHuts
	--SET Weight = 100 WHERE GoodyHutType = 'GOODYHUT_CULTURE';
--UPDATE GoodyHuts
	--SET Weight = 100 WHERE GoodyHutType = 'GOODYHUT_DIPLOMACY';
--UPDATE GoodyHuts
	--SET Weight = 100 WHERE GoodyHutType = 'GOODYHUT_FAITH';
--UPDATE GoodyHuts
	--SET Weight = 100 WHERE GoodyHutType = 'GOODYHUT_GOLD';
--UPDATE GoodyHuts
	--SET Weight = 100 WHERE GoodyHutType = 'GOODYHUT_MILITARY';
--UPDATE GoodyHuts
	--SET Weight = 100 WHERE GoodyHutType = 'GOODYHUT_SCIENCE';
--UPDATE GoodyHuts
	--SET Weight = 100 WHERE GoodyHutType = 'GOODYHUT_SURVIVORS';

----------------------------------------------------------------------

-- Double the experience granted for activating a Goody Hut
-- NOTE: Only explorer type units (like Scouts) get experience

UPDATE GlobalParameters
	SET Value = 10 WHERE Name = 'EXPERIENCE_ACTIVATE_GOODY_HUT';

----------------------------------------------------------------------

-- Double the frequency of Goody Huts appearing on map. Default was 1 hut per 128 tiles.

UPDATE Improvements
	SET TilesPerGoody = 64, GoodyRange = 2 WHERE ImprovementType = 'IMPROVEMENT_GOODY_HUT';

----------------------------------------------------------------------

-- Allow most Goody Huts to be found from start of game
-- Alter weighting (i.e. frequency each type appears within each category)

-- CULTURE REWARDS
UPDATE GoodyHutSubTypes
	SET Weight = 20, Turn = 0 WHERE SubTypeGoodyHut = 'GOODYHUT_ONE_RELIC';
UPDATE GoodyHutSubTypes
	SET Weight = 30, Turn = 0 WHERE SubTypeGoodyHut = 'GOODYHUT_TWO_CIVIC_BOOSTS';
UPDATE GoodyHutSubTypes
	SET Weight = 50, Turn = 0 WHERE SubTypeGoodyHut = 'GOODYHUT_ONE_CIVIC_BOOST';

-- GOLD REWARDS
UPDATE GoodyHutSubTypes
	SET Weight = 20, Turn = 0, MinOneCity = 0 WHERE SubTypeGoodyHut = 'GOODYHUT_LARGE_GOLD';
UPDATE GoodyHutSubTypes
	SET Weight = 30, Turn = 0, MinOneCity = 0 WHERE SubTypeGoodyHut = 'GOODYHUT_MEDIUM_GOLD';
UPDATE GoodyHutSubTypes
	SET Weight = 50, Turn = 0, MinOneCity = 0 WHERE SubTypeGoodyHut = 'GOODYHUT_SMALL_GOLD';
	
-- FAITH REWARDS
UPDATE GoodyHutSubTypes
	SET Weight = 20, Turn = 0, MinOneCity = 0 WHERE SubTypeGoodyHut = 'GOODYHUT_LARGE_FAITH';
UPDATE GoodyHutSubTypes
	SET Weight = 30, Turn = 0, MinOneCity = 0 WHERE SubTypeGoodyHut = 'GOODYHUT_MEDIUM_FAITH';
UPDATE GoodyHutSubTypes
	SET Weight = 50, Turn = 0, MinOneCity = 0 WHERE SubTypeGoodyHut = 'GOODYHUT_SMALL_FAITH';

-- MILITARY REWARDS

UPDATE GoodyHutSubTypes
	SET Weight = 30 WHERE SubTypeGoodyHut = 'GOODYHUT_GRANT_SCOUT';
--UPDATE GoodyHutSubTypes
    --SET Weight = 0, Turn = 00 WHERE SubTypeGoodyHut = 'GOODYHUT_GRANT_UPGRADE'; -- DISABLED by Firaxes (crashes program when granted).
UPDATE GoodyHutSubTypes
	SET Weight = 50 WHERE SubTypeGoodyHut = 'GOODYHUT_GRANT_EXPERIENCE';
UPDATE GoodyHutSubTypes
	SET Weight = 0 WHERE SubTypeGoodyHut = 'GOODYHUT_HEAL'; -- Reduce weighting to 0 so that healing is never granted

-- SCIENCE REWARDS
UPDATE GoodyHutSubTypes
	SET Weight = 20, Turn = 0 WHERE SubTypeGoodyHut = 'GOODYHUT_ONE_TECH';
UPDATE GoodyHutSubTypes
	SET Weight = 30, Turn = 0 WHERE SubTypeGoodyHut = 'GOODYHUT_TWO_TECH_BOOSTS';
UPDATE GoodyHutSubTypes
	SET Weight = 50, Turn = 0 WHERE SubTypeGoodyHut = 'GOODYHUT_ONE_TECH_BOOST';

-- SURVIVORS REWARDS
UPDATE GoodyHutSubTypes
	SET Weight = 20, Turn = 0 WHERE SubTypeGoodyHut = 'GOODYHUT_ADD_POP';
UPDATE GoodyHutSubTypes
	SET Weight = 30, Turn = 0, Trader = 0 WHERE SubTypeGoodyHut = 'GOODYHUT_GRANT_TRADER'; -- Can now find Trader before having one
UPDATE GoodyHutSubTypes
	SET Weight = 50, Turn = 0 WHERE SubTypeGoodyHut = 'GOODYHUT_GRANT_BUILDER';
UPDATE GoodyHutSubTypes
	SET Weight = 0, Turn = 0 WHERE SubTypeGoodyHut = 'GOODYHUT_GRANT_SETTLER'; -- Ensure weighting is 0 so that Settlers do not appear (default)
--DELETE FROM GoodyHutSubTypes WHERE SubTypeGoodyHut = 'GOODYHUT_GRANT_SETTLER';

-- DIPLOMACY REWARDS
UPDATE GoodyHutSubTypes
	SET Weight = 20 WHERE SubTypeGoodyHut = 'GOODYHUT_GOVERNOR_TITLE';
UPDATE GoodyHutSubTypes
	SET Weight = 30 WHERE SubTypeGoodyHut = 'GOODYHUT_ENVOY';
UPDATE GoodyHutSubTypes
	SET Weight = 50 WHERE SubTypeGoodyHut = 'GOODYHUT_FAVOR';
	
UPDATE GoodyHutSubTypes
	SET Weight = 20 WHERE SubTypeGoodyHut = 'GOODYHUT_RESOURCES';
	
------------------------------------------------------------------------

-- Reduce gold rewards to be consistent with faith rewards (i.e. subract 20)
-- ALso, change medium gold reward to be consistent with scaling of gold and faith (was 75 rather than 80)

UPDATE ModifierArguments
	SET Value = 20 WHERE ModifierID = 'GOODY_GOLD_SMALL_MODIFIER' AND Name = 'Amount';
UPDATE ModifierArguments
	SET Value = 60 WHERE ModifierID = 'GOODY_GOLD_MEDIUM_MODIFIER' AND Name = 'Amount';
UPDATE ModifierArguments
	SET Value = 100 WHERE ModifierID = 'GOODY_GOLD_LARGE_MODIFIER' AND Name = 'Amount';

-- Add guranteed dispersal of 20 gold for every revealed goody hut
-- This brings the gold rewards back up to the previous levels whenever gold is the reward.

UPDATE Improvements
    SET DispersalGold = 20 WHERE ImprovementType = 'IMPROVEMENT_GOODY_HUT';

------------------------------------------------------------------------