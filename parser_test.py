from pddl.parser.domain import *
from pddl.parser.problem import *

"""
domain和problem定义在pddl.core中
predicates和not等定义在pddl.logic中
"""


domain_parser = DomainParser()
domain_file = "./data/subway/pddl/domain.pddl"
with open(domain_file, 'r') as file:
    domain_content = file.read()
    # print(domain_content)

domain = domain_parser(domain_content)
print(vars(domain))
# actions = domain._actions
# for action in actions:
#     print(vars(action))
# predicates = domain._predicates
# for predicate in predicates:
#     print(vars(predicate))
#     variables = predicate._terms
#     for variable in variables:
#         print(vars(variable))
#     print(type(variables))

######

problem_parser = ProblemParser()
problem_file = "./data/subway/pddl/task.pddl"
with open(problem_file, 'r') as file:
    problem_content = file.read()
    # print(domain_content)

problem = problem_parser(problem_content)
print(vars(problem))
# for init in problem._init:
#     print(init)
# print(vars(problem._goal))
   
