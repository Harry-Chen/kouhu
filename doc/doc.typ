#import "/src/lib.typ": *
#import "@preview/tidy:0.3.0"

#let docs = tidy.parse-module(read("../src/lib.typ"), name: "Kouhu", scope: (kouhu: kouhu))
#tidy.show-module(docs, style: tidy.styles.default)
