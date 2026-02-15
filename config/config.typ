#let document_style(body) = {
  set page(paper: "a4", margin: (top: 4cm, right: 4cm, left: 4cm, bottom: 4cm))
  set text(font: "Liberation Serif", size: 12pt)
  set par(justify: true, spacing: 1em, leading: 1em, first-line-indent: (amount: 2em, all: true))

  let titleChapter = counter(<titleChapter>)
  let outlineTitleChapter = counter(<outlineTitleChapter>)

  show heading.where(level: 1): set text(12pt)
  show heading.where(level: 1): set align(center)

  show outline.entry.where(level: 1): set text(weight: "bold")

  show heading.where(label: <titleChapter>): it => {
    // titleChapter.step()
    context {
      let i = titleChapter.display("I")
      set par(leading: 0.65em, spacing: 0.65em)
      block()[
        BAB #i \ #upper(it.body)
      ]
    }
  }

  show outline.entry: it => {
    if it.element.has("label") and it.element.label == <titleChapter> {
      v(1em)
      outlineTitleChapter.step()
      set par(first-line-indent: 0pt)
      context {
        let i = outlineTitleChapter.display("I")
        link(it.element.location())[
          BAB #i #upper(it.element.body)
          #box(width: 1fr, it.fill)
          #it.page()
        ]
      }
    } else {
      it
    }
  }

  let backMatter = counter(<backMatter>)
  
  show outline.entry: it => {
    if it.element.has("label") and it.element.label == <backMatter> {
      backMatter.step()
      set par(first-line-indent: 0pt)
      context {
        let i = backMatter.display("I")
        if i == "I" { v(1.5em) }
        link(it.element.location())[#it.element.body \ ]
      }
    } else {
      it
    }
  }

  set enum(full: true, numbering: (..nums) => {
    let numbers = nums.pos()
    if numbers.len() == 1 {
      strong(numbering("A.", ..numbers))
    } else if numbers.len() == 2 {
      numbering("1.", numbers.at(1))
    } else if numbers.len() == 3 {
      numbering("a.", numbers.at(2))
    } else if numbers.len() == 4 {
      numbering("1)", numbers.at(3))
    } else if numbers.len() == 5 {
      numbering("a)", numbers.at(4))
    }
  })

  show <subChapter>: it => {
    place(hide(heading(level: 2, outlined: true, [#it])))
    strong[#it]
  }

  set heading(
    numbering: (..args) => {
      let nums = args.pos()
      let level = nums.len()

      if level == 1 {h(-0.5em)} 
      else if level == 2 { numbering("A.", nums.at(1)) }
    },
  )

  body
}
