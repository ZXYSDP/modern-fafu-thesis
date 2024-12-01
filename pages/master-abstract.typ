#import "@preview/pinit:0.1.3": pin, pinit-place
#import "../utils/style.typ": 字号, 字体
#import "../utils/indent.typ": fake-par
#import "../utils/custom-heading.typ": heading-display, active-heading, current-heading
#import "../utils/double-underline.typ": double-underline
#import "../utils/invisible-heading.typ": invisible-heading

// 研究生中文摘要页
#let master-abstract(
  // documentclass 传入的参数
  doctype: "master",
  degree: "academic",
  anonymous: false,
  twoside: false,
  fonts: (:),
  info: (:),
  // 其他参数
  keywords: (),
  outline-title: "摘　要",
  outlined: true,
  abstract-title-weight: "medium",
  stoke-width: 0.5pt,
  info-value-align: center,
  info-inset: (x: 0pt, bottom: 0pt),
  info-key-width: 74pt,
  grid-inset: 0pt,
  column-gutter: 0pt,
  row-gutter: 10pt,
  anonymous-info-keys: ("author", "grade", "supervisor", "supervisor-ii"),
  leading: 1.27em,
  spacing: 1.27em,
  body,
) = {
  // 1.  默认参数
  fonts = 字体 + fonts
  info = (
    title: ("基于 Typst 的", "南京大学学位论文"),
    author: "张三",
    grade: "20XX",
    department: "某学院",
    major: "某专业",
    supervisor: ("李四", "教授"),
  ) + info

  // 2.  对参数进行处理
  // 2.1 如果是字符串，则使用换行符将标题分隔为列表
  if type(info.title) == str {
    info.title = info.title.split("\n")
  }

  // 3.  内置辅助函数
  let info-key(body) = {
    rect(
      inset: info-inset,
      stroke: none,
      text(font: fonts.楷体, size: 字号.四号, body),
    )
  }

  let info-value(key, body) = {
    set align(info-value-align)
    rect(
      width: 100%,
      inset: info-inset,
      stroke: (bottom: stoke-width + black),
      text(
        font: fonts.楷体,
        size: 字号.四号,
        bottom-edge: "descender",
        if (anonymous and (key in anonymous-info-keys)) {
          "█████"
        } else {
          body
        },
      ),
    )
  }

  // 4.  正式渲染
  pagebreak(
    weak: true,
    to: if twoside {
      "odd"
    },
  )

  [
    #set page(
      ..(
        if true {
          (
            header: context {
              if true {
                counter(footnote).update(0)
              }
              let cur-heading = current-heading(level: 1)
              if not false or cur-heading == none {
                if auto == auto {
                  let first-level-heading = if not twoside or calc.rem(here().page(), 2) == 0 {
                    heading-display(active-heading(level: 1))
                  } else {
                    ""
                  }
                  let second-level-heading = if not twoside or calc.rem(here().page(), 2) == 2 {
                    heading-display(active-heading(level: 1, prev: false))
                  } else {
                    ""
                  }
                  set text(font: fonts.宋体, size: 字号.五号)
                  if calc.even(here().page()) {
                    // h(1fr)+info.title+h(1fr)
                  } else {
                    // h(1fr)+second-level-heading+h(1fr)
                  }
                  // first-level-heading + h(1fr) + second-level-heading
                  v(-9pt)
                  if first-level-heading != "" or second-level-heading != "" {
                    //  line(length: 100%, stroke: stroke-width + black)
                  }
                  // )
                } else {
                  header-render(here())
                }
                v(1pt)
              }
            },
            header-ascent: 20%,
            footer-descent: 18%,
          )

        } else {
          (
            header: {
              // 重置 footnote 计数器
              if reset-footnote {
                counter(footnote).update(0)
              }
            },
          )
        }
      ),
      footer: context [
        #set align(center)
        #set text(10.5pt)
        #counter(page).display("I")
      ],
    )
    #set text(font: fonts.宋体, size: 字号.四号)
    #set par(leading: leading, spacing: spacing, justify: true)

    // 标记一个不可见的标题用于目录生成
    #invisible-heading(level: 1, outlined: outlined, outline-title)

    #v(25pt)

    #align(center, text(font: fonts.黑体, size: 字号.三号, weight: 700, "摘　要"))

    #v(9pt)

    #set text(font: fonts.宋体, size: 字号.四号)

    #[
      #set par(first-line-indent: 2em, leading: 1.45 * 15.6pt - 0.7em, spacing: 1.35 * 15.6pt - 0.7em, justify: true)

      #fake-par

      #body
    ]
    #v(14pt)
    // #parbreak()
    *关键词*：#(("",)+ keywords.intersperse("，")).sum()
  ]
}