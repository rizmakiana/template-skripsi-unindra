#import "../config/input.typ" : *

#set par(leading: 1em, spacing: 1em)
#set enum(numbering: "A.")

= ABSTRAK 
\
+ Nama, NPM: #name, #npm  #v(1em)

+ *#thesis-title.* Skripsi; Jakarta; #faculty;; #study-program;; Universitas Indraprasta Persatuan Guru Republik Indonesia, #today_month, #today.year().

+ Jumlah halaman romawi + jumlah bab + jumlah halaman isi

+ #grid(
    columns: (55pt, 9pt, auto),
    [Kata Kunci], [:], [#keyword.join(", ")]
  )
  
+ #abstract-point-e 

+ #grid(
    columns: (auto, 10pt, auto),
    [Referensi],[:],
    [
      15 Buku (tahun 2008-2018) \ 
      4 artikel dalam jurnal (tahun 2009-2010) \
      2 laporan penelitian akademik \
      6 sumber lain \
    ]
  ) 
  
+ #grid(
    columns: (auto, 10pt, auto),
    [Pembimbing],[:],[#strong[#thesis-advisor1] (Materi)\ #strong[#thesis-advisor2] (Teknik)]
  )

#pagebreak()