import heapq
from typing import Set, List, Dict

from pddl.core import Domain, Problem
from pddl.logic.predicates import Predicate
from pddl.action import Action

from algorithm.state import State
from utils.preprocess import ActionGrounder


class AStarState(State):
    """
    A*算法状态类, 扩展自State, 添加f_score,g_score,path属性
    """
    def __init__(self, predicates: Set[Predicate], f_score: float = 0.0, g_score: float = 0.0, path: List[Action] = None):
        super().__init__(predicates)
        self.f_score = f_score  # f(n) = g(n) + h(n)
        self.g_score = g_score  # g(n) 从初始点到当前节点的实际代价
        self.path = path  # 从起点到当前节点的动作序列

    def __lt__(self, other):
        return isinstance(other, AStarState) and self.f_score < other.f_score  # 用于优先队列比较
    
    def copy(self):
        # 重写copy方法, 返回子类副本
        return AStarState(self.predicates.copy())
    
    def update_score_path(self, f_score: float, g_score: float, path: List[Action]):
        """
        更新状态的f_score, g_score和路径
        """
        self.f_score = f_score
        self.g_score = g_score
        self.path = path


class AStarPlanner:
    """
    基于A*算法的PDDL规划器
    """
    def __init__(self, domain: Domain, problem: Problem, heuristic=None):
        """
        :param domain: PDDL域定义
        :param problem: PDDL问题定义
        :param heuristic: 启发式函数 (默认为盲目搜索)
        """
        self.domain = domain
        self.problem = problem
        self.num_explored = 0 
        self.num_extended = 0 
        self.heuristic = heuristic if heuristic else self.blind_heuristic

        # 缓存所有可能动作
        self.action_list = self.ground_action()

    def blind_heuristic(self, state: State) -> float:
        """恒定为0的启发式函数 (盲目搜索)"""
        return 0.0

    def ground_action(self):
        """生成所有可能的动作"""
        action_grounder = ActionGrounder(self.domain, self.problem)
        return action_grounder.ground_all_actions()

    def plan(self) -> List[Action]:
        """
        执行A*搜索寻找规划
        如果有解,返回(动作序列,搜索次数); 否则None
        """
        open_list: List[AStarState] = [] # 未探索的状态列表
        closed_list: Dict[str, int] = {} # 已探索的状态字典{str(state): g_score}, 记录状态的最小代价

        initial_state = AStarState(self.problem.init, 0, 0, [])
        heapq.heappush(open_list, initial_state) # 优先队列, 按f_score排序

        while open_list:
            # 从优先队列中取出f值最小的状态
            state = heapq.heappop(open_list) 
            state_hash = str(state) # 状态哈希值用于比较最小代价

            # 检查是否已以更小代价访问过状态
            if state_hash in closed_list and closed_list[state_hash] <= state.g_score:
                continue
            
            # 标记为已探索并检查是否到达目标
            closed_list[state_hash] = state.g_score
            self.num_explored += 1
            if state.goal_test(self.problem.goal):
                print(f"搜索树共扩展{self.num_extended}次")
                print(f"搜索树共搜索{self.num_explored}个状态")
                return state.path

            # 检查所有可行动作并扩展搜索树
            for action in self.action_list:
                if state.is_applicable(action):
                    new_state: AStarState = state.apply_action(action)
                        
                    new_path = state.path + [action]
                    new_g_score = state.g_score + 1  # 动作代价为1
                    new_h_score = self.heuristic(new_state) # TODO 延迟启发式评估
                    new_f_score = new_g_score + new_h_score

                    new_state.update_score_path(new_f_score, new_g_score, new_path)
                    heapq.heappush(open_list, new_state)
                    self.num_extended += 1
        
        # 无解
        return None


import sys
import signal

def signal_handler(sig, frame):
    """设置强制退出信号处理器"""
    print("正在退出程序...")
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)