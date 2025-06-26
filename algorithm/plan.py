import heapq
import signal
import sys
from collections import deque
from itertools import product
from typing import Dict, List, Set, Tuple, Optional
from pddl.core import Domain, Problem
from pddl.action import Action
from pddl.logic.base import And, Formula, Or, Not, BinaryOp, UnaryOp
from pddl.logic.predicates import Predicate


from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser


class AStarPlanner:
    """
    基于A*算法的PDDL规划器
    """
    def __init__(self, domain: Domain, problem: Problem, heuristic=None):
        """
        :param domain: PDDL域定义
        :param problem: PDDL问题定义
        :param heuristic: 启发式函数 (默认为0)
        """
        self.domain = domain
        self.problem = problem
        self.heuristic = heuristic if heuristic else self.zero_heuristic
        
        # 缓存所有可能动作
        self.grounded_actions = self.ground_all_actions()
        
    def zero_heuristic(self, state: Set[Predicate]) -> float:
        """恒定为0的启发式函数 (统一代价搜索)"""
        return 0.0
    
    def ground_all_actions(self) -> List[Action]:
        """
        生成所有可能的实例化动作
        """
        grounded_actions = list() # 实例化的动作列表
        all_objects = self.problem.objects # 所有实例物品
        
        # 先对物品按类别进行分类
        # TODO 父类型处理
        object_type_dict = {} # 构建类别字典: 每个类有哪些物品
        type_dict = self.domain.types
        for domain_type in type_dict:
            object_type_dict[domain_type] = [] # 物品类别字典, 每个类对应一个物品列表

        for object in all_objects:
            object_type_set = object.type_tags
            object_type = next(iter(object_type_set))   # object_type是一个frozenset, 而domain_type是name类, 需要从set中取出
            object_type_dict[object_type].append(object)

        for action in self.domain.actions:
            # print(f"动作名称为{action.name}")
            # 首先获取动作的所有类型列表
            type_lists = [next(iter(parameter.type_tags)) for parameter in action.parameters]
            # 获取动作参数列表类型, 每一个参数可以放哪些物品
            param_lists = [object_type_dict[t] for t in type_lists]

            param_combos = set()
            for params in product(*param_lists): # 对参数做笛卡尔积
                # 去重
                if params in param_combos:
                    continue
                param_combos.add(params)
                instantiate_action = self.instantiate_action(action, params) # 动作实例化
                #print(f"实例化的action是{instantiate_action}")
                grounded_actions.append(instantiate_action)
        
        # print(f"动作排列组合===========================")
        # for a in grounded_actions:
        #     print(a)
        return grounded_actions
    
    def instantiate_action(self, action: Action, params: Tuple) -> Action:
        """
        用具体参数实例化动作
        """
        # 创建新的前提条件 (用参数替换变量)
        new_precondition = self.substitute_variables(action.precondition, action.parameters, params)
        
        # 创建新的效果 (用参数替换变量)
        new_effect = self.substitute_variables(action.effect, action.parameters, params)
        
        # 创建新的动作实例
        return Action(
            name=action.name,
            parameters=params,
            precondition=new_precondition,
            effect=new_effect
        )
    
    def substitute_variables(self, formula: Formula, variables: List, values: Tuple) -> Formula:
        """
        在公式中用具体值替换变量
        """
        # 创建变量到值的映射
        substitution = {var: value for var, value in zip(variables, values)}
        # 构建字典: var是变量, 对应实例value
        
        # 递归应用替换
        return self.apply_substitution(formula, substitution)
    
    def apply_substitution(self, formula: Formula, substitution: Dict) -> Formula:
        """
        递归地将替换应用于公式
        """
        if isinstance(formula, Predicate):
            # 替换谓词中的变量
            new_terms = []
            for term in formula.terms:
                if term in substitution:
                    new_terms.append(substitution[term])
                else:
                    new_terms.append(term)
            return type(formula)(formula.name, *new_terms)
        
        elif isinstance(formula, BinaryOp):
            # 递归处理二元逻辑子公式
            new_operands = [self.apply_substitution(op, substitution) for op in formula.operands]
            return type(formula)(*new_operands)
        
        elif isinstance(formula, UnaryOp):
            # 递归处理否定逻辑子公式
            arg =  self.apply_substitution(formula.argument, substitution)
            return type(formula)(arg)
        else:
            print("!!!!!!!!!!错误, 无法识别的逻辑连接, 无法实例化!!!!!!!!!!")
        
        return formula
    



    def is_applicable(self, state: Set[Predicate], action: Action) -> bool:
        """
        检查动作在当前状态下是否可应用
        """
        # 检查前提条件是否满足
        return self.satisfies(state, action.precondition)
    
    def satisfies(self, state: Set[Predicate], condition: Formula) -> bool:
        """
        检查状态是否满足给定条件
        """
        if isinstance(condition, Predicate):
            return condition in state
        
        elif isinstance(condition, And):
            return all(self.satisfies(state, op) for op in condition.operands)
        
        elif isinstance(condition, Or):
            return any(self.satisfies(state, op) for op in condition.operands)
        
        elif isinstance(condition, Not):
            return not (self.satisfies(state, condition.argument))
        
        # 简化实现 - 实际应用中应处理所有逻辑操作符
        return False
    
    def apply_action(self, state: Set[Predicate], action: Action) -> Set[Predicate]:
        """
        将动作应用于当前状态，返回新状态
        
        注意: 这是一个简化的实现，只处理添加效果
        """
        # 创建状态的副本
        new_state = set(state)
        
        self._apply_effect(new_state, action.effect)
        
        return new_state
    
    def _apply_effect(self, state: Set[Predicate], effect: Formula) -> None:
        # 简化: 假设效果是一个添加列表
        if isinstance(effect, Predicate):
            state.add(effect)
        elif isinstance(effect, And):
            for effect in effect.operands:
                if isinstance(effect, Predicate):
                    self._apply_effect(state, effect)
        elif isinstance(effect, Not) and isinstance(effect.argument, Predicate):
            if effect.argument in state:
                state.remove(effect.argument)
        
    
    def goal_test(self, state: Set[Predicate]) -> bool:
        """检查状态是否满足目标条件"""
        return self.satisfies(state, self.problem.goal)
    
    def plan(self) -> Optional[List[Action]]:
        """
        执行A*搜索寻找规划
        
        返回:
            动作序列 (如果找到解) 或 None (如果无解)
        """
        # 初始状态
        initial_state = set(self.problem.init)
        
        # 检查初始状态是否已满足目标
        if self.goal_test(initial_state):
            return []
        
        # 节点数据结构: (f_score, g_score, state, path)
        # 优先队列 - 按f_score排序
        counter = 0
        open_set = []
        heapq.heappush(open_set, (0, 0, counter, initial_state, []))
        
        # 已探索状态 (状态 -> 到达该状态的最小代价)
        closed_set = {}
        
        while open_set:
            # 获取f值最小的节点
            f_score, g_score, _, state, path = heapq.heappop(open_set)
            
            # 状态哈希 (用于比较)
            state_hash = self.state_hash(state)
            
            # 检查是否已以更低代价访问过此状态
            if state_hash in closed_set and closed_set[state_hash] <= g_score:
                continue
                
            # 标记为已访问
            closed_set[state_hash] = g_score
            
            # 目标测试
            if self.goal_test(state):
                return path
            
            # 扩展所有适用动作
            for action in self.grounded_actions:
                if self.is_applicable(state, action):
                    # 应用动作得到新状态
                    new_state = self.apply_action(state, action)
                    new_path = path + [action]
                    new_g_score = g_score + 1  # 动作代价设为1
                    
                    # 计算启发值
                    h_score = self.heuristic(new_state)
                    new_f_score = new_g_score + h_score
                    
                    # 状态哈希
                    new_state_hash = self.state_hash(new_state)
                    
                    # 如果新状态未访问或以更高代价访问过
                    if new_state_hash not in closed_set or closed_set[new_state_hash] > new_g_score:
                        heapq.heappush(open_set, (new_f_score, new_g_score, counter, new_state, new_path))
                        counter += 1
        
        # 无解
        return None
    
    def state_hash(self, state: Set[Predicate]) -> str:
        """
        生成状态的唯一哈希值
        
        参数:
            state: 状态 (一组谓词)
        
        返回:
            状态的字符串表示
        """
        # 对谓词排序以确保一致
        return "|".join(sorted(str(p) for p in state))


