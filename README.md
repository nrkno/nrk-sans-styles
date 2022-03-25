# nrk-sans-styles

## Why?

Most of the text styles of NRK Sans override the default attribute values of the font. This repository _(alongside Figma)_ should be considered the truth when it comes to these attributes.

## How?

As part of the build pipeline, the platforms should fetch the font-definitions from this repository.

## Format

The definitions under `"tv"` should be used in all large-screen applications — smart TV, Apple TV, Android TV, etc. The definitions under `"responsive"` should be used for everything else.

- `size`, int: The point size
- `lineHeight`, int: The **total** line height (_point size_ plus _leading_)
- `letterSpacing`, float, optional: Floating point percentage
- `"webkit-font-smoothing"`, string: CSS property
- `"moz-osx-font-smoothing"`, string: CSS property
- `"weight"`, int
- `"width"`, int

```js
{
    "responsive": {
        "title9": {
            "size": 37,
            "lineHeight": 44,
            "letterSpacing": 0.25,
            "webkit-font-smoothing": "auto",
            "moz-osx-font-smoothing": "auto",
            "weight": 920,
            "width": 100
        },
        { /* ... */ }
    },
    "tv": {
        "title9": {
            "size": 75,
            "lineHeight": 88,
            "letterSpacing": 1.25,
            "webkit-font-smoothing": "auto",
            "moz-osx-font-smoothing": "auto",
            "weight": 920,
            "width": 100
        },
        { /* ... */ }
    }
}
```

