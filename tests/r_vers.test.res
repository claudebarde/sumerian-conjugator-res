open Jest;

describe("RIG verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "rig";

    let expected = "babrig";
    test(expected, () => {
        // It was cleared 21.2 (1a)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingNonHuman)
            -> setMiddlePrefix
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })

    let expected = "immabrig";
    test(expected, () => {
        // It was cleared away
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingNonHuman)
            -> setMiddlePrefix
            -> setVentive
            -> setPreformative(I)
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })
})

describe("RU verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "řu";

    let expected = "munnaninřu";
    test(expected, () => {
        // He erected them in it for him 20.1 (1a)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setIndirectObject(ThirdSingHuman)
            -> setLocativeIn(None)
            -> setVentive
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })

    let expected = "binřu";
    test(expected, () => {
        // It was cleared away
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setLocativeOn(Some(ThirdSingNonHuman))
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })
})