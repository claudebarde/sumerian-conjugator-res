open Jest;

describe("BALA verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "bala";

    let expectedVerb = "ibbalan";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
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
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});