# SUMERIAN CONJUGATOR

> ⚠️ Please note that this is a work in progress ⚠️

This tool helps you conjugate verbs in Sumerian by only providing the required elements and the verbal stem. The code takes care of putting the various prefixes and suffixes together while following the phonological rules of the Sumerian language described in **A Descriptive Grammar of Sumerian** by _Abraham Hendrik Jagersma_.

## How to conjugate a verb?

Starting from the stem, you can chain different methods available on the `FiniteVerbForm` struct to construct the final verb.
For example:

```res
open FiniteVerb;

let stem = "zu";
let output =
      new(stem)
      -> isPerfective
      -> isTransitive
      -> setSubject(ThirdSingHuman)
      -> setObject(ThirdSingNonHuman)
      -> setVentive
      -> print;
// => produces "munzu"
```

```res
open FiniteVerb;

let stem = "kar";
let output =
    new(stem)
    -> isPerfective
    -> isTransitive
    -> setSubject(ThirdSingHuman)
    -> setObject(ThirdSingHuman)
    -> setComitative(Some(ThirdSingHuman))
    -> setMiddlePrefix
    -> print;
// => produces "bandankar"
```

Finally, the `print` method puts all the elements together and output a string with the final verb.

> WARNING 1: for now, you must set the perfective and transitive properties of the verb before the subject and object to get the right order of prefixes and suffixes.
> WARNING 2: for the same reason, the oblique object must be set after setting the transitivity of the verb and the subject or object. Hot swapping these values will available in a later version of the app.

## Tests

Every verb form appearing in the tests is found in the Sumerian grammar mentioned earlier.  
Each is tested against the code to check that it creates reliable results.
You can run the test with `bun run test`.

## Goal

The library is meant to be used in a web interface (to be announced).  
You can compile and run it with these commands (after installing the node modules):

- Build: `npm run res:build`
- Clean: `npm run res:clean`
- Build & watch: `npm run res:dev`
