#import "@preview/t4t:0.3.2": is
#import "../utils/custom-tablex.typ": gridx

#let notation(
  twoside: false,
  title: "符号表",
  outlined: true,
  width: 360pt,
  columns: (60pt, 1fr),
  row-gutter: 4pt,
  ..args,
  body,
) = {
  heading(
    level: 1,
    numbering: none,
    outlined: outlined,
    title
  )

  align(center, block(width: width,
    gridx(
      columns: columns,
      row-gutter: row-gutter,
      ..args,
      // 解析 terms 内部结构以渲染到表格里
      ..body.children
        .filter(it => is.elem(terms.item, it))
        .map(it => (it.term, it.description))
        .flatten()
    )
  ))

  // 手动分页
  if (twoside) {
    pagebreak() + " "
  }
}