open Jest;

describe("BALA verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "bala";

    let expectedVerb = "ibbalan";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
         // I cross it
        let output =
            new(stem)
            -> isImperfective(None)
            -> isTransitive
            -> setSubject(FirstSing)
            -> setObject(ThirdSingNonHuman)
            -> setPreformative(I)
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })
});