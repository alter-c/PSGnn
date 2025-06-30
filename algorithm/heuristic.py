from pddl.logic.base import And
from algorithm.state import State

def simple_heuristic(state: State, goal: And) -> float:
    """
    简单启发式函数: 计算状态与目标之间的谓词差异数量

    :param state: 当前状态
    :param goal: 目标状态
    :return: 启发式估计值
    """
    # 计算当前状态中满足目标的谓词数量
    satisfied_count = sum(1 for p in goal.operands if p in state)
    
    return satisfied_count