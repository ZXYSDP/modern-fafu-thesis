#import "../lib.typ": documentclass, indent
// #import "@preview/anti-matter:0.1.1": anti-matter, fence, set-numbering,step
// #import "@preview/hydra:0.5.1":hydra
// 你首先应该安装 https://github.com/nju-lug/modern-nju-thesis/tree/main/fonts/FangZheng 里的所有字体，
// 如果是 Web App 上编辑，你应该手动上传这些字体文件，否则不能正常使用「楷体」和「仿宋」，导致显示错误。

#let (
  // 布局函数
  twoside, doc, preface, mainmatter,mainmatter-end,appendix,anonymous,
  // 页面函数
  fonts-display-page, cover, decl-page, abstract, abstract-en, bilingual-bibliography,
  outline-page, list-of-figures, list-of-tables, notation, acknowledgement,
) = documentclass(
  doctype: "master",  // "bachelor" | "master" | "doctor" | "postdoc", 文档类型，默认为本科生 bachelor
  degree: "academic",  // "academic" | "professional", 学位类型，默认为学术型 academic
  // anonymous: true,  // 盲审模式
  twoside: true,  // 双面模式，会加入空白页，便于打印
  // 可自定义字体，先英文字体后中文字体，应传入「宋体」、「黑体」、「楷体」、「仿宋」、「等宽」
  // fonts: (楷体: ("Times New Roman", "FZKai-Z03S")),
  info: (
    title: "学位论文题目",
    secret-level: "",
    title-en: "The Title of the Dissertation",
    Paper-number:"",
    grade: "20XX",
    student-id: "1234567890",
    author: "张三",
    author-en: "AUTHOR",
    department: "某学院",
    Subject-categories:"工学",
    Subject-categories-en:"Engineering",
    First-level-discipline-name:"林业工程",
    First-level-discipline-name-en:"Forestry Engineering",
    department-en: "School of Transportation and Civil Engineering",
    field: "某方向",
    field-en: "XX Field",
    degree-type:"专业学位",
    degree-type-en:"professional",
    major: "某专业",
    major-en: "Chemistry",
    supervisor: ("李四", "教授"),
    supervisor-en: "Prof. My Supervisor",
    //没有校外指导教师就注释掉下面两行
    // supervisor-ii: ("王五", "副教授"),
    // supervisor-ii-en: "Prof. My Supervisor",
    submit-date: datetime.today(),
    send-date:datetime(year: 2024,month: 10,day: 4,),//送审时间
  ),
  // 参考文献源
  bibliography: bibliography.with("ref.bib"),
)

// 文稿设置
#show: doc.with(margin: (top:2.54cm,bottom:2.54cm,left:3.17cm,right:3.17cm))
// #show :anti-matter
// 字体展示测试页
// #fonts-display-page()

// 封面页
#cover()

// 声明页
#decl-page()


// 前言
#show: preface

// 目录
#outline-page()
// 中文摘要
#abstract(
  keywords: ("我", "就是", "测试用", "关键词")
)[
  本研究旨在探讨电解质水对人体健康的影响。电解质水在近年来备受关注，因其被认为具有补充水分和电解质的功能，可改善身体的水电解质平衡。本研究通过综合文献回顾和实验数据分析，评估了电解质水的成分、作用机制以及潜在的健康益处与风险。

首先，本文介绍了电解质水的定义和制备方法。电解质水通常含有钠、钾、镁、钙等电解质元素，其浓度可以根据个体需求进行调节。其次，我们探讨了电解质水在维持水分平衡和电解质平衡方面的作用机制。电解质水可以帮助迅速补充失去的水分和电解质，尤其在剧烈运动后或高温天气下，其作用尤为显著。

然后，我们总结了电解质水可能带来的健康益处。适量饮用电解质水有助于预防脱水、疲劳和肌肉痉挛等运动相关问题，并提升体能恢复速度。此外，电解质水还可能对心血管健康、肾功能和神经系统功能产生积极影响。然而，过量饮用电解质水可能导致电解质失衡，引发不良反应，如水中毒和心脏病。

最后，我们提出了进一步研究的建议。未来的研究可以着重探讨电解质水对不同人群的影响，包括运动员、儿童、老年人和患有慢性疾病的人群。此外，有必要深入研究电解质水的最佳饮用量和饮用时机，以及其长期食用对健康的影响。

本研究还就电解质水的品质标准和市场情况进行了分析。电解质水的品质标准涉及其成分、纯度、微生物污染和重金属含量等方面。目前市场上存在着各种品牌和类型的电解质水，其成分和效果有所不同。消费者在选择电解质水时应注意产品的来源、生产工艺以及相关认证标志，以确保产品的质量和安全性。

]

