# cf4ke · 四门课 · 一个项目

**期末 2027-01-04 ~ 01-08。四门课不是四件事，是一个项目的四层：信息采集管数据从哪来，数据库管存哪，前端管怎么给人看，交换路由拿学分顺便懂底层。**

---

## 0 · 时间底座

- 今天 2026-11-26 = 第 13 周周四；**新课窗口到 12-27，共 5 周**
- 第 18 周（12/28–1/3）复习周 + 元旦；**期末 1/4–1/8，1/9 放寒假**
- 空余：**周一/三/四晚 19:00–20:40 全空**；周三全天空课；周五 16:10 后自由

---

## 1 · 信息采集 · 魏邵杰 · 3 次/周（周一 1–2 / 周四 5–6 / 周二晚）

- **定位**：数据层 + Python 主线（requests / BeautifulSoup / 翻页 / 存 CSV）
- **期末必拿**：requests、bs4 找元素、循环翻页；易丢分：`res.encoding`、选择器写错
- **机上任务**：①当堂例子跑通改 3 处参数 ②每个请求套 `try/except`+重试+sleep ③结果存 CSV/落库
- **推进**：M1 第 15 周末交（12-13）→ M2 第 16 周末交（12-20）

| 仓库 | 拿什么 |
|---|---|
| [python-small-examples](https://github.com/jackzhenguo/python-small-examples) | 中文小例子，每晚 5 个 |
| [learn_python3_spider](https://github.com/wistbean/learn_python3_spider) | 系列06 当当 / 系列07 豆瓣 / 24 CSV / 25 MySQL |
| [PyMySQL](https://github.com/PyMySQL/PyMySQL) | Python ↔ MySQL，M2 必备 |
| [Anti-Anti-Spider](https://github.com/luyishisi/Anti-Anti-Spider) | 被封锁才查 |

---

## 2 · 前端 · 陈智敏 · 3 次/周（周二 1–2 / 周四 1–2 / 周一 3–4）

- **定位**：展示层 + JS 副线。**课件缺口：闭包 0 处、DOM 仅 8 处、事件仅 3 处——课上能过考试，做不出能点的页面，缺口自己补。**
- **期末必拿**：JS 语法 / 流程控制 / 函数 / 数组对象；操作题考 DOM/事件
- **机上任务**：①手敲 + Live Server 预览 ②F12 改元素文字颜色 ③`querySelector`+`addEventListener` 各 3 遍 + 表单校验
- **推进**：M4 排寒假第 3–4 周（02-07），期末考完无缝接

| 仓库 | 拿什么 |
|---|---|
| [zh.javascript.info](https://zh.javascript.info) | 现代教程中文，浏览器文档/事件两章补缺口（仓库只查目录，阅读走网站） |
| [javascript-questions](https://github.com/lydiahallie/javascript-questions) | 每周 5 题，错题记 stuck.md |
| [mqyqingfeng/Blog](https://github.com/mqyqingfeng/Blog) | 周日精读：this / 闭包 / 原型 |
| [30-seconds-of-code](https://github.com/30-seconds/30-seconds-of-code) | 片段速查，当字典 |

---

## 3 · 数据库 · 梁智锋 · 2 次/周（周二 3–4 / 周四 7–8）

- **定位**：存储层。SQL 面试 100% 会问，这门课白送 30+ 小时
- **期末必拿**：增删改查 / WHERE / GROUP BY / JOIN；易丢分：外键、NULL 比较、聚合混用
- **机上任务**：①SQL **手敲**（禁复制粘贴）②对当堂表写 WHERE / ORDER BY+LIMIT / GROUP BY ③pymysql 每课连一条 ④CSV 导表跑两遍不重复
- **推进**：M2 用这门课落库（建表 SQL 抄《课表对齐版》第三章 schools + majors）

| 仓库 | 拿什么 |
|---|---|
| [test_db](https://github.com/datacharmer/test_db) | employees 示例库 30 万行，练 JOIN/GROUP BY，第 14 周导入 |
| [PyMySQL](https://github.com/PyMySQL/PyMySQL) | 第 14 周跑通 |
| [CS-Notes](https://github.com/CyC2018/CS-Notes) | `notes/MySQL.md` 面试向，寒假起 |

---

## 4 · 交换路由 · 李纪君 · 1 次/周（周一 7–8）

- **定位**：辅课，拿学分 + 混脸熟，不追加投入
- **机上任务**：①Packet Tracer 当堂拓扑搭一遍 ②`ping`/`ipconfig`/`tracert` 验证 ③命令记笔记

| 仓库 | 拿什么 |
|---|---|
| [gns3-gui](https://github.com/GNS3/gns3-gui) | 想多学再装的模拟器，按需 |

---

## 5 · 一周时间盘（第 13–17 周）

| 时段 | 干什么 |
|---|---|
| 机房 9 段课 | 当堂消化，3 任务走完不摸鱼 |
| 周一晚 | python-small-examples 5 例 |
| 周三全天空课 | **项目主战场**：M1/M2 + 爬虫教程配套章节 |
| 周四晚 | zh.javascript.info 补 DOM/事件 + 刷题 5 道 |
| 周五 16:10 后 | test_db 导入 + JOIN + pymysql 全流程 |
| 周六 4–5h | FastAPI 提前起步（M3 雏形） |
| 周日 4–5h | 复盘 + Blog 深度文 |

第 16–17 周收尾进期末预热；第 18 周复习：课件例题全手敲、自出 10 题/门闭卷做。

---

## 6 · 里程碑

| 里程碑 | 交谁 | 截止 |
|---|---|---|
| M1 抓：爬 10+ 院校存 CSV | 信息采集 | 12-13 |
| M2 存：MySQL 落库不重复 | 数据库 | 12-20 |
| 期末四门全过 | 学校 | 01-04 ~ 08 |
| M3 接口：FastAPI 三 GET | 自学 | 2027-01-24 |
| M4 展示：fetch 渲染表格 | 前端 | 2027-02-07 |
| M5 串：一条命令跑通全链 | 全部 | 2027-02-21 |

M3 接口：`GET /api/schools`（列表+筛选）、`GET /api/schools/{id}`（详情）、`GET /api/stats`（按城市统计）。文档 [fastapi.tiangolo.com/zh](https://fastapi.tiangolo.com/zh/)。

---

## 7 · 寒假换档（1/9 之后）

| 内容 | 直链 |
|---|---|
| M3/M4/M5 冲刺 | [tiangolo/fastapi](https://github.com/tiangolo/fastapi) |
| RAG / AI 铺垫 | [rag-from-scratch](https://github.com/langchain-ai/rag-from-scratch) · [ragflow](https://github.com/infiniflow/ragflow) |
| 反爬进阶 | [Anti-Anti-Spider](https://github.com/luyishisi/Anti-Anti-Spider)（被封锁才看） |
| 数据库面试 | [CS-Notes](https://github.com/CyC2018/CS-Notes) |

---

## 8 · 文件索引（不知道看哪个？按这个顺序）

| 顺序 | 文件 | 什么时候看 |
|---|---|---|
| 1️⃣ | **元旦前课表-逐周逐课.md** | **每天早上先开**——今天哪节课、干什么，全在一张表 |
| 2️⃣ | **课程/第1课~第10课**（12 份独立教学卡） | 每节课跟着任务卡走：目标+思路+答案代码+逐行意思表+验证+过关自查 |
| 3️⃣ | 两份第0课 | 课表让你跑第 0 课时跟着敲 |
| 4️⃣ | 课表对齐版 | 想知道"为什么这么排"再翻 |
| 5️⃣ | 直链学习地图 | 空余时间找 GitHub 直链时查 |
| 6️⃣ | 网站方案 / 交作业登记 | 忘了怎么交作业/取材料时查 |

**两条铁律：机房课上不碰别的；GitHub 当字典不当书。**
