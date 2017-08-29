# elm-countries

> A searchable [ISO 3166-1](https://en.wikipedia.org/wiki/ISO_3166-1) based list of country names, codes and emoji flags

The library is intended to be used qualified (i.e. `Countries.search`, `Countries.all`).

```elm
> import Countries
> Countries.fromCode "AU"
Just { name = "Australia", code = "AU", flag = "🇦🇺" }
    : Maybe.Maybe Countries.Country
```

## Example

There's an example with a country picker in the `example` directory.

```sh
cd example
elm-reactor
```
