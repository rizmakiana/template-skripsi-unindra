#import "config/config.typ": *

#show: document_style

#set page(numbering: "i")

#include "frontmatter/cover.typ"              // Sampul
#include "frontmatter/approval.typ"           // Lembar Persetujuan
#include "frontmatter/ratification.typ"       // Lembar Pengesahan
#include "frontmatter/declaration.typ"        // Lembar Pernyataan
#include "frontmatter/abstract.typ"           // Abstrak
#include "frontmatter/motto.typ"              // Moto
#include "frontmatter/preface.typ"            // Kata Pengantar
#include "frontmatter/toc.typ"                // Daftar Isi 

#set page(numbering: "1")
#counter(page).update(1)

#include "chapter/1.typ"