local MIN = 800
local MAX = 1000
local EMPTY_POTION = 7635

local exhaust = createConditionObject(CONDITION_EXHAUST_HEAL)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, getConfigInfo('timeBetweenExActions'))

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isPlayer(itemEx.uid) == FALSE then
		return FALSE
	end

	if hasCondition(cid, CONDITION_EXHAUST_HEAL) == TRUE then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return TRUE
	end

	if((not(isKnight(itemEx.uid)) or getPlayerLevel(itemEx.uid) < 130) and getPlayerCustomFlagValue(itemEx.uid, PlayerCustomFlag_GamemasterPrivileges) == FALSE) then
		doCreatureSay(itemEx.uid, "Only knights of level 130 or above may drink this fluid.", TEXTCOLOR_RED)
		return TRUE
	end

	if doCreatureAddHealth(itemEx.uid, math.random(MIN, MAX)) == LUA_ERROR then
		return FALSE
	end

	doAddCondition(cid, exhaust)
	doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_MAGIC_BLUE)
	doCreatureSay(itemEx.uid, "Aaaah...", TEXTCOLOR_RED)
	doTransformItem(item.uid, EMPTY_POTION)
	return TRUE
end
