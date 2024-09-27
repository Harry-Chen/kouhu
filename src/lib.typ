/// Get all builtin texts. Returns in `dictionary[string, list[string]]`.
/// 
/// -> dictionary
#let builtin-text-list() = {
  return json("zhlipsum.json")
}

/// Print Chinese lorem ipsum paragraphs.
///
/// *Example:*
/// #example(`#kouhu(builtin-text: "zhufu", offset: 5, indicies: (2,), max-length: 18)`, mode: "markup")
///
/// - builtin-text (string): Name of the builtin text, use @@builtin-text-list() for a full list.
/// - custom-text (array): Custom text to use. If not empty, `builtin-text` will be ignored.
/// - offset (int): Offset of the paragraph to start from.
/// - indicies (array): Indicies (*NOT RANGE*) of paragraphs to use (`offset` will be added). Empty array means all paragraphs. Any out-of-bound index will be ignored.
/// - max-length (int): Maximum length of graphme (characters) to print. 0 for unlimited.
/// - before-para (content): Content inserted before each paragraph.
/// - after-para (content): Content inserted after each paragraph.
/// - between-para (content): Content inserted between two paragraphs.
/// -> doc
#let kouhu(
  builtin-text: "simp",
  custom-text: (),
  offset: 0,
  indicies: (),
  max-length: 0,
  before-para: "",
  after-para: "",
  between-para: [#parbreak()],
) = {

  // load builtin text or use custom text
  let text = custom-text
  if text == () {
    let data = builtin-text-list()
    if builtin-text in data {
      text = data.at(builtin-text)
    } else {
      panic("Builtin text '" + builtin-text + "' not found")
    }
  }

  // select paragraphs according to argument
  let selected_para = ()
  if indicies == () {
    selected_para = text
  } else {
    // truncate to specified length of graphme
    let remaining_len = 1e10 // use a large number here
    if max-length > 0 {
      remaining_len = max-length
    }
    for i in indicies {
      let i_ = i + offset - 1
      if i_ >= 0 and i_ < text.len() {
        let t = text.at(i_).clusters()
        if t.len() > remaining_len {
          selected_para.push(t.slice(0, remaining_len).join())
          break
        } else {
          selected_para.push(t.join())
          remaining_len -= t.len()
        }
      }
    }
  }

  // print paragraphs
  for p in selected_para {
    if before-para != "" {
      before-para
    }
    p
    if after-para != "" {
      after-para
    }
    if between-para != "" {
      between-para
    }
  }
}

#kouhu(builtin-text: "simp", indicies: (1, 2), offset: 0, max-length: 1000)
