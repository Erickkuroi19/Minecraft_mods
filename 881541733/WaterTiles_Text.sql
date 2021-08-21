-------------------------------------	
-- LocalizedText
-------------------------------------
-- INSERT INTO LocalizedText
--  		(Tag,					Language,	Text)
-- VALUES	('LOC_P0K_BCWT_MARKER',	'en_US',	'This is dummy text.');

-- Districts
UPDATE LocalizedText 
SET Text='A district for naval activity in your city. Also removes the [ICON_Movement] Movement penalty for embarking and disembarking to and from this tile. +1 [ICON_Food] Food to all water tiles in this city. Must be built on Coast or Lake Terrain adjacent to land.[NEWLINE][NEWLINE]+1 [ICON_TradeRoute] Trade Route capacity, if this city does not yet have a Commercial Hub district.'
WHERE Tag='LOC_DISTRICT_HARBOR_DESCRIPTION' AND Language='en_US';

UPDATE LocalizedText 
SET Text='A district for naval activity in your city. Also removes the [ICON_Movement] Movement penalty for embarking and disembarking to and from this tile. +1 [ICON_Food] Food to all water tiles in this city. Must be built on Coast or Lake Terrain adjacent to land. Cannot be built on Reef.'
WHERE Tag='LOC_DISTRICT_HARBOR_EXPANSION1_DESCRIPTION' AND Language='en_US';

UPDATE LocalizedText 
SET Text='A district unique to England for naval activity in your city. Replaces the Harbor district and cheaper to build. Also removes the [ICON_Movement] Movement penalty for embarking and disembarking to and from this tile. +1 [ICON_Food] Food to all water tiles in this city. Must be built on Coast or Lake Terrain adjacent to land.[NEWLINE][NEWLINE]+1 [ICON_Movement] Movement for all naval units built in Dockyard[NEWLINE]+2 [ICON_Gold] Gold when built on a foreign continent[NEWLINE]+1 [ICON_TradeRoute] Trade Route capacity.'
WHERE Tag='LOC_DISTRICT_ROYAL_NAVY_DOCKYARD_DESCRIPTION' AND Language='en_US';

UPDATE LocalizedText 
SET Text='A district unique to England for naval activity in your city. Replaces the Harbor district. Also removes the [ICON_Movement] Movement penalty for embarking and disembarking to and from this tile. +1 [ICON_Food] Food to all water tiles in this city. Must be built on Coast or Lake Terrain adjacent to land.[NEWLINE][NEWLINE]+1 [ICON_Movement] Movement for all naval units built in Dockyard[NEWLINE]+2 [ICON_Gold] Gold and +4 Loyalty per turn when built on a foreign continent. Cannot be built on Reef.'
WHERE Tag='LOC_DISTRICT_ROYAL_NAVY_DOCKYARD_EXPANSION1_DESCRIPTION' AND Language='en_US';

UPDATE LocalizedText 
SET Text='A district unique to England for naval activity in your city. Replaces the Harbor district. Also removes the [ICON_Movement] Movement penalty for embarking and disembarking to and from this tile. +1 [ICON_Food] Food to all water tiles in this city. Must be built on Coast or Lake Terrain adjacent to land.[NEWLINE][NEWLINE]+1 [ICON_Movement] Movement for all naval units built in Dockyard[NEWLINE]+2 [ICON_Gold] Gold and +4 Loyalty per turn when built on a foreign continent. Cannot be built on Reef.'
WHERE Tag='LOC_DISTRICT_ROYAL_NAVY_DOCKYARD_EXPANSION2_DESCRIPTION' AND Language='en_US';

UPDATE LocalizedText 
SET Text='A district unique to Phoenicia for naval activity in your city. Replaces the Harbor district and cheaper to build. +1 [ICON_Food] Food to all water tiles in this city. Must be built on Coast or Lake Terrain adjacent to land.[NEWLINE][NEWLINE]+50% [ICON_PRODUCTION] Production towards naval units and Settlers in this city. All wounded naval units in this city’s borders heal +100 HP each turn.'
WHERE Tag='LOC_DISTRICT_COTHON_DESCRIPTION' AND Language='en_US';

-- Buildings
UPDATE LocalizedText SET Text='+25% combat experience for all naval units trained in this city. +1 [ICON_Production] Production to all Coast tiles in this city. Bonus [ICON_Production] Production equal to the adjacency bonus of the Harbor district.'
WHERE Tag='LOC_BUILDING_SHIPYARD_DESCRIPTION' 
AND Language='en_US';

UPDATE LocalizedText SET Text='+25% combat experience for all naval units trained in this city. +1 [ICON_Production] Production to all Coast tiles in this city. Bonus [ICON_Production] Production equal to the adjacency bonus of the Harbor district.'
WHERE Tag='LOC_BUILDING_SHIPYARD_EXPANSION2_DESCRIPTION' 
AND Language='en_US';

UPDATE LocalizedText 
SET Text='+25% combat experience for all naval units trained in this city. Allows Fleets and Armadas to be trained directly. Fleet and Armada training costs reduced 25%. +2 [ICON_GOLD] Gold to all water tiles in this city.'
WHERE Tag='LOC_BUILDING_SEAPORT_DESCRIPTION' AND Language='en_US'

