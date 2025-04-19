open Jest;

describe("DAḫ verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "daḫ";

    let expectedVerb = "aradaḫen";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // I shall add for you 17.2.4 (33)
        let output =
            new(stem)
            -> isImperfective(None)
            -> isTransitive
            -> setSubject(FirstSing)
            -> setIndirectObject(SecondSing)
            -> setPreformative(A)           
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })
});