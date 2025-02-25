// #import "@preview/anti-matter:0.1.1": anti-matter
<<<<<<< HEAD
// #import "@preview/anti-matter:0.0.2": anti-matter
=======
#import "@preview/anti-matter:0.0.2": anti-matter
>>>>>>> 0138253cc3a8a6540e377200c290f9aaeeca0145
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
<<<<<<< HEAD
  set page(numbering: "I")
  it
=======
  anti-matter(spec: spec, ..args, it)

>>>>>>> 0138253cc3a8a6540e377200c290f9aaeeca0145
}