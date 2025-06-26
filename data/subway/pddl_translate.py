import json

LINE_OBJECT_TEXT = "{} - line"
STATION_OBJECT_TEXT = "{} - station"
CONNECTED_RELATION_TEXT = "(connected {} {} {})"

file = "/home/cdx/code/pddl-search/data/subway/subway_beijing.json"

with open(file, 'r', encoding="utf-8") as file:
    json_data = json.load(file)

pddl_file = "/home/cdx/code/pddl-search/data/problem.pddl"
with open(pddl_file, 'w', encoding="utf-8") as f:
    for line in json_data:
        line_name = line["name"]
        f.write("\t\t" + LINE_OBJECT_TEXT.format(line_name) + "\n")

    f.write("\n")

    st = []
    for line in json_data:
        line_name = line["name"]
        for station in line["station"]:
            if station in st: pass
            else:
                st.append(station)
                f.write("\t\t" + STATION_OBJECT_TEXT.format(station) + "\n")

    f.write("\n")

    for line in json_data:
        line_name = line["name"]
        stations =  line["station"]
        for current_station, next_station in zip(stations, stations[1:]):
            connected_text = CONNECTED_RELATION_TEXT.format(current_station, next_station, line_name)
            f.write("\t\t" + connected_text + "\n")
        
