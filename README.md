# cf4ke · 四门专业课统一大纲

**一句话定位**：以期末考试（2027-01-04 ~ 01-08）为锚，四门课不是四件事，是一个项目的四层——信息采集管数据从哪来，数据库管数据存哪，前端管数据怎么给人看，交换路由拿学分顺便懂底层。所有直链指向 GitHub，当字典查，不当书刷。

---

## 0 · 时间底座（校历 + 作息钉死）

- 今天 2026-11-26 = 第 13 周周四；**能上新课的窗口到 12-27（第 17 周末），共 5 周**
- 第 18 周（12/28–1/3）复习周 + 元旦假；**期末 1 月 4–8 日；1 月 9 日放寒假**
- 作息：1–2 节 8:00–9:40 / 3–4 节 9:55–11:35 / 5–6 节 14:30–16:10 / 7–8 节 16:20–18:00 / 9–10 节 19:00–20:40
- 周二晚自习被信息采集晚课占用；**周一/三/四晚自习 19:00–20:40 全空**；周三全天空课；周五 16:10 后自由

---

## 1 · 信息采集技术 · 魏邵杰 · 3 次/周（周一 1–2 / 周四 5–6 / 周二晚 9–10）

**定位**：项目数据层 + Python 主线。教 Python 基础、requests、BeautifulSoup、翻页、存 CSV。

**期末必拿**：requests 用法、bs4 找元素、循环翻页；易丢分：`res.encoding` 编码、选择器写错。

**机上任务（每次课 3 件）**：①当堂例子跑通改 3 处参数 ②每个请求套 `try/except`+重试+sleep ③结果存 CSV/落库。

**GitHub 直链**

| 仓库 | 拿什么 | 何时 |
|---|---|---|
| https://github.com/jackzhenguo/python-small-examples | 中文小例子，每天 5 个跑懂 | 现在起每晚 |
| https://github.com/wistbean/learn_python3_spider | 只看 requests / BeautifulSoup / 反爬基础三章 | 现在起，配课上进度 |
| https://github.com/PyMySQL/PyMySQL | Python 写 MySQL 的驱动，M2 必备 | 第 14 周起 |
| https://github.com/luyishisi/Anti-Anti-Spider | 反爬手段合集，被封锁才查 | 寒假后按需 |

**推进**：M1（爬 10+ 所院校招生数据存 CSV）→ 第 15 周末交；M2（落 MySQL 不重复）→ 第 16 周末交。

---

## 2 · 前端设计与开发 · 陈智敏 · 3 次/周（周二 1–2 / 周四 1–2 / 周一 3–4）

**定位**：项目展示层 + JS 副线。教 HTML/CSS/JS 语法/DOM。**课件缺口：闭包 0 处、DOM 仅 8 处、事件仅 3 处——课上能过考试，做不出能点的页面，缺口自己补。**

**期末必拿**：JS 基础语法、流程控制、函数、数组对象（课件最厚）；操作题考 DOM/事件。

**机上任务**：①当堂手敲 + Live Server 预览 ②F12 控制台改元素文字颜色 ③`querySelector` + `addEventListener` 各写 3 遍 + 表单取值校验。

**GitHub 直链**

| 仓库 | 拿什么 | 何时 |
|---|---|---|
| https://github.com/javascript-tutorial/zh.javascript.info | 现代 JS 教程官方中文，「浏览器：文档/事件」两章补缺口 | 现在起每周四晚 |
| https://github.com/lydiahallie/javascript-questions | JS 习题（README-zh_CN.md 中文版），错题记 stuck.md | 每周 5 题 |
| https://github.com/mqyqingfeng/Blog | 冴羽深度系列：this/闭包/原型/call·apply 四篇 | 周日精读 |
| https://github.com/30-seconds/30-seconds-of-code | 代码片段速查 | 写页面时查 |

**推进**：M4（fetch 接口 → 渲染表格）排寒假第 3–4 周；期末考完立刻无缝接。

---

## 3 · 数据库技术与应用 · 梁智锋 · 2 次/周（周二 3–4 / 周四 7–8）

**定位**：项目存储层。SQL 是面试 100% 会问的硬门槛，这门课白送 30+ 小时。

**期末必拿**：增删改查、WHERE、GROUP BY、多表 JOIN；易丢分：外键约束、NULL 比较、聚合+GROUP BY 混用。

**机上任务**：①当堂 SQL **手敲**跑通（禁复制粘贴）②对当堂表写 WHERE / ORDER BY+LIMIT / GROUP BY 各一条 ③pymysql 每次课连一条 ④CSV 导表跑两遍确认不重复。

**GitHub 直链**

