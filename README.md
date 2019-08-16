# elm-countries

> A searchable [ISO 3166-1](https://en.wikipedia.org/wiki/ISO_3166-1) based list of country names, codes and emoji flags

The library is intended to be used qualified (i.e. `Countries.search`, `Countries.all`).

```elm
> import Countries
> Countries.fromCode "AU"
Just { name = "Australia", code = "AU", flag = "🇦🇺" }
    : Maybe.Maybe Countries.Country
```

Note: [Country names do change](https://github.com/supermario/elm-countries/commit/0c0475df983c35f936a19c14383385ca4bc96cb5)! It's best to use the code as a key if you are using and storing country details outside of this library.

## Example

There's an example with a country picker in the `example` directory.

```sh
cd example
elm-reactor
```

**Note** You **must** run `elm-reactor` from within the `example` directory to use the correct package dependencies.
