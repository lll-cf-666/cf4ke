# 第 3 课 · 三色按钮事件 + fetch 初体验（任务卡 14-5 / 14-6）

> 对应元旦课表【答案 14-5 / 14-6】· 第 14 周周二 1-2、周四 1-2（前端）· 交 html ×2

## 学什么

- 同一套逻辑绑给多个按钮（事件是 JS 的核心玩法）
- `fetch`：JS 里的 requests——发请求、拿数据、上页面
- 第一次接触**异步**：fetch 不等结果就往下跑，用 `.then()` 排队

## 任务（共 3 件）

1. 【14-5】红绿蓝重置四个按钮，点谁标题变谁的颜色
2. 【14-6】点按钮 fetch httpbin.org/json，把标题取出来显示
3. 变体：升级成函数版绑定（选做，体会"逻辑只写一次"）

## 14-5 · 思路

四个按钮同一个套路各绑一次——事件里只干一件事 `h1.style.color = 某颜色`。写完再升级成函数版（一项变体练习），体会"同样的逻辑只写一次"。

```html
<button id="red">红</button>
<button id="green">绿</button>
<button id="blue">蓝</button>
<button id="reset">重置</button>
<h1 id="count">会变色的标题</h1>

<script>
  const h1 = document.querySelector("#count");

  // 基础版：四段各写各的
  document.querySelector("#red").addEventListener("click", function () {
    h1.style.color = "red";
  });
  document.querySelector("#green").addEventListener("click", function () {
    h1.style.color = "green";
  });
  document.querySelector("#blue").addEventListener("click", function () {
    h1.style.color = "blue";
  });
  document.querySelector("#reset").addEventListener("click", function () {
    h1.style.color = "black";
  });

  // 升级版（选做）：一个函数生成四种绑法，逻辑只写一次
  // function setColor(color) {
  //   return function () { h1.style.color = color; };
  // }
  // document.querySelector("#red").addEventListener("click", setColor("red"));
</script>
```

**验证**：四个按钮各点一遍标题换四种颜色。

## 14-6 · 思路

fetch 是 JS 里 requests 的对应物——发请求拿数据。区别：fetch 不等结果先把后面的代码跑掉，所以用 `.then()` 排队——第一个 then 把响应转成 JSON，第二个 then 拿着数据用。这就是"异步"：Python 课 asyncio 那章的 JS 亲戚。

```html
<button id="load">取数据</button>
<h1 id="out">还没取</h1>

<script>
  const out = document.querySelector("#out");
  document.querySelector("#load").addEventListener("click", function () {
    fetch("https://httpbin.org/json")                    // 1. 发请求
      .then(function (r) { return r.json(); })           // 2. 响应转成 JS 对象
      .then(function (d) {                               // 3. d 就是数据对象
        console.log(d);                                  // 先整个看一眼结构
        out.textContent = d.slideshow.title;             // 按结构取字段显示
      });
  });
</script>
```

| 代码 | 意思 |
|---|---|
| `fetch(url)` | 发请求，立刻返回"还没完成的承诺"（Promise） |
| `r.json()` | 把响应体解析成对象（对应 Python 的 `r.json()`） |
| `d.slideshow.title` | 按层取字段：d.slideshow 是子对象，.title 是它的标题字段 |
| `console.log(d)` | F12 → Console 查看完整结构再决定取哪个字段 |

**验证**：点按钮 → 标题变 `Sample Slide Show`。

## 过关自查

- [ ] 四个按钮四个颜色全生效
- [ ] fetch 按钮 3 秒内把标题顶出来
- [ ] 能说清：fetch 之后为什么要接两个 `.then()`
- [ ] 卡住报错 → 按第 0 课的 Issue 六步提交
