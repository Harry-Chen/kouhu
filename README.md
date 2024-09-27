# kouhu (口胡)

`kouku` is a Chinese lipsum text generator for [Typst](https://typst.app). It provides a set of built-in text samples containing both Simplified and Traditional Chinese characters. You can choose from generated fake text, classic or modern Chinese literature, or specify your own text.

`kouhu` is inspired by [zhlipsum](https://ctan.org/pkg/zhlipsum) LaTeX package and [roremu](https://typst.app/universe/package/roremu) Typst package.

All text is excerpted from `zhlipsum` LaTeX package (see Appendix for details).

## Usage

```typst
#import "@preview/kouhu:0.1.0": kouhu

#kouhu(indicies: range(1, 3))
#kouhu(builtin-text: "zhufu", offset: 5, length: 100)
```

See [manual]() for more details.

## Changelog

### 0.1.0

* Initial release

## Appendix

### Generate `zhlipsum.json`

First download the `zhlipsum-text.dtx` from [CTAN](https://ctan.org/pkg/zhlipsum) or from local TeX Live (`kpsewhich zhlipsum-text.dtx`). Then run:

```bash
python3 utils/generate_zhlipsum.py /path/tozhlipsum-text.dtx src/zhlipsum.json
```
