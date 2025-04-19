open Jest;

describe("ME verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "me";

    let expectedVerb = "nuumen";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // I am not
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(FirstSing)
            -> setNegative
            -> setPreformative(I)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});