| 仓库 | 拿什么 | 何时 |
|---|---|---|
| https://github.com/datacharmer/test_db | 官方 employees 示例库（10 万+ 行真数据），练 JOIN/GROUP BY | 第 14 周导入 |
| https://github.com/PyMySQL/PyMySQL | Python ↔ MySQL 那一环 | 第 14 周跑通 |
| https://github.com/CyC2018/CS-Notes | notes/MySQL.md 面试向笔记 | 寒假起 |

**推进**：M2 用这门课的知识落库（建表 SQL 在《课表对齐版》第三章， schools + majors 两张表直接抄）。

---

## 4 · 交换路由技术 · 李纪君 · 1 次/周（周一 7–8）

**定位**：辅课。态度 = 拿学分 + 混脸熟，不追加投入。网络底层知识对爬虫（HTTP/DNS）有隐性帮助。

**机上任务**：①Packet Tracer 当堂拓扑搭一遍 ②`ping`/`ipconfig`/`tracert` 验证连通 ③当堂命令记笔记。

**GitHub 直链**

| 仓库 | 拿什么 | 何时 |
|---|---|---|
| https://github.com/GNS3/gns3-gui | GNS3 模拟器（比 Packet Tracer 真实，想多学再装） | 按需 |

---

## 5 · 一周时间盘（第 13–17 周）

| 时段 | 给谁 |
|---|---|
| 机房 9 段课 | 当堂消化，3 任务走完不摸鱼 |
| 周一晚 19:00–20:40 | 信息采集：python-small-examples 5 例 |
| 周三全天空课 | **项目主战场**：M1/M2 + learn_python3_spider 配套章节 |
| 周四晚 19:00–20:40 | 前端：zh.javascript.info 补 DOM/事件 + javascript-questions 5 题 |
| 周五 16:10 后 | 数据库：test_db 导入 + JOIN + pymysql 全流程 |
| 周六 4–5h | FastAPI 提前起步（M3 接口雏形） |
| 周日 4–5h | 复盘 + mqyqingfeng/Blog 深度文 |

第 16–17 周：项目收尾进期末预热；第 18 周：复习周+元旦，课件例题全手敲、自出 10 题/门闭卷做。

---

## 6 · 里程碑总表

| 里程碑 | 交给谁 | 截止 |
|---|---|---|
| M1 抓：爬 10+ 所院校存 CSV | 信息采集 | 12-13（第 15 周末） |
| M2 存：MySQL 建表写库不重复 | 数据库 | 12-20（第 16 周末） |
| 期末四门全过 | 学校 | 2027-01-04 ~ 08 |
| M3 接口：FastAPI 三 GET | 自学 | 2027-01-24 |
| M4 展示：fetch 渲染表格 | 前端 | 2027-02-07 |
| M5 串：一条命令跑通全链 | 全部 | 2027-02-21 |

M3 的接口定义：`GET /api/schools`（列表+筛选）、`GET /api/schools/{id}`（详情）、`GET /api/stats`（按城市统计），FastAPI 中文文档 https://fastapi.tiangolo.com/zh/ ，仓库 https://github.com/tiangolo/fastapi

---

## 7 · 寒假换档（1/9 之后）

| 内容 | 直链 |
|---|---|
| M3/M4/M5 冲刺 | tiangolo/fastapi |
| RAG / AI 方向铺垫 | https://github.com/langchain-ai/rag-from-scratch · https://github.com/infiniflow/ragflow |
| 反爬进阶 | luyishisi/Anti-Anti-Spider（被封锁才看） |
| 数据库面试 | CyC2018/CS-Notes |

---

## 8 · 本文件夹索引

| 文件 | 内容 |
|---|---|
| README.md（本文件） | 四门课统一大纲 + 直链 + 时间盘 + 里程碑 |
| 课表对齐版-三门课怎么拧成一条线.md | 校历/作息/课表对齐的完整论证与逐周安排 |
| 机房与空余-直链学习地图.md | 机上任务明细 + 空余时段直链用法 |
| 第0课-信息采集-第一次抓网页.md | 手把手：PyCharm 建项目→装 requests/bs4→抓 example.com 逐行解析→报错急救→练手改造（45min） |
| 第0课-前端-第一次让网页动起来.md | 手把手：VSCode 建 index.html→点击计数器 querySelector/addEventListener 逐行解析→F12 控制台→报错急救→练手改造（45min） |
| 每日任务/（引用 D:\study\双语言\每日任务） | Py/JS 14 天对照题包 84 题 |

两条铁律：**机房课上不碰别的**；**GitHub 当字典不当书——打开仓库前先想清楚要拿什么**。
