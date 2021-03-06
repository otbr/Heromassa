local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_BIGCLOUDS)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, TRUE)

local condition1 = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition1, CONDITION_PARAM_TICKS, 10000)
setConditionFormula(condition1, -0.4, 0, -0.4, 0)
setCombatCondition(combat, condition1)

local condition2 = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition2, CONDITION_PARAM_TICKS, 10000)
setConditionParam(condition2, CONDITION_PARAM_HEALTHGAIN, -20)
setConditionParam(condition2, CONDITION_PARAM_HEALTHTICKS, 1000)
setConditionParam(condition2, CONDITION_PARAM_MANAGAIN, 10)
setConditionParam(condition2, CONDITION_PARAM_MANATICKS, 1000)
setCombatCondition(combat, condition2)

local condition3 = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition3, CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 85)
setConditionParam(condition3, CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 115)
setConditionParam(condition3, CONDITION_PARAM_SKILL_MELEEPERCENT, 150)
setConditionParam(condition3, CONDITION_PARAM_SKILL_DISTANCEPERCENT, 150)
setConditionParam(condition3, CONDITION_PARAM_SKILL_SHIELDPERCENT, 0)
setConditionParam(condition3, CONDITION_PARAM_TICKS, 10000)
setCombatCondition(combat, condition3)

local condition4 = createConditionObject(EXHAUST_HEALING)
setConditionParam(condition4, CONDITION_PARAM_TICKS, 1000)
setCombatCondition(combat, condition4)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
