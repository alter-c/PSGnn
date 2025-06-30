from typing import Set

from pddl.action import Action
from pddl.logic.base import Formula, And, Or, Not
from pddl.logic.predicates import Predicate


class State:
    """
    PDDL状态类, 封装Formula集合及相关操作
    """

    def __init__(self, formulas: Set[Formula]):
        self.formulas = set(formulas)

    def __contains__(self, item: Formula) -> bool:
        return item in self.formulas

    def __eq__(self, other):
        return isinstance(other, State) and self.formulas == other.formulas

    def __str__(self):
        # 对谓词排序以确保一致
        return " ".join(sorted(str(p) for p in self.formulas))
    
    def copy(self):
        # 创建状态的副本, 不改变原状态
        return State(self.formulas.copy()) # 不用deepcopy, 性能较差

    def add(self, item: Formula):
        self.formulas.add(item)

    def remove(self, item: Formula):
        self.formulas.remove(item)

    def satisfies(self, condition: Formula) -> bool:
        """
        检查状态是否满足给定条件
        """
        # 如果条件是单个谓词状态, 直接判断即可
        if isinstance(condition, Predicate):
            return condition in self

        # 如果条件是逻辑连接, 需要进行递归判断
        elif isinstance(condition, And):
            return all(self.satisfies(op) for op in condition.operands)

        elif isinstance(condition, Or):
            return any(self.satisfies(op) for op in condition.operands)

        elif isinstance(condition, Not):
            return not (self.satisfies(condition.argument))

        else:
            raise TypeError(f"条件检查发生错误: 目前不支持对{type(condition)}逻辑进行处理")

    def is_applicable(self, action: Action) -> bool:
        """
        检查动作在当前状态下是否可用
        """
        # 检查前提条件是否满足
        return self.satisfies(action.precondition)

    def apply_action(self, action: Action):
        """
        将动作应用于当前状态，返回新状态
        """
        new_state = self.copy() # 此处注意子类类型对应
        new_state._apply_effect(action.effect)
        return new_state

    def _apply_effect(self, effect: Formula) -> None:
        """
        根据影响, 对状态进行更新
        """
        # effect单个谓词
        if isinstance(effect, Predicate):
            # 先将该谓词的否定从状态中去除
            if Not(effect) in self.formulas:
                self.remove(Not(effect))
            # 添加谓词影响
            self.add(effect)

        # effect与连接, 需要进行递归处理(effect一般不会用or进行连接)
        elif isinstance(effect, And):
            for sub_effect in effect.operands:
                self._apply_effect(sub_effect)

        # effect否定逻辑, 且否定逻辑中确实为单个谓词
        elif isinstance(effect, Not) and isinstance(effect.argument, Predicate):
            # 先将该否定的谓词从状态中去除
            if effect.argument in self.formulas:
                self.remove(effect.argument)
            # 还需添加该否定影响
            self.add(effect)

        else:
            raise TypeError(f"影响处理发生错误: 目前不支持对{type(effect)}逻辑进行处理")

    def goal_test(self, goal: Formula) -> bool:
        """
        检查状态是否满足目标条件
        """
        return self.satisfies(goal)