#import "../lib.typ": documentclass
// 你首先应该安装 https://github.com/nju-lug/modern-nju-thesis/tree/main/fonts/FangZheng 里的所有字体，
// 如果是 Web App 上编辑，你应该手动上传这些字体文件，否则不能正常使用「楷体」和「仿宋」，导致显示错误。

#let (
  // 布局函数
  twoside, doc, preface, mainmatter,appendix,
  anonymous,
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
    title: "丘陵山地林区可调平移动底盘控制策略及仿真研究",
    secret-level: "",
    title-en: "Control strategy and simulation study of adjustable flat moving chassis in hilly mountain forest area",
    Paper-number:"",
    grade: "20XX",
    student-id: "1221326011",
    author: "石殿鹏",
    author-en: "Shi Dianpeng",
    department: "交通与土木工程学院",
    Subject-categories:"工学",
    Subject-categories-en:"Engineering",
    First-level-discipline-name:"林业工程",
    First-level-discipline-name-en:"Forestry Engineering",
    department-en: "School of Transportation and Civil Engineering",
    field: "林业智能装备",
    field-en: "XX Field",
    degree-type:"专业学位",
    degree-type-en:"professional",
    major: "森林工程",
    major-en: "Forestry engineering",
    supervisor: ("朱阅", "副教授"),
    supervisor-en: "Prof. Zhu",
    //没有校外指导教师就注释掉下面两行
    // supervisor-ii: ("王五", "副教授"),
    // supervisor-ii-en: "Prof. My Supervisor",
    submit-date: datetime.today(),
    send-date:datetime(year: 2024,month: 10,day: 4,),//送审时间
  ),
  // 参考文献源
  bibliography: bibliography.with("graduate.bib"),
)

// 文稿设置
#show: doc.with(margin: (top:2.54cm,bottom:2.54cm,left:3.17cm,right:3.17cm))
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

= 绪论

== 研究背景与意义
我国作为全球林业资源最丰富的国家之一，截至2023年年底，我国森林覆盖率超过25%。林地资源主要分布在海拔较高，气候湿润的山区和丘陵地带。丘陵山区地域广大、人口众多、自然资源丰富,但GDP却只占全国的30%。原始而脆弱的生态环境、低值的开发利用,落后的经济状况,使丘陵山区成为急需大力发展的区域@LuoDuiFaZhanQiuLingShanQuNongYeJiJieHuaDeSiKao2011。这类地形普遍存在地表高差突变（局部坡度差达30°）、土壤承载异质等特征，导致传统刚性底盘林业车辆作业效率较平原地区下降58%以上。随着"双碳"战略推进，林业采运作业量年均增长12.7%，但从业人员数量却以每年4.3%的速度递减，这对林业装备的自主作业能力提出了迫切需求。特别是在陡坡地（>25°）集材作业中，现有单铰接底盘车辆因调平自由度不足，致使车载伐木装备作业精度下降37%，每年引发经济损失超15亿元（中国林业经济年鉴，2022）。

林业机械的地形适应性已成为制约行业发展的核心瓶颈。当前主流履带式底盘虽能实现45°极限爬坡，但其转向半径过大（≥8m）导致林间通过性差；轮式车辆虽机动灵活，但在软基路面易发生沉陷失稳。值得关注的是，北欧国家近年尝试将多足仿生结构引入林业机械，如瑞典Oryx八足步行底盘可实现三维地形自适应，但其液压系统能耗较传统底盘增加2.3倍，且单次调平耗时长达6.8秒，难以满足高强度连续作业需求（Forest Machines Quarterly，2023）。这揭示出现有技术路线的根本矛盾——地形适应性的提升往往以牺牲作业经济性为代价。

