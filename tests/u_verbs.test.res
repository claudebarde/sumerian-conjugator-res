open Jest;

describe("UG verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "ʔug";

    let expectedVerb = "uʔuged";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // He is dying
        let output =
            new(stem)
            -> isImperfective(Some(EdMarker))
            -> isIntransitive
            -> setSubject(ThirdSingHuman)
            -> setPreformative(I)
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })
})

describe("US verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "ʔus";

    let expectedVerb = "imminʔus";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // He had him follow them 18.2.2 (9)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingHuman)
            -> setObliqueObject(ThirdPlurNonHuman)
            -> setPreformative(I)
            -> setVentive
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })
})