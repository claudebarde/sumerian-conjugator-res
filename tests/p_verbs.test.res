open Jest;

describe("PAD verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "pad";

    let expected = "binpad";
    test(expected, () => {
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