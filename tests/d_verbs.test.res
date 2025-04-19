open Jest;

describe("DAḫ verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "daḫ";

    let expectedVerb = "aradaḫen";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
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
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});