#let document_style(body) = {

  set page(paper: "a4", margin: (top: 4cm, right: 4cm, left: 4cm, bottom: 4cm))
  set text(font: "Liberation Serif", size: 12pt)
  set par(justify: true, spacing: 0.65em, leading: 0.65em, first-line-indent: (amount: 2em, all: true))

  body
}