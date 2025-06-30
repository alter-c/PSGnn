import os
import time
import argparse
from utils.parser import PddlParser
from algorithm.plan import AStarPlanner


DATA_PATH = "data/validate"

def run(domain_file, problem_file):
    pddl_parser = PddlParser()
    domain = pddl_parser.parse_domain(domain_file)
    problem = pddl_parser.parse_problem(problem_file)

    print("\n=====================domain=====================\n")
    print(domain)
    print("\n=====================problem=====================\n")
    print(problem)
    print("\n=====================plan=====================\n")
    
    # 执行规划
    start = time.time()
    planner = AStarPlanner(domain, problem)
    plan = planner.plan()
    end = time.time()
    
    
    if plan is not []:
        print(f"总规划时间为{(end - start):.2f}s")
        print("找到如下规划方案:")
        for i, action in enumerate(plan, 1):
            print(f"{i}. {action.name} {[param.name for param in action.parameters]}")
    else:
        print("未找到可行规划方案")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-d", "--domain", required=True, type=str, default="block")
    args = parser.parse_args()

    domain_file = os.path.join(DATA_PATH, f"domain-{args.domain}.pddl")
    problem_file = os.path.join(DATA_PATH, f"problem-{args.domain}.pddl")

    run(domain_file, problem_file)
