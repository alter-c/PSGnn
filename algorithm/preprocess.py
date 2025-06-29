from itertools import product
from typing import Dict, List, Set, Tuple

from pddl.core import Domain, Problem
from pddl.action import Action
from pddl.logic.base import Formula, BinaryOp, UnaryOp
from pddl.logic.predicates import Predicate
from pddl.logic.terms import Constant
from pddl.custom_types import parse_name


DEFAULT_TYPE = parse_name('default')

class ActionGrounder:
    def __init__(self, domain: Domain, problem: Problem):
        """
        生成所有的动作组合
        """
        self.domain = domain
        self.problem = problem

    def get_type_dict(self) -> Set[Constant]:
        """
        获取类别物品对照字典, 可按类别获取对应物品
        """
        type_object_dict = {}
        for domain_type in self.domain.types:
            type_object_dict[domain_type] = set() # {'type1':{object1, object2}, ...} (集合用于在添加父类时去重)
        type_object_dict[DEFAULT_TYPE] = set() # 添加默认类型

        ### 首先需要处理类型继承, 因为某些动作参数指定的是父类, 而实例化时只定义子类
        type_ancestors = {} # 类型的父类字典: {子类:[父类列表]}
        for t in self.domain.types:
            ancestors = set()
            current = t
            # 遍历父类
            while current:
                ancestors.add(current)
                current = self.domain.types[current]
            type_ancestors[t] = ancestors

        ### 对所有物品按类别进行分类
        for object in self.problem.objects:
            object_type = object.type_tags
            # 对于未指定类型的物品, 设为默认类型
            if not object_type:
                type_object_dict[DEFAULT_TYPE].add(object)
                continue
            object_type = next(iter(object_type))   # object_type是一个frozenset, 而domain_type是name类, 需要从set中取出
            type_object_dict[object_type].add(object)

            # 将该物品添加到对应类别的父类
            for ancestor in type_ancestors[object_type]: 
                type_object_dict[ancestor].add(object)

        return type_object_dict

    def ground_all_actions(self) -> List[Action]:
        """
        生成所有可能的实例化动作
        """
        type_object_dict = self.get_type_dict() # 类别物品对照字典
        grounded_actions = list() # 实例化的动作列表

        for action in self.domain.actions:
            # 首先获取动作的每个参数类型
            type_lists = []
            for parameter in action.parameters:
                if not parameter.type_tags: # 部分动作未指定变量类型, 添加默认参数类型
                    type_lists.append(DEFAULT_TYPE)
                    continue 
                type_lists.append(next(iter(parameter.type_tags)))
            # 动作实例物品列表, 动作的每一个参数可以由哪些物品实例化
            param_lists = [type_object_dict[t] for t in type_lists]

            param_combos = set()
            for objects in product(*param_lists): # 对参数列表做笛卡尔积生成物品组合
                if objects in param_combos: # 去重已实例化的物品组合
                    continue
                param_combos.add(objects)
                instantiate_action = self.instantiate_action(action, objects) # 对动作进行实例替换
                grounded_actions.append(instantiate_action)
        
        return grounded_actions
    
    def instantiate_action(self, action: Action, objects: Tuple) -> Action:
        """
        用实例物品替换动作formula中的抽象参数
        """
        # 对前提条件和影响进行替换
        new_precondition = self.replace_variables(action.precondition, action.parameters, objects)
        new_effect = self.replace_variables(action.effect, action.parameters, objects)
        
        # 创建新的动作实例
        return Action(
            name=action.name,
            parameters=objects,
            precondition=new_precondition,
            effect=new_effect
        )
    
    def replace_variables(self, formula: Formula, variables: List, objects: Tuple) -> Formula:
        """
        对单个formula进行实例替换
        """
        # 构建映射字典: var是变量, 对应实例object
        replace_dict = {var: object for var, object in zip(variables, objects)}
        
        # 递归应用替换
        return self.apply_replacement(formula, replace_dict)
    
    def apply_replacement(self, formula: Formula, replace_dict: Dict) -> Formula:
        """
        递归对formula进行替换
        """
        # 目前支持对3类逻辑进行处理: Predicate谓词变量, BinaryOp二元逻辑, UnaryOp否定逻辑
        if isinstance(formula, Predicate):
            # 对谓词变量直接替换即可
            new_terms = []
            for term in formula.terms:
                new_terms.append(replace_dict[term])
            return type(formula)(formula.name, *new_terms)
        
        elif isinstance(formula, BinaryOp):
            # 递归处理二元逻辑子公式
            new_operands = [self.apply_replacement(op, replace_dict) for op in formula.operands]
            return type(formula)(*new_operands)
        
        elif isinstance(formula, UnaryOp):
            # 递归处理否定逻辑子公式
            arg = self.apply_replacement(formula.argument, replace_dict)
            return type(formula)(arg)
        
        else:
            raise TypeError(f"实例化发生错误: 目前不支持对{type(formula)}逻辑进行处理")
        
        return formula