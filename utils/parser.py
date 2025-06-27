from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser

class PddlParser():
    def __init__(self):
        self.domain_parser = DomainParser()
        self.problem_parser = ProblemParser()
        
    def parse_domain(self, domain_file):
        with open(domain_file, 'r') as file:
            domain_content = file.read()
        return self.domain_parser(domain_content)

    def parse_problem(self, problem_file):
        with open(problem_file, 'r') as file:
            problem_content = file.read()
        return self.problem_parser(problem_content)