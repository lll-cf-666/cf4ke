# 第 2 课 · 翻页爬取 + DOM 取值与输入回显（任务卡 14-3 / 14-4）

> 对应元旦课表【答案 14-3 / 14-4】· 第 14 周周二晚（信息采集）、周一 3-4（前端）· 交 py + html

## 学什么

- **翻页**：URL 有规律时用循环+格式化把"抓一页"变成"抓 N 页"
- **前端**：querySelector 三种找法（#id / 标签 / .class）一次练全
- **回显**：读输入框的 `.value`，写进标题的 `.textContent`——一读一写，DOM 就通了

## 任务（共 3 件）

1. 【14-3】翻页抓 books.toscrape 前 3 页共 60 本，存 `books_3pages.csv`
2. 【14-4】做一个输入框 + 按钮，点按钮把输入的内容显示到标题
3. 变体：再加一个按钮，点击后清空输入框

## 14-3 · 思路

观察规律——books.toscrape 第 2 页 URL 是 `/catalogue/page-2.html`，唯一变量是数字。把"抓一页"的代码塞进 for 循环，数字从 1 换到 3，每页之间 sleep 1 秒别把人家服务器打疼。

```python
# D14_3.py —— 翻页抓 3 页共 60 本
import requests, time, csv
from bs4 import BeautifulSoup

rows = []
base = "http://books.toscrape.com/catalogue/page-{}.html"   # {} 是坑位

for p in range(1, 4):              # 1, 2, 3
    url = base.format(p)           # 坑位填上数字 → 完整 URL
    res = requests.get(url, timeout=10)
    soup = BeautifulSoup(res.text, "html.parser")
    for h3 in soup.find_all("h3"):
        a = h3.find("a")
        article = a.find_parent("article")
        price = article.find("p", class_="price_color").get_text()
        rows.append([f"page{p}", a.get("title"), price])   # f-string 把页码拼进去
    time.sleep(1)                  # 每页之间歇 1 秒

with open("books_3pages.csv", "w", newline="", encoding="utf-8-sig") as f:
    w = csv.writer(f)
    w.writerow(["页码", "书名", "价格"])
    w.writerows(rows)

print("共", len(rows), "行")
```

| 代码 | 意思 |
|---|---|
| `"page-{}.html".format(p)` | `{}` 占位符被 format 填成 p——和 f-string 等价 |
| `range(1, 4)` | 产生 1,2,3（包左不包右，想要 4 得写 range(1,5)） |
| `time.sleep(1)` | 暂停 1 秒，礼貌爬取 |

**验证**：`共 60 行`；CSV 里页码列 page1/page2/page3 各 20 行。

## 14-4 · 思路

querySelector 三种找法（#id / 标签名 / .class）各练一遍；回显 = 读输入框的 `.value` 写到 h1 的 `.textContent`。读 value、写 textContent——一个方向读、一个方向写，这对概念通了 DOM 就通了。

```html
<input id="box" type="text">
<button id="btn">显示</button>
<h1 id="out"></h1>
<p class="tip">三连练习：下面三个变量分别用三种方式找元素</p>

<script>
  // 三连：三种选择器
  const byId    = document.querySelector("#out");    // # 开头 = 按 id
  const byTag   = document.querySelector("input");   // 直接写标签名 = 第一个该标签
  const byClass = document.querySelector(".tip");    // . 开头 = 按 class

  const box = document.querySelector("#box");
  const btn = document.querySelector("#btn");

  btn.addEventListener("click", function () {
    byId.textContent = box.value;                    // 读输入框 value，写进标题
  });
</script>
```

**验证**：输入"YG 是最棒的"点按钮 → 标题变这句话。
**变体**：再加一个按钮，点击后清空输入框（`box.value = ""`）。

## 过关自查

- [ ] books_3pages.csv 60 行，page1/2/3 各 20
- [ ] 回显页面能把你输入的话顶到标题上
- [ ] 能说清 `.value` 和 `.textContent` 谁是读谁是写
- [ ] 卡住报错 → 按第 0 课的 Issue 六步提交
