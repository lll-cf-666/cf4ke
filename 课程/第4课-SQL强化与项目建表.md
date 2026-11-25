# 第 4 课 · SQL 强化 + 项目表 school/majors（任务卡 14-7 / 14-8）

> 对应元旦课表【答案 14-7 / 14-8】· 第 14 周周二 3-4、周四 7-8（数据库）· 交 SQL 截图

## 学什么

- INSERT 批量插、WHERE 筛行、ORDER BY 排行、LIMIT 掐头尾
- **外键**：两张表怎么靠一个 id 连起来
- 建出项目的正式表：school（学校）+ majors（专业），M1/M2 的落点就是它

## 任务（共 3 件）

1. 【14-7】在 lesson 库 t1 表插 20 行，跑通 WHERE 三连 + ORDER BY 两条
2. 【14-8】建 fzix 库的 school + majors 两张表，插样例数据
3. 两段都跑通后 Workbench 截图

## 14-7 · 思路

接着第 0 课的 t1 表玩——20 行插入练手感，三条查询各练一个关键字。WHERE 是"筛行"，ORDER BY 是"排行"，LIMIT 是"掐头尾"。

```sql
USE lesson;

-- 1) 插 20 行：INSERT 一条多行 VALUES 的写法，逗号分隔
INSERT INTO t1 (name) VALUES
('厦门大学'), ('福州大学'), ('福建师范大学'), ('华侨大学'), ('集美大学'),
('福建农林大学'), ('福建医科大学'), ('闽南师范大学'), ('闽江学院'), ('福建理工大学'),
('武夷学院'), ('莆田学院'), ('泉州师范学院'), ('三明学院'), ('龙岩学院'),
('宁德师范学院'), ('福建商学院'), ('厦门理工学院'), ('闽西职业技术学院'), ('黎明职业大学');

-- 2) WHERE：按条件筛行，% 是通配符
SELECT * FROM t1 WHERE name LIKE '%学院%';      -- 名字带"学院"的
SELECT * FROM t1 WHERE id <= 5;                 -- id 不超过 5 的
SELECT * FROM t1 WHERE name = '厦门大学';       -- 精确等于（SQL 里 = 一个等号）

-- 3) ORDER BY + LIMIT：排序再掐
SELECT * FROM t1 ORDER BY id DESC LIMIT 3;      -- 按 id 倒序取前 3（最新的 3 行）
SELECT * FROM t1 ORDER BY name ASC;             -- 按名字正序全表
```

| 语句 | 意思 |
|---|---|
| `LIKE '%学院%'` | 模糊匹配：名字中间任意位置含"学院" |
| `ORDER BY id DESC` | DESC 降序；ASC 升序（默认） |
| `LIMIT 3` | 只返回前 3 行 |

**验证**：三条 WHERE 各返回不同行数；倒序前 3 是 id=20,19,18。

## 14-8 · 思路

一张表存学校（一行一所），一张表存专业（一行一个专业，用 school_id 指回它属于谁）——这就是"外键"，两张表靠它连起来。这张表就是 M1/M2 的落点，SQL 直接抄。

```sql
CREATE DATABASE IF NOT EXISTS fzix DEFAULT CHARSET utf8mb4;
USE fzix;

CREATE TABLE school (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL UNIQUE,     -- UNIQUE：校名不许重复，M2 防重复就靠它
  city VARCHAR(50),
  type VARCHAR(20),
  url VARCHAR(200)
);

CREATE TABLE majors (
  id INT PRIMARY KEY AUTO_INCREMENT,
  school_id INT,                          -- 外键：指向 school 表的 id
  major VARCHAR(100),
  FOREIGN KEY (school_id) REFERENCES school(id)
);

INSERT INTO school (name, city, type, url) VALUES
('厦门大学', '厦门', '本科', 'https://zs.xmu.edu.cn'),
('闽江学院', '福州', '本科', 'https://zsb.mju.edu.cn');

INSERT INTO majors (school_id, major) VALUES
(1, '计算机科学与技术'), (1, '软件工程'), (2, '软件工程');
```

| 代码 | 意思 |
|---|---|
| `UNIQUE` | 数据库替你挡重复，同名校插第二次直接报错 |
| `FOREIGN KEY ... REFERENCES school(id)` | majors.school_id 必须是 school 里真实存在的 id，插不存在的会报错 |
| `INSERT INTO majors ... (1, ...)` | 1 就是厦门大学刚自增出来的 id |

**验证**：`SELECT * FROM school;` 2 行；`SELECT * FROM majors;` 3 行。

## 过关自查

- [ ] t1 表 23 行（第 0 课 3 行 + 这课 20 行）
- [ ] fzix 库两张表建好，样例数据查得到
- [ ] 能说清 UNIQUE 和 FOREIGN KEY 各挡什么
- [ ] 卡住报错 → 按第 0 课的 Issue 六步提交
