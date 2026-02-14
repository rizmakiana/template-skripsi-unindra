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
    titleChapter.step()
    context {
      let i = titleChapter.display("I")
      set par(leading: 0.65em, spacing: 0.65em)
      block()[
        BAB #i \ #upper(it.body)
      ] 
    }
  }

  show outline.entry: it => {
    if it.element.has("label") and it.element.label == <titleChapter>{
      v(1em)
      outlineTitleChapter.step()
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

  body
}