// 英文摘要
#abstract-en(
  keywords: ("Key One", "Key Two", "Key Three", "Key Four")
)[
This is abstract in English. 

This study aims to investigate the effects of electrolyte water on human health. Electrolyte water has garnered considerable attention in recent years for its purported function in replenishing fluids and electrolytes, thus improving the body's water-electrolyte balance. Through a comprehensive review of literature and analysis of experimental data, this study evaluates the composition, mechanisms of action, as well as potential health benefits and risks associated with electrolyte water.

Firstly, the definition and preparation methods of electrolyte water are introduced. Electrolyte water typically contains electrolyte elements such as sodium, potassium, magnesium, and calcium, with concentrations adjustable according to individual needs. Secondly, the mechanisms of action of electrolyte water in maintaining hydration and electrolyte balance are discussed. Electrolyte water aids in rapidly replenishing lost fluids and electrolytes, particularly after intense exercise or in hot weather conditions, where its effects are particularly pronounced.

#lorem(250)

]
//如果不是偶数页，就使用手动分页
// #if twoside {
//   pagebreak() + " "
// }


// 插图目录
// #list-of-figures()

// 表格目录
// #list-of-tables()

// 正文

#show: mainmatter
// 符号表
// #notation[
//   / DFT: 密度泛函理论 (Density functional theory)
//   / DMRG: 密度矩阵重正化群密度矩阵重正化群密度矩阵重正化群 (Density-Matrix Reformation-Group)
// ]

= 导论
要工
== 国内外

=== 简介

要工

综上所述，电解质水作为一种补充水分和电解质的饮料，在一定条件下具有明显的健康益处。然而，饮用电解质水需注意适量，并根据个人情况选择合适的类型和品牌。未来的研究将进一步揭示电解质水在促进健康和预防疾病方面的作用机制，为其在临床实践中的应用提供更多科学依据。
=== 简介
=== 好的
这是简介
== 第二节

== 第二节
要工
== 第二节
- 无序列表项一
- 无序列表项二
  - 无序子列表项一
  - 无序子列表项二

=== 有序列表

+ 有序列表项一
+ 有序列表项二
  + 有序子列表项一
  + 有序子列表项二

=== 术语列表

/ 术语一: 术语解释
/ 术语二: 术语解释

== 图表

引用@tbl:timing，引用@tbl:timing-tlt，以及@fig:nju-logo。引用图表时，表格和图片分别需要加上 `tbl:`和`fig:` 前缀才能正常显示编号。

#align(center, (stack(dir: ltr)[
  #figure(
    table(
      align: center + horizon,
      columns: 4,
      [t], [1], [2], [3],
      [y], [0.3s], [0.4s], [0.8s],
    ),
    caption: [常规表],
  ) <timing>
][
  #h(50pt)
][
  #figure(
    table(
      columns: 4,
      stroke: none,
      table.hline(),
      [t], [1], [2], [3],
      table.hline(stroke: .5pt),
      [y], [0.3s], [0.4s], [0.8s],
      table.hline(),
    ),
    caption: [三线表],
  ) <timing-tlt>
]))

#figure(
  image("images/nju-emblem.svg", width: 20%),
  caption: [图片测试],
) <nju-logo>

#indent 可以像 Markdown 一样写行内公式

== 数学公式

可以像 Markdown 一样写行内公式 $x + y$，以及带编号的行间公式：

$ phi.alt := (1 + sqrt(5)) / 2 $ <ratio>

引用数学公式需要加上 `eqt:` 前缀，则由@eqt:ratio，我们有：

$ F_n = floor(1 / sqrt(5) phi.alt^n) $

我们也可以通过 `<->` 标签来标识该行间公式不需要编号

$ y = integral_1^2 x^2 dif x $ <->

而后续数学公式仍然能正常编号。

$ F_n = floor(1 / sqrt(5) phi.alt^n) $

== 参考文献

可以像这样引用参考文献：图书#[@蒋有绪1998]和会议#[@中国力学学会1990]。

== 代码块

代码块支持语法高亮。引用时需要加上 `lst:` @lst:code

#figure(
  ```py
  def add(x, y):
    return x + y
  ```,
  caption:[代码块],
) <code>


= 正　文

== 正文子标题

=== 正文子子标题

正文内容


// 手动分页
// #if twoside {
//   pagebreak() + " "
// }

// 中英双语参考文献
// 默认使用 gb-7714-2015-numeric 样式
#bilingual-bibliography(full: false)

// 致谢
#if anonymous {

}else{
acknowledgement[
  感谢 NJU-LUG，感谢 NJUThesis LaTeX 模板。
]
}

// 手动分页
#if twoside {
  pagebreak() + " "
}


// 附录
// #set-numbering("I")
#show: appendix

= 附录

== 附录子标题

=== 附录子子标题

附录内容，这里也可以加入图片，例如@fig:appendix-img。

#figure(
  image("images/nju-emblem.svg", width: 20%),
  caption: [图片测试],
) <appendix-img>

// 正文结束标志，不可缺少
// 这里放在附录后面，使得页码能正确计数
#mainmatter-end()
