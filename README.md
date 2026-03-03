# nrk-sans-styles

## Why?

Most of the text styles of NRK Sans override the default attribute values of the font. This repository _(alongside [Figma](https://www.figma.com/design/fGIFO3OhimVi3yjX7QmKv5Ou/NRK-TV-Core-2.1?node-id=0-16&m=dev))_ should be considered the truth when it comes to these attributes.

## How?

As part of the build pipeline, the platforms should fetch the font-definitions from this repository.
The ios/iosgen.js will only create changes in the template and definitions if NRKSansStyle.swift has changed compared with `main` branch.

## Format

The definitions under `"tv"` should be used in all large-screen applications — smart TV, Apple TV, Android TV, etc. The definitions under `"responsive"` should be used for everything else.

- `size`, int: The point size
- `lineHeight`, float, Relative to Size
- `explicitLineHeight`, int: The **total** lineheight (Android TV Compose only)
- `letterSpacing`, float, Relative to Size
- `"weight"`, int
- `"width"`, int

```js
{
    "responsive": {
        "title9": {
            "size": 29,
            "lineHeight": 1.20,
            "explicitLineHeight": 35,
            "letterSpacing": 0.004,
            "weight": 660,
            "width": 100
        },
        { /* ... */ }
    },
    "tv": {
        "title9": {
            "size": 29,
            "lineHeight": 1.3,
            "explicitLineHeight": 38,
            "letterSpacing": -0.002,
            "weight": 400,
            "width": 100
        },
        { /* ... */ }
    }
}
```

