#import "@preview/pinit:0.1.3": pin, pinit-place
#import "../utils/style.typ": 字号, 字体
// #import "../utils/indent.typ": fake-par
#import "../utils/custom-heading.typ": heading-display, active-heading, current-heading
// #import "../utils/double-underline.typ": double-underline
#import "../utils/invisible-heading.typ": invisible-heading

// 研究生英文摘要页
#let master-abstract-en(
  // documentclass 传入的参数
  doctype: "master",
  degree: "academic",
  anonymous: false,
  twoside: false,
  fonts: (:),
  info: (:),
  // 其他参数
  keywords: (),
  outline-title: "ABSTRACT",
  outlined: true,
  abstract-title-weight: "medium",
  stoke-width: 0.5pt,
  info-value-align: center,
  info-inset: (x: 0pt, bottom: 0pt),
  info-key-width: 74pt,
  grid-inset: 0pt,
  column-gutter: 2pt,
  row-gutter: 10pt,
  anonymous-info-keys: ("author-en", "supervisor-en", "supervisor-ii-en"),
  leading: 1.27em,
  spacing: 1.27em,
  // reset-footnote: true,
  body,
) = {
  // 1.  默认参数
  fonts = 字体 + fonts
  info = (
    title-en: "FAFU Thesis Template for Typst",
    author-en: "Zhang San",
    department-en: "XX Department",
    major-en: "XX Major",
    supervisor-en: "Professor Li Si",
  ) + info

  // 2.  对参数进行处理
  // 2.1 如果是字符串，则使用换行符将标题分隔为列表
  if type(info.title-en) == str {
    info.title-en = info.title-en.split("\n")
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
  pagebreak(weak: true, to: if twoside { "odd" })

  [
  //       #set page(..(if false {
  //   (
  //     header: {
  //       // 重置 footnote 计数器
  //       if true {
  //         counter(footnote).update(0)
  //       }
        
  //       locate(loc => {
  //         // 5.1 获取当前页面的一级标题
  //         let cur-heading = current-heading(level: 1, loc)
  //         // 5.2 如果当前页面没有一级标题，则渲染页眉
  //         if not false or cur-heading == none {
  //           if auto == auto {
  //             // 一级标题和二级标题
  //             let first-level-heading = if not twoside or calc.rem(loc.page(), 2) == 0 { heading-display(active-heading(level: 1, loc)) } else { "" }
  //             let second-level-heading = if not twoside or calc.rem(loc.page(), 2) == 1 { heading-display(active-heading(level: 1, prev: false, loc)) } else { "" }
  //             set text(font: fonts.宋体, size: 字号.五号)
  //             // stack(
  //                if calc.even(loc.page()) {
  //                   // h(1fr)+info.title+h(1fr)
  //               } else{
  //                 // h(1fr)+second-level-heading+h(1fr)
  //               }
  //               v(-9pt)
  //               if first-level-heading != "" or second-level-heading != "" { 
  //                 // line(length: 100%, stroke: 0.5pt + black) 
  //                 }
  //             // )
  //           } else {
  //             header-render(loc)
  //           }
  //           v(1pt)
  //         }
  //       })
  //     },
  //   header-ascent: 20%,
  //   footer-descent: 18%,
  //   )

  // } else {
  //   (
  //     header: {
  //       // 重置 footnote 计数器
  //       if reset-footnote {
  //         counter(footnote).update(0)
  //       }
  //     }
  //   )
  // }), 
  //   footer: context [
  //   #set align(center)
  //   #set text(10.5pt)
  //   #counter(page).display(
  //     "I",)
  //     #counter(page).update(0)
  // ],    
  //   header-ascent: 20%,
  //   footer-descent: 18%,
  
  // )
  // #set page(
  //     ..(
  //       if true {
  //         (
  //           header: context {
  //             if true {
  //               counter(footnote).update(0)
  //             }
  //             let cur-heading = current-heading(level: 1)
  //             if not false or cur-heading == none {
  //               if auto == auto {
  //                 let first-level-heading = if not twoside or calc.rem(here().page(), 2) == 0 {
  //                   heading-display(active-heading(level: 1))
  //                 } else {
  //                   ""
  //                 }
  //                 let second-level-heading = if not twoside or calc.rem(here().page(), 2) == 1 {
  //                   heading-display(active-heading(level: 1, prev: false))
  //                 } else {
  //                   ""
  //                 }
  //                 set text(font: fonts.宋体, size: 字号.五号)
  //                 if calc.even(here().page()) {
  //                   // h(1fr)+info.title+h(1fr)
  //                 } else {
  //                   // h(1fr)+second-level-heading+h(1fr)
  //                 }
  //                 // first-level-heading + h(1fr) + second-level-heading
  //                 v(-9pt)
  //                 if first-level-heading != "" or second-level-heading != "" {
  //                   //  line(length: 100%, stroke: stroke-width + black)
  //                 }
  //                 // )
  //               } else {
  //                 header-render(here())
  //               }
  //               v(1pt)
  //             }
  //           },
  //           header-ascent: 20%,
  //           footer-descent: 18%,
  //         )

  //       } else {
  //         (
  //           header: {
  //             // 重置 footnote 计数器
  //             if reset-footnote {
  //               counter(footnote).update(0)
  //             }
  //           },
  //         )
  //       }
  //     ),
  //     footer: context [
  //       #counter(footnote).update(0)
  //       #set align(center)
  //       #set text(10.5pt)
  //       #counter(page).display("I")
  //     ],
  //   )
    // #set text(font: fonts.楷体, size: 字号.五号)
    #set par(leading: leading,spacing: spacing, justify: true)

    // 标记一个不可见的标题用于目录生成
    #invisible-heading(level: 1, outlined: outlined, outline-title)

    #v(23pt)

    #align(center, text(font: fonts.宋体, size: 字号.四号, weight: 700, "ABSTRACT"))

    #v(9pt)

    #set text(font: fonts.宋体, size: 字号.四号)

    #[#set text(font: fonts.宋体, size: 字号.五号)
      #set par(first-line-indent:  (amount: 2em, all: true), leading: 1.33 * 15.6pt - 0.7em, spacing: 1.25 * 15.6pt - 0.7em,justify: true)

      // #fake-par
      
      #body
    ]

    #v(14pt)
    #[
    #set text(font: fonts.宋体, size: 字号.五号)
    *KEY WORDS*: #(("",)+ keywords.intersperse(", ")).sum()
    ]
    
  ]
  // pagebreak(weak: false)

  }
