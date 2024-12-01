#import "../utils/indent.typ": indent
#import "../utils/style.typ": 字号, 字体

// 研究生声明页
#let master-decl-page(
  anonymous: false,
  twoside: false,
  fonts: (:),
) = {
  // 0. 如果需要匿名则短路返回
  if anonymous {
    return
  }

  // 1.  默认参数
  fonts = 字体 + fonts

  // 2.  正式渲染
  pagebreak(weak: true, to: if twoside { "odd" })

  v(73pt)

  align(
    center,
    text(
      font: fonts.黑体,
      size: 字号.三号,
      weight: 500,
      "独创性声明",
    ),
  )

  v(28pt)

  block[
    #set text(font: fonts.宋体, size: 字号.小四)
    #set par(justify: true, first-line-indent: 2em, leading: 1.2em)

    #indent 本人声明，所呈交的学位（毕业）论文，是本人在指导教师的指导下独立完成的研究成果，并且是自己撰写的。尽我所知，除了文中作了标注和致谢中已作了答谢的地方外，论文中不包含其他人发表或撰写过的研究成果。与我一同对本研究做出贡献的同志，都在论文中作了明确的说明并表示了谢意，如被查有侵犯他人知识产权的行为，由本人承担应有的责任。   \
      \
    #indent 学位（毕业）论文作者亲笔签名：#h(7em)日期：
  ]

  v(48pt)

align(
    center,
    text(
      font: fonts.黑体,
      size: 字号.三号,
      weight: 500,
      "论文使用授权的说明",
    ),
  )

  v(29pt)
  block[
    #set text(font: fonts.宋体, size: 字号.小四)
    #set par(justify: true, first-line-indent: 2em, leading: 1.2em)

    #indent 本人完全了解福建农林大学有关保留、使用学位（毕业）论文的规定，即学校有权送交论文的复印件，允许论文被查阅和借阅; 学校可以公布论文的全部或部分内容，可以采用影印、缩印或其他复制手段保存论文。   \
      \
    #indent #h(12em)保密，在#h(2em)年后解密可适用本授权书。

    #h(12em)不保密，本论文属于不保密。
  ]
  // align(right)[
  //   #set text(font: fonts.黑体, size: 字号.小四)
    
  //   研究生签名：#h(5.8em)

  //   日期：#h(5.8em)
  // ]
  v(27pt)
  block[
    #set text(font: fonts.宋体, size: 字号.小四)
    #set par(justify: true, first-line-indent: 2em, leading: 1.2em)

    #indent 学位（毕业）论文作者亲笔签名：#h(7em)日期：\
\
    #indent 指导教师亲笔签名：#h(13em)日期：
  ]
}