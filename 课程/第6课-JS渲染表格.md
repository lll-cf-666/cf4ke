# 第 6 课 · JS 渲染表格（任务卡 15-3）· M4 静态版

> 对应元旦课表【答案 15-3】· 第 15 周前端三次课 · 交 html

## 学什么

- 数据写死在 JS 数组里 → for 循环拼 `<tr>` → 一次塞进 tbody
- 这是 M4 的**静态预演**：先会"数组→表格"，寒假把数组换成 fetch 来的就能无缝升级

## 任务（共 3 件）

1. 抄 15-3 代码跑通，表格 3 行 2 列
2. 变体：data 数组加 3 条，表格自动变 6 行（代码只改数组）
3. 把自己 clean.csv 里 3 所学校填进 data

## 15-3 · 思路

M4 的静态预演——数据先写死在 JS 数组里，for 循环把每条拼成 `<tr>` 字符串，最后一次性塞进 tbody 的 innerHTML。先会"数组→表格"，寒假把数组换成 fetch 来的就能无缝升级。

```html
<table border="1">
  <thead><tr><th>学校</th><th>城市</th></tr></thead>
  <tbody id="tb"></tbody>
</table>

<script>
  const data = [
    { name: "厦门大学", city: "厦门" },
    { name: "闽江学院", city: "福州" },
    { name: "集美大学", city: "厦门" }
  ];
  const tbody = document.querySelector("#tb");
  let html = "";
  for (const s of data) {                            // for...of：遍历数组的值
    html += `<tr><td>${s.name}</td><td>${s.city}</td></tr>`;
  }
  tbody.innerHTML = html;
</script>
```

| 代码 | 意思 |
|---|---|
| `{ name: "...", city: "..." }` | JS 的对象字面量 = Python 的 dict |
| `html += \`...\`` | 模板字符串拼接，`${s.name}` 填值——等价 f-string |
| `tbody.innerHTML = html` | 一次性把 3 行表格 HTML 写进 tbody |

**验证**：打开页面出现 3 行 2 列表格。
**变体**：data 加 3 条，表格自动 6 行——代码只改数组。

## 过关自查

- [ ] 表格渲染 3 行，加数据后 6 行
- [ ] 能说清 for...of 和 for...in 差在哪（值 vs 键）
- [ ] 能说清 `${}` 是谁的语法、对应 Python 什么写法
- [ ] 卡住报错 → 按第 0 课的 Issue 六步提交