class PddlParser():
    def __init__(self):
        self.domain_parser = DomainParser()
        self.problem_parser = ProblemParser()
        
    def parse_domain(self, domain_file):
        with open(domain_file, 'r') as file:
            domain_content = file.read()
        domain = self.domain_parser(domain_content)
        return domain

    def parse_problem(self, problem_file):
        with open(problem_file, 'r') as file:
            problem_content = file.read()
        problem = self.problem_parser(problem_content)
        return problem

def signal_handler(sig, frame):
    """设置ctrl+c信号处理器"""
    print("按下Ctrl+C, 正在退出程序...")
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)

# 示例用法
if __name__ == "__main__":
    # 假设已经解析了域和问题

    parser = PddlParser()

    domain_file = "domain-barman.pddl"
    problem_file = "task-barman.pddl"

    domain = parser.parse_domain(domain_file)
    problem = parser.parse_problem(problem_file)


    # print("=====================domain=====================\n")
    # for action in domain.actions:
    #     print(vars(action))

    
    # print(domain.types)
    # type_dict = domain.types
    # for action in domain.actions:
    #     print(action.name)
    #     print(action.precondition)
    #     pres = action.precondition
    #     print("打印pre类型")
    #     if isinstance(pres, Predicate):
    #         print("谓词")
    #         print(type(pres))
    #     else:
    #         print("有逻辑连词")
    #         print(type(pres))
    #         print(isinstance(pres, And))
    #         # for pre in pres._operands:
    #         #     print(vars(pre))
    
    # print("=====================problem=====================\n")
    # print(problem.init)
    # for i in problem.init:
    #     print(i)
    # for object in problem.objects:
    #     print(f"示例名为 {object.name}")
    #     for tag in object.type_tags:
    #         print(type(tag))
    #         while True:
    #             type_t = type_dict[tag]
    #             print(type_t)
    #             tag = type_t
    #             if tag is None:
    #                 break
    # 创建规划器实例 (使用零启发式)

    print("=====================plan=====================\n")
    planner = AStarPlanner(domain, problem)
    
    
    # # 执行规划
    plan = planner.plan()
    
    if plan:
        print("找到规划方案:")
        for i, action in enumerate(plan, 1):
            print(f"{i}. {action.name} {[param for param in action.parameters]}")
    else:
        print("未找到规划方案")