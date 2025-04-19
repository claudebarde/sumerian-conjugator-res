open Jest;

describe("PAD verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "pad";

    let expectedVerb = "binpad";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // He let him find it 18.1 (2)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setObliqueObject(ThirdSingNonHuman)
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })
})