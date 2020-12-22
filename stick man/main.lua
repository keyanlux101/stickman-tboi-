local CharacterHutts = RegisterMod("Stick",1)



function CharacterHutts:OnUpdate(player)
	-- If the player is Hutts
	if player:GetName() == "stick" then
		-- Add Hutt's costume
		player:AddNullCostume(Huttshair)
		costumeEquipped = true
	end
end

CharacterHutts:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, CharacterHutts.OnUpdate)

 
local Hutts = { 
    DAMAGE = 2.55, -- relative to Isaac's base stats.
    SPEED = -0.25,
    SHOTSPEED = 1.25,
    TEARHEIGHT = .05,
    TEARFALLINGSPEED = 0,
    LUCK = -5,
    FLYING = false,                                 
    TEARFLAG = 0, -- 0 is default
    TEARCOLOR = Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0)  -- Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0) is default
}
 
function Hutts:onCache(player, cacheFlag)
    if player:GetName() == "Hutts" then
        if cacheFlag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage * Hutts.DAMAGE
        end
        if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed * Hutts*SHOTSPEED
        end
        if cacheFlag == CacheFlag.CACHE_RANGE then
            player.TearHeight = player.TearHeight - Hutts.TEARHEIGHT
            player.TearFallingSpeed = player.TearFallingSpeed + Hutts.TEARFALLINGSPEED
        end
        if cacheFlag == CacheFlag.CACHE_SPEED then
            player.MoveSpeed = player.MoveSpeed + Hutts.SPEED
        end
        if cacheFlag == CacheFlag.CACHE_LUCK then
            player.Luck = player.Luck + Hutts.LUCK
        end
        if cacheFlag == CacheFlag.CACHE_FLYING and Hutts.FLYING then
            player.CanFly = true
        end
        if cacheFlag == CacheFlag.CACHE_TEARFLAG then
            player.TearFlags = player.TearFlags | Hutts.TEARFLAG
        end
        if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
            player.TearColor = Hutts.TEARCOLOR
        end
    end
end
 
CharacterHutts:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, Hutts.onCache)