"""
该脚本用于对地铁源数据进行预处理, 得到地铁邻接json数据
"""


import json
from pathlib import Path


def create_line_dict(city_name):
    """根据城市构建线路翻译字典"""
    # 翻译对照json文件路径
    script_dir = Path(__file__).parent
    translate_file = script_dir / "translate.json"

    # 构建字典
    with open(translate_file, 'r', encoding="utf-8") as file:
        data = json.load(file)
    
    # 根据城市名构建字典
    dict = {city["name"]: city["trans"] for city in data["city"]}
    line_dict = dict.get(city_name, {})
    return line_dict

def file_process(source_file, subway_file):
    """处理地铁源数据
    
    :param source_file: 高德地图导出的地铁源文件
    :param subway_file: 处理后的地铁路线文件
    """
    # 导入json数据
    json_data = {}
    with open(source_file, 'r', encoding="utf-8") as file:
        json_data = json.load(file)

    # 源文件无线路英文名, 需构建线路字典, 用于线路翻译
    city_name = json_data['s']
    line_dict = create_line_dict(city_name)

    # 整理数据
    lines = []
    for item in json_data['l']:
        line_name = line_dict[item['ln']].replace(' ', '_') # 空格替换为下划线保证pddl规范
        station_names = [(station['sp']).replace(' ', '_') for station in item['st']] 
        lines.append({"name": line_name, "station": station_names})

    # 保存json文件
    with open(subway_file, 'w', encoding="utf-8") as file:
        json.dump(lines, file, ensure_ascii=False, indent=4)

def batch_process():
    """批量处理"""
    # 目录格式处理
    script_dir = Path(__file__).parent
    source_dir = script_dir / "source"
    subway_dir = script_dir / "subway"

    # 批量处理源数据
    for source_file in source_dir.glob("*.json"):
        subway_file = subway_dir / f"subway_{source_file.name}"
        file_process(source_file, subway_file)


if __name__ == "__main__":
    batch_process()
    # create_line_dict("成都市地铁")