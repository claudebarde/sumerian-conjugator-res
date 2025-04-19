open Jest;

describe("KAR verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "kar";

    let expectedVerb = "muʔdankar";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // He took it away from me 22.2 (12)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setComitative(Some(FirstSing))
            -> setVentive
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })

    let expectedVerb = "bandankar";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // He took her away from him 21.2 (4)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingHuman)
            -> setComitative(Some(ThirdSingHuman))
            -> setMiddlePrefix
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })

    // BUG: inconsistent output
    // let expectedVerb = "baʔdankar";
    // let expected: VerbOutput.multiResult = { verb: expectedVerb };
    // test(expectedVerb, () => {
    //     // He took her away from me
    //     let output =
    //         new(stem)
    //         -> isPerfective
    //         -> isTransitive
    //         -> setSubject(ThirdSingHuman)
    //         -> setObject(ThirdSingHuman)
    //         -> setComitative(Some(ThirdSingHuman))
    //         -> setMiddlePrefix
    //         -> print;
    //     expect(output) -> toEqual(Ok(expected))
    // })
});

describe("KUR verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "kuř";

    let expectedVerb = "baadakuř";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // He took it away from me 22.2 (12)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdSingNonHuman)
            -> setMiddlePrefix
            -> setComitative(Some(SecondSing))
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })

    let expectedVerb = "munnaninkuř";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // He let her enter it for him 17.2.2 (15)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setIndirectObject(ThirdSingHuman)
            -> setVentive
            -> setLocativeIn(None)
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })
});