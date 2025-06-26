import os
import time

data_file = "./data/ipc-2014/domains"
task_name = "transport-sequential-optimal"

task_num = 20

log_file = task_name + ".log"

for i in range(1, task_num + 1):
    start = time.time()

    domain_pddl = os.path.join(data_file, task_name, "domain.pddl")
    task_pddl = os.path.join(data_file, task_name, f"instances/instance-{i}.pddl") 
    PLAN_METHOD = "'astar(cg())'"
    os.system(f"python ../downward/fast-downward.py " + \
            f"{domain_pddl} {task_pddl} " + \
            f"--search {PLAN_METHOD} ")
    
    end = time.time()
    
    print(f"第{i}个问题耗时{end - start}秒")
    with open(log_file, 'a') as file:
        file.write(f"第{i}个问题耗时{end - start}秒\n")


# time_limit = 20
# os.system(f"python ./downward/fast-downward.py " + \
#           f"--alias 'seq-opt-fdss-1' " + \
#           f"--search-time-limit {time_limit} "
#           f"{domain_pddl} {task_pddl} ")