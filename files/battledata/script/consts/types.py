from collections import namedtuple

from .enums import Variable, MonParam
from . import varvals

def _sint(i: int, n: int) -> int:
    return i if i < (1 << (n - 1)) else i - (1 << n)

class Label():
    def __init__(self, address: int):
        self.addr = _sint(address, 32)
    
    def __str__(self):
        return f'Label(addr={self.addr})'

VARIABLE_VALUE_MAP = {
    Variable.BSCRIPT_VAR_AFTER_MOVE_MESSAGE_TYPE: varvals.AfterMoveMessageType,
    Variable.BSCRIPT_VAR_BATTLER_ATTACKER: varvals.BattleSlot,
    Variable.BSCRIPT_VAR_ATTACKER_SELF_TURN_STATUS_FLAGS: varvals.SelfTurnStatus,
    Variable.BSCRIPT_VAR_BATTLE_STATUS: varvals.BattleContextStatus,
    Variable.BSCRIPT_VAR_BATTLE_STATUS_2: varvals.BattleContextStatus2,
    Variable.BSCRIPT_VAR_BATTLE_SYS_STATUS: varvals.BattleSystemStatus,
    Variable.BSCRIPT_VAR_BATTLE_TYPE: varvals.BattleType,
    Variable.BSCRIPT_VAR_MOVE_NO_CUR: varvals.Move,
    Variable.BSCRIPT_VAR_BATTLER_TARGET: varvals.BattleSlot,
    Variable.BSCRIPT_VAR_BATTLER_FAINTED: varvals.BattleSlot,
    Variable.BSCRIPT_VAR_FIELD_CONDITION: varvals.FieldConditions,
    Variable.BSCRIPT_VAR_MOVE_STATUS_FLAGS: varvals.MoveStatus,
    Variable.BSCRIPT_VAR_MOVE_NO_TEMP: varvals.Move,
    Variable.BSCRIPT_VAR_MOVE_TYPE: varvals.PokemonType,
    Variable.BSCRIPT_VAR_MSG_ABILITY_TEMP: varvals.Ability,
    Variable.BSCRIPT_VAR_MSG_MOVE_TEMP: varvals.Move,
    Variable.BSCRIPT_VAR_BATTLE_OUTCOME: varvals.BattleResult,
    Variable.BSCRIPT_VAR_SIDE_CONDITION_ATTACKER: varvals.SideConditions,
    Variable.BSCRIPT_VAR_SIDE_CONDITION_TARGET: varvals.SideConditions,
    Variable.BSCRIPT_VAR_SIDE_CONDITION_STAT_CHANGE: varvals.SideConditions,
    Variable.BSCRIPT_VAR_SIDE_EFFECT_MON_SELF_TURN_STATUS_FLAGS: varvals.SelfTurnStatus,
    Variable.BSCRIPT_VAR_SIDE_EFFECT_PARAM: varvals.EffectSubScript,
    Variable.BSCRIPT_VAR_SIDE_EFFECT_TYPE: varvals.SideEffectType,
    
    MonParam.BMON_DATA_ABILITY: varvals.Ability,
    MonParam.BMON_DATA_GENDER: varvals.Gender,
    MonParam.BMON_DATA_HELD_ITEM: varvals.Item,
    MonParam.BMON_DATA_MOVE_EFFECT: varvals.MoveEffect,
    MonParam.BMON_DATA_STATUS: varvals.PokemonStatus,
    MonParam.BMON_DATA_TYPE_1: varvals.PokemonType,
    MonParam.BMON_DATA_TYPE_2: varvals.PokemonType,
    MonParam.BMON_DATA_STATUS2: varvals.PokemonVolatileStatus,
}

class VariableValue():
    __slots__ = ('param', 'value')

    def __init__(self, param: int, value: int):
        self.param = Variable(param)
        self.value = value
    
    def __str__(self) -> str:
        return f'{self.param.name} -> {self.value}'
    
    def name(self) -> str:
        return self.param.name
    
    def value_s(self) -> str:
        match self.param:
            case _ if self.param in VARIABLE_VALUE_MAP:
                return VARIABLE_VALUE_MAP[self.param](self.value).name
            case Variable.BSCRIPT_VAR_SIDE_EFFECT_FLAGS_DIRECT | Variable.BSCRIPT_VAR_SIDE_EFFECT_FLAGS_INDIRECT | Variable.BSCRIPT_VAR_SIDE_EFFECT_FLAGS_ABILITY:
                flags = varvals.MoveSideEffectFlags(self.value & varvals.MoveSideEffectFlags.MOVE_SIDE_EFFECT_FLAGS)
                target = varvals.EffectSubScript(self.value & varvals.MoveSideEffectFlags.MOVE_SIDE_EFFECT_SUBSCRIPT)
                return f'{flags.name}|{target.name}'
            case Variable.BSCRIPT_VAR_CALC_TEMP: # this can be anything, so keep it in hex format for now
                return f'0x{self.value:08X}'
            case _: # all others are just standard numbers
                return str(_sint(self.value, 32))

class MonParamValue(VariableValue):
    __slots__ = ('param', 'value')

    def __init__(self, param: int, value: int):
        self.param = MonParam(param)
        self.value = value

class MessageId():
    __slots__ = ('id')
    def __init__(self, id: int):
        self.id = id
    
    def __str__(self) -> str:
        return f'{self.id}'

Command = namedtuple('Command', 'name params')
