# 第 1 课 · 爬真书站存 CSV + 建 10 校名单（任务卡 14-1 / 14-2）

> 对应元旦课表【答案 14-1 / 14-2】· 第 14 周周一、周四 · 交 py 文件 ×2

## 学什么

- 把第 0 课抓 `example.com` 的套路搬到**真网站**（books.toscrape.com，专门给练习用的书店）
- 学会从 HTML 里**顺着结构找数据**：标签 → 属性 → 往上爬（find_parent）
- 第一次把抓到的数据**存成 CSV 文件**（Excel 能直接打开）
- 学会 Python 的「模块」用法：一个文件存名单，另一个文件 import 它

## 任务（共 3 件）

1. 【14-1】抓 books.toscrape.com 首页 20 本书，书名+价格存进 `books.csv`
2. 【14-2】建 10 所福建高校招生网名单 `urls.py`，再写 `check.py` 逐个探活
3. 两件都跑通后，把 `books.csv` 用 Excel 打开截图

## 14-1 · 思路

L0 的套路整体搬过来，改 3 处——url 换成 books.toscrape.com、find_all 换 h3、最后加 8 行 csv 写文件。书名藏在 `<h3><a title="完整书名">` 的 title 属性里（页面上显示的是被截断的短名，所以取属性不取文字）；价格在同一本书的 `<article>` 里、class 为 price_color 的 `<p>`。

```python
# D14_1.py —— books.toscrape.com 首页 20 本书 → CSV
import requests
from bs4 import BeautifulSoup
import csv

res = requests.get("http://books.toscrape.com", timeout=10)
res.encoding = "utf-8"
soup = BeautifulSoup(res.text, "html.parser")

rows = []
for h3 in soup.find_all("h3"):
    a = h3.find("a")                                  # h3 里套着 <a>
    title = a.get("title")                            # 完整书名在 title 属性
    article = a.find_parent("article")                # 往上找这本的书架 <article>
    price = article.find("p", class_="price_color").get_text()   # class 参数：按类名找
    rows.append([title, price])

with open("books.csv", "w", newline="", encoding="utf-8-sig") as f:
    w = csv.writer(f)
    w.writerow(["书名", "价格"])                      # 表头
    w.writerows(rows)                                 # 一次写全部行

print("已存", len(rows), "行")
```

| 代码 | 意思 |
|---|---|
| `h3.find("a")` | h3 里再往里找第一个 `<a>` |
| `a.get("title")` | 取 title 属性的值（完整书名） |
| `a.find_parent("article")` | 从 a 往上爬，找包含它的 `<article>` |
| `find("p", class_="price_color")` | 在书架范围内按 class 找价格标签（注意是 class_，带下划线，因为 class 是 Python 关键字） |
| `open(..., "w", newline="", encoding="utf-8-sig")` | w=写模式覆盖旧文件；newline="" 防 CSV 空行；utf-8-sig 让 Excel 直接打开不乱码 |
| `w.writerows(rows)` | 列表里每行各写一行 |

**验证**：终端打印 `已存 20 行`；双击 books.csv 用 Excel 打开看到两列表格。

## 14-2 · 思路

名单用列表常量存（校名, 招生网 URL）成对放，一个 for 循环挨个 requests 一次只打状态码——先确认哪些站活着，再决定抓谁。URL 以下课实际搜索为准，模板先占位。

```python
# urls.py —— M1 目标名单（URL 课前用搜索引擎核对，edu 域名优先）
SCHOOLS = [
    ("厦门大学",     "https://zs.xmu.edu.cn"),
    ("福州大学",     "https://jwc.fzu.edu.cn"),
    ("福建师范大学", "https://zsb.fjnu.edu.cn"),
    ("华侨大学",     "https://zsc.hqu.edu.cn"),
    ("集美大学",     "https://zsb.jmu.edu.cn"),
    ("福建农林大学", "https://zsb.fafu.edu.cn"),
    ("福建医科大学", "https://zsb.fjmu.edu.cn"),
    ("闽南师范大学", "https://zsb.mnnu.edu.cn"),
    ("闽江学院",     "https://zsb.mju.edu.cn"),
    ("福建理工大学", "https://zsb.fjut.edu.cn"),
]

# check.py —— 单校连通性检查
import requests
from urls import SCHOOLS          # 从 urls.py 里把名单 import 进来

for name, url in SCHOOLS:
    try:
        r = requests.get(url, timeout=10)
        print(name, r.status_code)
    except Exception as e:
        print(name, "失败:", e)
```

| 代码 | 意思 |
|---|---|
| `from urls import SCHOOLS` | 把另一个文件里的名单搬进来用——这就是"模块"， urls.py 不用跑，只当数据库用 |
| `for name, url in SCHOOLS:` | 列表里每项是 (名字, 网址) 一对，一次拆给两个变量 |
| `try/except Exception as e` | 哪个站挂了程序继续跑下一个，e 里存着出错原因 |

**验证**：10 行输出，200/403 都算活着；超时失败的站先划掉换备选。**403 不是失败**——学校官网常挡脚本，M1 抓取时加 User-Agent 头即可（第 5 课答案里给）。

## 过关自查

- [ ] `books.csv` 打开 20 行 2 列
- [ ] check.py 打印 10 行状态码
- [ ] 能说清：书名为什么不取页面文字而取 title 属性
- [ ] 卡住报错 → 按第 0 课的 Issue 六步提交
