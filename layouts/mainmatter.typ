// #import "@preview/anti-matter:0.1.1": fence,step,anti-matter
// #import "@preview/anti-matter:0.0.2": anti-front-end
// #import "@preview/hydra:0.5.1": hydra
#import "@preview/i-figured:0.2.4"
#import "../utils/style.typ": 字号, 字体
#import "../utils/custom-numbering.typ": custom-numbering
#import "../utils/custom-heading.typ": heading-display, active-heading, current-heading
// #import "../utils/indent.typ": fake-par
#import "../utils/unpairs.typ": unpairs

#let mainmatter(
  // documentclass 传入参数
  twoside: false,
  fonts: (:),
  info: (:),
  // 其他参数
  leading: 1.25 * 15.6pt - 0.7em,
  spacing: 1.25 * 15.6pt - 0.7em,
  justify: true,
  first-line-indent: (amount: 2em, all: true),
  numbering: custom-numbering.with(first-level: "第一章 ", depth: 4, "1.1 "),
  // 正文字体与字号参数
  text-args: auto,
  // 标题字体与字号
  heading-font: (字体.黑体,字体.黑体,字体.黑体,),
  heading-size: (字号.三号,字号.四号,字号.小四,),
  heading-weight: ("regular",),
  heading-above: (2 * 15.6pt - 0.7em, 32.5pt,18pt),
  heading-below: (24.52pt, 20pt,25pt),
  heading-pagebreak: (true, false),
  heading-align: (center, auto),
  // 页眉
  header-render: auto,
  header-vspace: 1pt,
  display-header: true,
  skip-on-first-level: false,
  // first-level-title-page-disable-heading: false,
  stroke-width: 0.5pt,
  reset-footnote: true,
  // caption 的 separator
  separator: "  ",
  // caption 样式
  caption-style: strong,
  caption-size: 字号.五号,
  // figure 计数
  show-figure: i-figured.show-figure,
  // equation 计数
  show-equation: i-figured.show-equation,
  ..args,
  it,
) = {
  info = (
    title: "学位论文题名",
    author: "张三",
  ) + info
  // 0.  标志前言结束
set page(numbering: "1")

  // 1.  默认参数
  fonts = 字体 + fonts
  if text-args == auto {
    text-args = (font: fonts.宋体, size: 字号.小四)
  }
  // 1.1 字体与字号
  if (heading-font == auto) {
    heading-font = (fonts.黑体,)
  }
  // 1.2 处理 heading- 开头的其他参数
  let heading-text-args-lists = args.named().pairs()
    .filter((pair) => pair.at(0).starts-with("heading-"))
    .map((pair) => (pair.at(0).slice("heading-".len()), pair.at(1)))

  // 2.  辅助函数
  let array-at(arr, pos) = {
    arr.at(calc.min(pos, arr.len()) - 1)
  }

  // 3.  设置基本样式
  // 3.1 文本和段落样式
  set text(..text-args)
  set par(
    leading: leading,
    justify: justify,
    first-line-indent: first-line-indent,
    // spacing: spacing,
  )
  show par: it => {
    v(1.25 * 15.6pt - 0.7em, weak: true)
    it
    v(1.25 * 15.6pt - 0.7em, weak: true)
  }

  show raw: set text(font: fonts.等宽)
  // 3.2 脚注样式
  show footnote.entry: set text(font: fonts.宋体, size: 字号.五号)
  // 3.3 设置 figure 的编号
  show heading: i-figured.reset-counters
  show figure: show-figure
  // 3.4 设置 equation 的编号和假段落首行缩进
  show math.equation.where(block: true): show-equation
  show math.equation: set text(font: "STIX Two Math")
  // show math.equation: set text(font: "cambria math")
  // 3.5 表格表头置顶 + 不用冒号用空格分割 + 样式
  show figure.where(kind: table): set figure.caption(position: top)
  set figure.caption(separator: separator)
  // show figure.caption: caption-style
  show figure.caption: set text(font: fonts.楷体, size: 字号.五号)
  // 3.6 优化列表显示
  //     术语列表 terms 不应该缩进
  show terms: set par(first-line-indent: 0pt)

  // 4.  处理标题
  // 4.1 设置标题的 Numbering
  set heading(numbering: numbering)
  // 4.2 设置字体字号并加入假段落模拟首行缩进
  show heading: it => {
    set text(
      font: array-at(heading-font, it.level),
      size: array-at(heading-size, it.level),
      weight: array-at(heading-weight, it.level),
      ..unpairs(heading-text-args-lists.map((pair )=> (pair.at(0), array-at(pair.at(1), it.level)))),
    )
    // set block(
    //   above: array-at(heading-above, it.level),
    //   below: array-at(heading-below, it.level),
    // )
    if it.level == 1 {
      v(25pt)
    }
    if it.level == 2 {
      v(32.3pt, weak: true)
    }
    if it.level == 3 {
      v(28pt, weak: true)
    }
    it
    // fake-par
    if it.level == 1 {
      v(27pt, weak: true)
    }
    if it.level == 2 {
      v(27pt, weak: true)
    }
    if it.level == 3 {
      v(27pt, weak: true)
    }
  }
  // 4.3 标题居中与自动换页
  show heading: it => {
    if (array-at(heading-pagebreak, it.level)) {
      // 如果打上了 no-auto-pagebreak 标签，则不自动换页
      if ("label" not in it.fields() or str(it.label) != "no-auto-pagebreak") {
        // pagebreak(weak: true)
        colbreak(weak: true)
      }
    }
    if (array-at(heading-align, it.level) != auto) {
      set align(array-at(heading-align, it.level))
      it
    } else {
      it
    }

  }

  // 5.  处理页眉
  set page(..(
    if display-header {
      (
        header: context {
          if reset-footnote {
            counter(footnote).update(0)
          }
          let loc = here()
          let cur-heading = current-heading(level: 1)
          if not skip-on-first-level or cur-heading == none {
            if header-render == auto {
              let first-level-heading = if not twoside or calc.rem(loc.page(), 2) == 0 {
                heading-display(active-heading(level: 1))
              } else {
                ""
              }
              let second-level-heading = if not twoside or calc.rem(loc.page(), 2) == 1 {
                heading-display(active-heading(level: 1, prev: false))
              } else {
                ""
              }
              set text(font: fonts.宋体, size: 10.5pt)
              // if calc.even(here().page()) {
              if calc.odd(here().page()) {
                [#set align(center)
                #info.title
                ]
              } else {
                [#set align(center)
                #first-level-heading 
                ]
                // h(1fr) + first-level-heading + h(1fr)
              }
              // first-level-heading + h(1fr) + second-level-heading
              v(-9pt)
              if first-level-heading != "" or second-level-heading != "" {
                line(length: 100%, stroke: stroke-width + black)
              }
              // )
            } else {
              header-render(loc)
            }
            v(header-vspace)
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
  ))
  counter(page).update(1)
  it

}