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
    Variable.BTLVAR_AFTER_MOVE_MESSAGE_TYPE: varvals.AfterMoveMessageType,
    Variable.BTLVAR_ATTACKER: varvals.BattleSlot,
    Variable.BTLVAR_ATTACKER_SELF_TURN_STATUS_FLAGS: varvals.SelfTurnStatus,
    Variable.BTLVAR_BATTLE_CTX_STATUS: varvals.BattleContextStatus,
    Variable.BTLVAR_BATTLE_CTX_STATUS_2: varvals.BattleContextStatus2,
    Variable.BTLVAR_BATTLE_SYS_STATUS: varvals.BattleSystemStatus,
    Variable.BTLVAR_BATTLE_TYPE: varvals.BattleType,
    Variable.BTLVAR_CURRENT_MOVE: varvals.Move,
    Variable.BTLVAR_DEFENDER: varvals.BattleSlot,
    Variable.BTLVAR_FAINTED_MON: varvals.BattleSlot,
    Variable.BTLVAR_FIELD_CONDITIONS: varvals.FieldConditions,
    Variable.BTLVAR_MOVE_STATUS_FLAGS: varvals.MoveStatus,
    Variable.BTLVAR_MOVE_TEMP: varvals.Move,
    Variable.BTLVAR_MOVE_TYPE: varvals.PokemonType,
    Variable.BTLVAR_MSG_ABILITY_TEMP: varvals.Ability,
    Variable.BTLVAR_MSG_MOVE_TEMP: varvals.Move,
    Variable.BTLVAR_RESULT_MASK: varvals.BattleResult,
    Variable.BTLVAR_SIDE_CONDITIONS_ATTACKER: varvals.SideConditions,
    Variable.BTLVAR_SIDE_CONDITIONS_DEFENDER: varvals.SideConditions,
    Variable.BTLVAR_SIDE_CONDITIONS_EFFECT_MON: varvals.SideConditions,
    Variable.BTLVAR_SIDE_EFFECT_MON_SELF_TURN_STATUS_FLAGS: varvals.SelfTurnStatus,
    Variable.BTLVAR_SIDE_EFFECT_PARAM: varvals.EffectSubScript,
    Variable.BTLVAR_SIDE_EFFECT_TYPE: varvals.SideEffectType,
    
    MonParam.BATTLEMON_ABILITY: varvals.Ability,
    MonParam.BATTLEMON_GENDER: varvals.Gender,
    MonParam.BATTLEMON_HELD_ITEM: varvals.Item,
    MonParam.BATTLEMON_MOVE_EFFECTS_MASK: varvals.MoveEffect,
    MonParam.BATTLEMON_STATUS: varvals.PokemonStatus,
    MonParam.BATTLEMON_TYPE_1: varvals.PokemonType,
    MonParam.BATTLEMON_TYPE_2: varvals.PokemonType,
    MonParam.BATTLEMON_VOLATILE_STATUS: varvals.PokemonVolatileStatus,
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
            case Variable.BTLVAR_SIDE_EFFECT_FLAGS_DIRECT | Variable.BTLVAR_SIDE_EFFECT_FLAGS_INDIRECT | Variable.BTLVAR_SIDE_EFFECT_FLAGS_ABILITY:
                flags = varvals.MoveSideEffectFlags(self.value & varvals.MoveSideEffectFlags.MOVE_SIDE_EFFECT_FLAGS)
                target = varvals.EffectSubScript(self.value & varvals.MoveSideEffectFlags.MOVE_SIDE_EFFECT_SUBSCRIPT)
                return f'{flags.name}|{target.name}'
            case Variable.BTLVAR_CALC_TEMP: # this can be anything, so keep it in hex format for now
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
