# elm-countries

> A searchable [ISO 3166-1](https://en.wikipedia.org/wiki/ISO_3166-1) based list of country names, codes and emoji flags

The library is intended to be used qualified (i.e. `Countries.search`, `Countries.all`).

```elm
> import Countries
> Countries.fromCode "AU"
Just { name = "Australia", code = "AU", flag = "🇦🇺" }
    : Maybe.Maybe Countries.Country
```

Updates to this package are only made after the ISO 3166-1 standard is officially updated.

Note: [Country names do change](https://github.com/supermario/elm-countries/commit/0c0475df983c35f936a19c14383385ca4bc96cb5)! It's best to use the code as a key if you are using and storing country details outside of this library.

## Modifying the data set

ISO 3166 is based on United Nations data ([source](https://en.wikipedia.org/wiki/ISO_3166-1#Criteria_for_inclusion)).

While this library sticks to the official data set, there are [disputes](https://en.wikipedia.org/wiki/ISO_3166-1#Naming_and_disputes), and you may wish to adjust the data as appropriate for your own use case.

Here's how you can define your own `countries` set:

```elm
-- Example: add the famous Pirate Island, Isla de Muerta
countries =
    Countries.all
        |> List.append [ { name = "Isla de Muerta", code = "XX", flag = "🏴‍☠️" } ]


-- Example: rename a particular country
renamedCountries =
    countries
        |> List.map
            (\country ->
                if country.name == "Isla de Muerta" then
                    { country | name = "Island of the Dead" }

                else
                    country
            )
```

This is also demonstrated in the example app.


## Example

There's an example with a basic country picker in the `example` directory.

```sh
cd example
elm-reactor
```

**Note**: You **must** run `elm-reactor` from within the `example` directory to use the correct package dependencies.
