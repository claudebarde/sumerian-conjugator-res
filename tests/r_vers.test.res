open Jest;

describe("RIG verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "rig";

    let expectedVerb = "babrig";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
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

    let expectedVerb = "immabrig";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
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

    let expectedVerb = "munnaninřu";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
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

    let expectedVerb = "binřu";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
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