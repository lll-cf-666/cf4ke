# 第 9 课 · FastAPI 三接口（任务卡 17-1）· M3 交

> 对应元旦课表【答案 17-1】· 第 17 周周六 4–5h · 12/27 交 main.py（M3 截止）

## 学什么

- FastAPI = 把 Python 函数变成网址：函数上贴装饰器，浏览器访问就执行、返回值自动变 JSON
- 三接口：全量列表 `/api/schools`、按 id 单条 `/api/schools/{sid}`、城市统计 `/api/stats`
- `/docs` 可视化测试页——前后端打通的前夜

## 任务（共 3 件）

1. 装 `pip install fastapi uvicorn`，抄 17-1 建 `main.py`
2. `uvicorn main:app --reload` 跑起来，/docs 里把三个接口各点一遍
3. 12/27 前把 main.py 推上仓库

## 17-1 · 思路

FastAPI 就是"把 Python 函数变成网址"——函数上贴一行装饰器，浏览器访问对应网址就执行函数、返回值自动变 JSON。数据先从 clean.csv 读进内存，三个函数三种取法：全量列表、按 id 单条、按城市统计。

```python
# main.py —— M3 三接口雏形
from fastapi import FastAPI
import csv

app = FastAPI()
rows = list(csv.DictReader(open("clean.csv", encoding="utf-8-sig")))
# DictReader：每行变 dict，键=表头——rows 就是 list[dict]

@app.get("/api/schools")                       # 访问 /api/schools 就执行下面的函数
def schools(city: str = ""):                   # city 是可选查询参数 ?city=厦门
    if city:
        return [r for r in rows if r["city"] == city]
    return rows

@app.get("/api/schools/{sid}")                 # {sid} 是路径参数
def school(sid: int):                          # 声明 int，传 abc 自动报 422
    for r in rows:
        if int(r["id"]) == sid:
            return r
    return {"error": "not found"}

@app.get("/api/stats")
def stats():
    d = {}
    for r in rows:
        city = r["city"]
        d[city] = d.get(city, 0) + 1           # 没见过的城市给 0，见过 +1 —— 计数器套路
    return d
```

| 代码 | 意思 |
|---|---|
| `@app.get("/api/schools")` | 装饰器：把函数注册到这个网址上（每日任务 D10 装饰器的实战首秀） |
| `city: str = ""` | 类型标注+默认值 → 自动变成可选查询参数 |
| `"/api/schools/{sid}"` + `sid: int` | 路径里挖坑，函数参数接坑里的值 |
| `d.get(city, 0) + 1` | dict.get 的默认值用法——D05 题同款 |
| `/docs` | FastAPI 自带的接口文档页，所见即所得 |

**验证**：`/api/schools` 出全量 JSON；`/api/schools/1` 出单条；`/api/stats` 出城市计数。

**急救**：`ModuleNotFoundError: fastapi` = 没装包；`Address already in use` = 8000 被占，换 `uvicorn main:app --reload --port 8001`；改了代码没生效 = --reload 没加。

## M3 验收标准（12/27 交）

- [ ] 三接口 /docs 全部 200
- [ ] /api/schools?city=厦门 只返回厦门的行
- [ ] /api/schools/999 返回 {"error": "not found"}
- [ ] main.py 已推仓库

## 过关自查

- [ ] 能说清装饰器干了什么（函数 → 网址）
- [ ] 能说清路径参数 {sid} 和查询参数 ?city= 的区别
- [ ] stats() 里 d.get(city, 0) 为什么不会 KeyError
