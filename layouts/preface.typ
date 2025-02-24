// #import "@preview/anti-matter:0.1.1": anti-matter
// #import "@preview/anti-matter:0.0.2": anti-matter
// 前言，重置页面计数器
#let preface(
  // documentclass 传入的参数
  twoside: false,
  // 其他参数
  ..args,
  it,
) = {
  // 分页
  if (twoside) {
    pagebreak() + " "
  }
  counter(page).update(0)
  set page(numbering: "I")
  it
}