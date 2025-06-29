import heapq
from typing import Set, List, Tuple

from pddl.core import Domain, Problem
from pddl.action import Action
from pddl.logic.base import Formula, And, Or, Not
from pddl.logic.predicates import Predicate

from algorithm.preprocess import ActionGrounder

class State:
    """
    PDDL状态类, 封装谓词集合及相关操作
    """

    def __init__(self, predicates: Set[Predicate]):
        self.predicates = set(predicates)

    def __contains__(self, item):
        return item in self.predicates

    def __iter__(self):
        return iter(self.predicates)

    def copy(self):
        # 创建状态的副本, 不改变原状态
        return State(self.predicates.copy())

    def add(self, item):
        self.predicates.add(item)

    def remove(self, item):
        self.predicates.remove(item)

    def __str__(self):
        # 对谓词排序以确保一致
        return "|".join(sorted(str(p) for p in self.predicates))

    def __hash__(self):
        return hash(tuple(sorted(str(p) for p in self.predicates)))

    def __eq__(self, other):
        return isinstance(other, State) and self.predicates == other.predicates

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

    def apply_action(self, action: Action) -> 'State':
        """
        将动作应用于当前状态，返回新状态
        """
        new_state = self.copy()
        new_state._apply_effect(action.effect)
        return new_state

    def _apply_effect(self, effect: Formula) -> None:
        """
        根据影响, 对状态进行更新
        """
        # effect单个谓词
        if isinstance(effect, Predicate):
            # 先将该谓词的否定从状态中去除
            if Not(effect) in self.predicates:
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
            if effect.argument in self.predicates:
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
        self.goal = self.problem.goal
        self.heuristic = heuristic if heuristic else self.zero_heuristic

        # 缓存所有可能动作
        self.grounded_actions = self.ground_action()

    def zero_heuristic(self, state: State) -> float:
        """恒定为0的启发式函数 (统一代价搜索)"""
        return 0.0

    def ground_action(self):
        """生成所有可能的动作"""
        action_grounder = ActionGrounder(self.domain, self.problem)
        return action_grounder.ground_all_actions()

    def plan(self) -> Tuple[List[Action], int]:
        """
        执行A*搜索寻找规划
        如果有解,返回(动作序列,搜索次数); 否则None
        """
        open_set: List[Tuple[float, float, int, State, List]] = [] # 未探索的状态列表
        closed_set = {} # 已探索的状态字典, 会记录到达该状态的最小代价

        # 初始状态并检查是否到达目标
        initial_state = State(self.problem.init)
        if initial_state.goal_test(self.goal):
            return ([], 0)

        # 状态节点数据结构: (f_score, g_score, counter, state, path)
        counter = 0 # counter用于保证在f与g相等时, 保证优先队列可比较, 否则state不可比
        heapq.heappush(open_set, (0, 0, counter, initial_state, [])) # 优先队列, 按f_score排序

        num_explored = 0
        while open_set:
            # 获取f值最小的节点
            f_score, g_score, _, state, path = heapq.heappop(open_set)
            state_hash = str(state) # 状态哈希值用于比较最小代价, set不可哈希
            # 检查是否已以更短的路径访问过状态, 更短路径不可行则不必计算
            if state_hash in closed_set and closed_set[state_hash] <= g_score:
                continue
            # 标记为已访问并检查是否到达目标
            num_explored += 1
            closed_set[state_hash] = g_score
            if state.goal_test(self.goal):
                print(f"搜索树共扩展{counter}次")
                return (path, num_explored)

            # 检查所有可行动作并扩展搜索树
            for action in self.grounded_actions:
                if state.is_applicable(action):
                    new_state = state.apply_action(action)
                    new_path = path + [action]
                    new_g_score = g_score + 1  # 动作代价设为1

                    # 计算启发值
                    h_score = self.heuristic(new_state)
                    new_f_score = new_g_score + h_score

                    # 状态哈希
                    new_state_hash = str(new_state)
                    if new_state_hash not in closed_set or closed_set[new_state_hash] > new_g_score:
                        heapq.heappush(open_set, (new_f_score, new_g_score, counter, new_state, new_path))
                        counter += 1
        # 无解
        return None

    def state_hash(self, state: State) -> str:
        """
        生成状态set的哈希字符串
        """
        return str(state)


import sys
import signal

def signal_handler(sig, frame):
    """设置强制退出信号处理器"""
    print("正在退出程序...")
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)