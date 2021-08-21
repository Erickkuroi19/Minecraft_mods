--Author: original concept by TC. Rewrite by qqqbbb.

local function OnProjectCompleted(playerID, cityID, projectIndex, buildingIndex, locX, locY, bCanceled)
	local pPlayer = Players[playerID];
	local sProjectTypeCompleted = GameInfo.Projects[projectIndex].ProjectType;

	if pPlayer:IsHuman() and string.find(sProjectTypeCompleted, "PROJECT_REMOVE_DISTRICT_") then
		local sCivType = PlayerConfigurations[playerID]:GetCivilizationTypeName();
		local pCity = pPlayer:GetCities():FindID( cityID );
		local pCityDistricts :table	= pCity:GetDistricts();
		local sDistrictType = GameInfo.Projects[projectIndex].PrereqDistrict;
		local iDistrictID = GameInfo.Districts[sDistrictType].Index;

		for row in GameInfo.RD_civType_uniqueDistrictType() do
			if row.CivType == sCivType and row.ReplacedDistrictType == sDistrictType then
				iDistrictID = GameInfo.Districts[row.UniqueDistrictType].Index;
				break;
			end
		end
		pCityDistricts:RemoveDistrict(iDistrictID);
	end
end

Events.CityProjectCompleted.Add(OnProjectCompleted);
