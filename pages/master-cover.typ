#import "../utils/datetime-display.typ": datetime-display, datetime-en-display,time-cn
#import "../utils/justify-text.typ": justify-text
#import "../utils/style.typ": 字号, 字体

// 硕士研究生封面
#let master-cover(
  // documentclass 传入的参数
  doctype: "master",
  degree: "academic",
  nl-cover: false,
  anonymous: false,
  twoside: true,
  fonts: (:),
  info: (:),
  // 其他参数
  stoke-width: 0.5pt,  //学校代码等的下划线
  min-title-lines: 2,
  min-reviewer-lines: 5,
  info-inset: (x: 0pt, bottom: 0.5pt),
  info-key-width: 7.5em,
  info-column-gutter: 10pt,
  info-row-gutter: 12pt,
  meta-block-inset: (left: 0pt),
  meta-info-inset: (x: 0pt, bottom: 2pt),
  meta-info-key-width: 35pt,
  meta-info-column-gutter: 10pt,
  meta-info-row-gutter: 1pt,
  defense-info-inset: (x: 0pt, bottom: 0pt),
  defense-info-key-width: 110pt,
  defense-info-column-gutter: 2pt,
  defense-info-row-gutter: 12pt,
  anonymous-info-keys: ("student-id", "author", "author-en", "supervisor", "supervisor-en", "supervisor-ii", "supervisor-ii-en", "chairman", "reviewer"),
  datetime-display: datetime-display,
  datetime-en-display: datetime-en-display,
) = {
  // 1.  默认参数
  fonts = 字体 + fonts
  info = (
    title: ("基于 Typst 的", "南京大学学位论文"),
    grade: "20XX",
    student-id: "1234567890",
    // Paper-number:"1234567890",
    author: "张三",
    department: "某学院",
    Subject-categories:"工学",
    Subject-categories-en:"Engineering",
    First-level-discipline-name:"林业工程",
    First-level-discipline-name-en:"Forestry Engineering",
    major: "某专业",
    supervisor: ("李四", "教授"),
    submit-date: datetime.today(),
    // school-code:"10389",
  ) + info

  // 2.  对参数进行处理
  // 2.1 如果是字符串，则使用换行符将标题分隔为列表
  if type(info.title) == str {
    info.title = info.title.split("\n")
  }
  // if type(info.title-en) == str {
  //   info.title-en = info.title-en.split("\n")
  // }
  // 2.2 根据 min-title-lines 和 min-reviewer-lines 填充标题和评阅人
  info.title = info.title + range(min-title-lines - info.title.len()).map((it) => "　")
  info.reviewer = info.reviewer + range(min-reviewer-lines - info.reviewer.len()).map((it) => "　")
  // 2.3 处理日期
  assert(type(info.submit-date) == datetime, message: "submit-date must be datetime.")
  if type(info.defend-date) == datetime {
    info.defend-date = datetime-display(info.defend-date)
  }
  if type(info.confer-date) == datetime {
    info.confer-date = datetime-display(info.confer-date)
  }
  if type(info.bottom-date) == datetime {
    info.bottom-date = datetime-display(info.bottom-date)
  }
  // 2.4 处理 degree
  if (info.degree == auto) {
    if (doctype == "doctor") {
      info.degree = "工程博士"
    } else {
      info.degree = "工程硕士"
    }
  }

  // 3.  内置辅助函数
  let info-key(body, info-inset: info-inset, is-meta: false) = {
    set text(
      font: if is-meta { fonts.仿宋 } else { fonts.仿宋 },
      size: if is-meta { 字号.五号 } else { 字号.四号 },
      weight: if is-meta { "regular" } else { "regular" },
    )
    rect(
      width: 100%,
      inset: info-inset,
      stroke: none,
      justify-text(with-tail: is-meta, with-tail2: not is-meta, body)
    )
  }

  let info-value(key, body, info-inset: info-inset, is-meta: false, no-stroke: true) = {
    set align(left)
    rect(
      width: 100%,
      inset: info-inset,
      stroke: if no-stroke { none } else { (bottom: stoke-width + black) },
      text(
        font: if is-meta { fonts.仿宋 } else { fonts.仿宋 },
        size: if is-meta { 字号.五号 } else { 字号.四号 },
        bottom-edge: "descender",
        // if (anonymous and (key in anonymous-info-keys)) {
        //   if is-meta { "█████" } else { "██████████" }
        // } else {
          body
        // },
      ),
    )
  }

  let info-value-title(key, body, info-inset: info-inset, is-meta: false, no-stroke: true) = {
    set align(center)
    rect(
      width: 100%,
      inset: info-inset,
      stroke: if no-stroke { none } else { (bottom: stoke-width + black) },
      text(
        font: if is-meta { fonts.黑体 } else { fonts.黑体 },
        size: if is-meta { 字号.二号 } else { 字号.二号 },
        weight: if is-meta { "regular" } else { "medium" },
        bottom-edge: "descender",
        if (anonymous and (key in anonymous-info-keys)) {
          if is-meta { "█████" } else { "██████████" }
        } else {
          // strong[#body]
          body
        },
      ),
    )
  }

  let anonymous-text(key, body) = {
    if (anonymous and (key in anonymous-info-keys)) {
      "██████████"
    } else {
      body
    }
  }

  let meta-info-key = info-key.with(info-inset: meta-info-inset, is-meta: true)
  let meta-info-value = info-value.with(info-inset: meta-info-inset, is-meta: true)
  let defense-info-key = info-key.with(info-inset: defense-info-inset)
  let defense-info-value = info-value.with(info-inset: defense-info-inset)
  

  // 4.  正式渲染
  pagebreak(weak: true, to: if twoside { "odd" })
  v(1cm)
  if (anonymous){
    v(-21pt)
  }else{
  block(width: 100%, inset: meta-block-inset, 
  grid(
    // columns: (meta-info-key-width, 1fr),
    columns: (3em, 1fr,4em,9.5em),
    // align: (left,left,right,left),
    column-gutter: meta-info-column-gutter,
    row-gutter: meta-info-row-gutter,
    meta-info-key("分类号"),
    meta-info-value("clc", info.clc),
    meta-info-key("学校代码"),
    [#set text(baseline: 0.2em)
      #meta-info-value("school-code", info.school-code)],
    meta-info-key("密级"),
    meta-info-value("secret-level", info.secret-level),
    // meta-info-key("UDC"),
    // meta-info-value("udc", info.udc),
    meta-info-key("学号"),
    [#set text(baseline: 0.2em)
      #meta-info-value("student-id", info.student-id)],
  ))
  }
  // 居中对齐
  set align(center)

  // 匿名化处理去掉封面标识
  // if (anonymous) {
  //   v(70pt)
  // } else {
    // 封面图标
    v(25pt)
    image("../imgs/fafu.png", width: 10.68cm)
    // 调整一下左边的间距
    // pad(image("../assets/vi/nju-name.svg", width: 4cm))
    v(-5pt)
  // }

  // 将中文之间的空格间隙从 0.25 em 调整到 0.5 em
  text(size: 36pt, font: fonts.隶书, spacing: 200%, weight: "regular",
    if doctype == "doctor" { "博士学位论文" } else { 
      if degree=="academic"{
        "硕士学位论文" 
      }else{
        "硕士专业学位论文"
      }
      
       },
  )
  
  if (anonymous) {
    v(49.6pt)
  } else {
    v(17pt)
  }
  if (anonymous) {
        block(width: 100%,grid(
      columns: (1fr), 
      ..info.title.map((s) => info-value-title("title", s)),
    )
    )
    v(16.7mm)
  } else {
    block(width: 100%,grid(
      columns: (1fr), 
      ..info.title.map((s) => info-value-title("title", s)),
    )
    )
    v(11mm)
  }
  // set align(left.x)
  // block(width: 294pt, table(
    block(width: 100%, 
    place(left,dx: 10.56em,
    grid(
    // columns: (info-key-width, 100pt),
    columns: (7.5em, 10.2em),
    column-gutter: info-column-gutter,
    row-gutter: info-row-gutter,
    // info-key("论文题目："),
    // ..info.title.map((s) => info-value("title", s)),
    ..(if degree=="academic" {(
          info-key("学科门类"),
    info-value("Subject-categories",info.Subject-categories),
    info-key("一级学科名称"),
    info-value("First-level-discipline-name", info.First-level-discipline-name),
    ..(if degree == "professional" {(
      {
        set text(font: fonts.楷体, size: 字号.三号, weight: "bold")
        move(dy: 0.3em, scale(x: 55%, box(width: 10em, "专业学位类别（领域）")))
      },
      info-value("major", info.degree + "（" + info.major + "）"),
    )} else {(
      info-key("二级学科名称"),
      info-value("major", info.major),
    )}),
    info-key("研究方向"),
    info-value("field", info.field),
    ..(if (anonymous) {
      (info-key("论文编号"),
      info-value("论文编号", info.Paper-number),
      )
    }else{(    info-key("研究生姓名"),
    info-value("author", info.author),
    info-key("指导教师"),
    info-value("supervisor", info.supervisor.intersperse(" ").sum()),)}),

    // ..(if info.supervisor-ii != () {(
    //   info-key("　"),
    //   info-value("supervisor-ii", info.supervisor-ii.intersperse(" ").sum()),
    // )} else { () }), 

    info-key("完成时间"),
    // info-value("submit-date", datetime-display(info.submit-date)),
    info-value("submit-date", time-cn()),
    )}else{(
info-key("学位类别"),
    info-value("degree-type",info.degree-type),
    // info-key("一级学科名称"),
    // info-value("First-level-discipline-name", info.First-level-discipline-name),
      info-key("专业领域"),
      info-value("major", info.major),
    info-key("研究方向"),
    info-value("field", info.field),
    ..(if (anonymous) {
      (info-key("论文编号"),
      info-value("论文编号", info.Paper-number),
      )
    }else{(    info-key("学生姓名"),
    info-value("author", info.author),
    info-key("指导教师"),
    info-value("supervisor", info.supervisor.intersperse(" ").sum()),)}),

    ..(if info.supervisor-ii != () {(
      ("　"),
      info-value("supervisor-ii", info.supervisor-ii.intersperse(" ").sum()),
    )} else { () }), 

    info-key("完成时间"),
    // info-value("submit-date", datetime-display(info.submit-date)),
    info-value("submit-date", time-cn()),


    )
      
    }),
    
  )))

  // v(50pt)

  // text(font: fonts.楷体, size: 字号.三号, datetime-display(info.submit-date))


  // 第二页
  // pagebreak(weak: true)

  // v(161pt)

  // block(width: 284pt, grid(
  //   columns: (defense-info-key-width, 1fr),
  //   column-gutter: defense-info-column-gutter,
  //   row-gutter: defense-info-row-gutter,
  //   defense-info-key("答辩委员会主席"),
  //   defense-info-value("chairman", info.chairman),
  //   defense-info-key("评阅人"),
  //   ..info.reviewer.map((s) => defense-info-value("reviewer", s)).intersperse(defense-info-key("　")),
  //   defense-info-key("论文答辩日期"),
  //   defense-info-value("defend-date", info.defend-date, no-stroke: true),
  // ))

  // v(216pt)

  // align(left, box(width: 7.3em, text(font: fonts.楷体, size: 字号.三号, weight: "bold", justify-text(with-tail: true, "研究生签名"))))

  // v(7pt)

  // align(left, box(width: 7.3em, text(font: fonts.楷体, size: 字号.三号, weight: "bold", justify-text(with-tail: true, "导师签名"))))

  // 第三页英文封面页
  pagebreak(weak: true,to: "odd")

  set text(font: fonts.楷体, size: 字号.小四)
  set par(leading: 1em,spacing: 1.5 * 15.6pt - 0.7em)
 if(anonymous){
  v(39.4pt)
 }else{
  v(71pt)
 }

  
  // text(font: fonts.黑体, size: 字号.二号, weight: "bold", info.title-en.intersperse("\n").sum())
  text(font: fonts.宋体, size: 字号.二号, weight: "bold", info.title-en)


  if(anonymous){
v(12.4pt)
  }else{
  v(24pt)
  text(size: 字号.四号, weight: "bold")[By]
  }


  v(36pt)

if(anonymous){

}else{
   text(size: 字号.四号, weight: "bold")[#info.author-en]
}
  // text(font: fonts.宋体, size: 字号.四号, weight: "bold", anonymous-text("author-en", info.author-en))

  v(37pt)
if(anonymous){
v(1pt)
}else{
   text(size: 字号.四号, weight: "bold")[Supervised by #info.supervisor-en]
}
  // text(size: 字号.四号, weight: "bold")[Supervised by Prof. #anonymous-text("supervisor-en", info.supervisor-en) ]

  v(34pt)

  // text(font: fonts.黑体, size: 字号.四号, anonymous-text("supervisor-en", info.supervisor-en))

  if info.supervisor-ii-en != "" {
    v(-4pt)
    if(anonymous){
      v(13pt)
}else{
   text(size: 字号.四号, weight: "bold")[Supervised by #info.supervisor-ii-en]
}
    // text(font: fonts.黑体, size: 字号.四号, weight: "bold" ,anonymous-text("supervisor-ii-en", info.supervisor-ii-en))

    v(-9pt)
  }

  // v(16pt)

  [#set text(size: 字号.小三, weight: "bold")
    A Thesis Submitted to ]
  if (anonymous) {
    v(9pt)
  }else{
    v(35pt)
  }
  
  [#set text(size: 字号.小三, weight: "bold")
  //  #(if not anonymous { "Fujian Agriculture and Forestry University " })  
   Fujian Agriculture and Forestry University 
  ]
  v(4pt)
  [#set text(size: 字号.小三, weight: "bold")
     in Partial Fulfillment of the Requirements 
  ]
  v(3pt)
  [#set text(size: 字号.小三, weight: "bold")
     for 
  ]
  v(4pt)
[#set text(size: 字号.小三, weight: "bold")
  #if doctype == "doctor" { "Doctor of philosophy" } else {
    if degree=="academic"{
        "Master Degree of "
    } else{
      "Professional Master's Degree in "
    }
    info.major-en }
]
  // v(6pt)

  // [in]
if(anonymous){
  v(164pt)
}else{
  v(32.5pt)
}
  

  [#set text(size: 字号.三号, weight: "bold")
    College of #info.department-en
  ]
  
  v(1pt)

  // if not anonymous {
  //   image("../assets/vi/nju-emblem.svg", width: 2.14cm)
  // }

  // v(28pt)

  // info.department-en

  // v(2pt)

  // if not anonymous {
    [#set text(size: 字号.三号, weight: "bold")
      Fujian Agriculture and Forestry University
    ]
  // }
  v(2pt)
  [#set text(size: 字号.三号, weight: "bold")
    Fujian, P.R. China
  ]
  v(1pt)
if (anonymous){
[#set text(size: 字号.三号, weight: "bold")
    Submission Date: #datetime-en-display(info.send-date)
  ]
}else{
  [#set text(size: 字号.三号, weight: "bold")
    Completion Date (#datetime-en-display(info.submit-date))
  ]
  v(1pt)
    [#set text(size: 字号.三号, weight: "bold")
    Commencement Date (#datetime-en-display(info.submit-date))
  ]}
}