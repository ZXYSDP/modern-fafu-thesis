// #import "@preview/outrageous:0.1.0"
#import "../utils/invisible-heading.typ": invisible-heading
#import "../utils/style.typ": 字号, 字体

// 本科生目录生成
#let bachelor-outline-page(
  // documentclass 传入参数
  twoside: false,
  fonts: (:),
  // 其他参数
  depth: 3,
  title: "目　录",
  outlined: false,
  title-vspace: 52pt,
  title-text-args: auto,
  // 引用页数的字体，这里用于显示 Times New Roman
  reference-font: auto,
  reference-size: 字号.小四,
  // 字体与字号
  font: auto,
  size: (字号.四号, 字号.小四),
  // 垂直间距
  above: (9.4pt, 1.25*15.6pt-0.7em),
  below: (.1pt, 1.25*15.0pt-0.7em),
  vspace: (9.31pt, 10.8pt),
  // vspace: (1.25*15.6pt-0.7em, 10.8pt),
  indent: (0pt, 2em, 2em),
  // 全都显示点号
  fill: (repeat([.], gap: 0.15em),),
  gap: .3em,
  ..args,
) = {
  // 1.  默认参数
  fonts = 字体 + fonts
  if (title-text-args == auto) {
    title-text-args = (font: fonts.黑体, size: 字号.三号, weight: 500)
  }
  // 引用页数的字体，这里用于显示 Times New Roman
  if (reference-font == auto) {
    reference-font = fonts.宋体
  }
  // 字体与字号
  if (font == auto) {
    font = (fonts.黑体, fonts.宋体)
  }

  // 2.  正式渲染
  pagebreak(weak: true, to: if twoside { "odd" })
  v(24.5pt)
  // 默认显示的字体
  set text(font: reference-font, size: reference-size)

  {
    set align(center)
    text(..title-text-args, title)
    // 标记一个不可见的标题用于目录生成
    invisible-heading(level: 1, outlined: outlined, title)
  }

  v(title-vspace)
  set outline(indent: level => indent.slice(0, calc.min(level + 1, indent.len())).sum())
  // show outline.entry: outrageous.show-entry.with(
  //   // 保留 Typst 基础样式
  //   ..outrageous.presets.typst,
  //   body-transform: (level, it) => {
  //     // 设置字体和字号
  //     set text(
  //       font: font.at(calc.min(level, font.len()) - 1),
  //       size: size.at(calc.min(level, size.len()) - 1),
  //     )
  //     // 计算缩进
  //     let indent-list = indent + range(level - indent.len()).map((it) => indent.last())
  //     let indent-length = indent-list.slice(0, count: level).sum()
  //     h(indent-length) + it
  //   },
  //   vspace: vspace,
  //   fill: fill,
  //   ..args,
  // )
 show outline.entry: entry => block(
    above: above.at(entry.level - 1, default: above.last()),
    below: below.at(entry.level - 1, default: below.last()),
    link(
      entry.element.location(),
      entry.indented(
        none,
        {
          text(
            font: font.at(entry.level - 1, default: font.last()),
            size: size.at(entry.level - 1, default: size.last()),
            {
              if entry.prefix() not in (none, []) {
                entry.prefix()
                h(gap)
              }
              entry.body()
            },
          )
          box(width: 1fr, inset: (x: .25em), fill.at(entry.level - 1, default: fill.last()))
          entry.page()
        },
        gap: 0pt,
      ),
    ),
  )
  // 显示目录
  outline(title: none, depth: depth)

}