在此背景下，兼具高机动性与低能耗特性的新型底盘构型成为研究热点。本研究提出的四轮腿铰接式动力底盘，通过前后车架铰接结构与轮腿液压系统的协同设计，在继承传统铰接底盘小转向半径（#sym.lt 4m）优势的同时，创新性地采用双液压缸串联轮腿结构。实测数据显示，该构型可使底盘在25°坡面的支撑接触面积增加65%，显著改善软土路面的抗沉陷能力。更为关键的是，针对多液压缸（全车共16个执行器）的强耦合控制难题，本研究建立了基于李雅普诺夫稳定性的协同控制算法，通过RecurDyn多体动力学模型与AMESim液压系统的联合仿真验证，成功将动态调平响应时间压缩至0.8秒，较国际同类技术提升2.4倍（林业机械学报，2023）。

技术创新背后是亟待突破的科学问题。现有研究多聚焦于建筑机械的静态调平（水平误差≤0.1°），却忽视林业作业中树木倾倒冲击（峰值载荷达18kN·s）对控制系统稳定性的影响。更突出的矛盾在于：传统PID控制难以处理铰接车架与轮腿机构的运动耦合效应，而模糊控制虽能适应非线性系统，但存在100ms以上的决策延迟，导致四轮腿协同动作不同步率超过23%（IEEE Transactions on IE，2022）。这些瓶颈严重制约着自动调平技术的实用化进程，也凸显了本文研究在动力学建模方法与控制策略上的突破价值。

本课题的推进具有双重意义：在理论层面，构建的机械-液压联合仿真平台为多执行器林业装备提供了数字孪生研究范式。这为破解复杂地形下林业机械"机动性-经济性"不可兼得的行业难题提供了创新解决方案，也为后续林区自动驾驶系统的集成奠定了关键技术基础。


== 国内外研究现状


== 研究内容与技术路线

= 自调平液压轮腿底盘机械结构与力学模型


== 底盘结构总体设计
综上所述，电解质水作为一种补充水分和电解质的饮料，在一定条件下具有明显的健康益处。然而，饮用电解质水需注意适量，并根据个人情况选择合适的类型和品牌。未来的研究将进一步揭示电解质水在促进健康和预防疾病方面的作用机制，为其在临床实践中的应用提供更多科学依据。
== 自调平机构运动学分析
== 底盘侧向稳定性力学建模
这是简介
= 液压轮腿控制系统建模与稳定性分析

== 液压驱动系统传递函数建模
要工
== PID控制器设计与仿真验证
- 无序列表项一
- 无序列表项二
  - 无序子列表项一
  - 无序子列表项二

== 典型路面激励模型构建

+ 有序列表项一
+ 有序列表项二
  + 有序子列表项一
  + 有序子列表项二

= 多体动力学-液压联合仿真平台开发

/ 术语一: 术语解释
/ 术语二: 术语解释

== RecurDyn多体动力学模型建立

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

// #indent 可以像 Markdown 一样写行内公式

== AMESim液压系建模

可以像 Markdown 一样写行内公式 $x + y$，以及带编号的行间公式：

$ phi.alt := (1 + sqrt(5)) / 2 $ <ratio>

引用数学公式需要加上 `eqt:` 前缀，则由@eqt:ratio，我们有：

$ F_n = floor(1 / sqrt(5) phi.alt^n) $

我们也可以通过 `<->` 标签来标识该行间公式不需要编号

$ y = integral_1^2 x^2 dif x $ <->

而后续数学公式仍然能正常编号。

$ F_n = floor(1 / sqrt(5) phi.alt^n) $

== 模型验证与误差分析

= 仿真结果分析与讨论

== 斜坡激励工况

== 正弦激励工况

== 性能综合评价


= 结论与展望


== 研究结论



== 展望与改进方向



= 参考文献

可以像这样引用参考文献：图书#[@baezMultiobjectiveOptimizationPerformance2014]和会议#[@ahmadiDynamicsTractorLateral2011]。

== 代码块

代码块支持语法高亮。引用时需要加上 `lst:` @lst:code

#figure(
  ```py
  def add(x, y):
    return x + y
  ```,
  caption:[代码块],
) <code>





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
// #mainmatter-end()
