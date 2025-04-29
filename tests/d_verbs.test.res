open Jest;

describe("DAB verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "dab";

    let expectedVerb = "nabdabe";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // (nobody) should seize it 25.5 (87)
        let output =
            new(stem)
            -> isImperfective(None)
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setNegativeNan     
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});

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

describe("DIB verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "dib";

    let expectedVerb = "libindib";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // He did not let it pass 25.2 (24)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObliqueObject(ThirdSingNonHuman)
            -> setNegative
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});

describe("DUG verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "dug";

    let expectedVerb = "nuunnandug";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // He did not say it to him 25.2 (7)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setIndirectObject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setPreformative(I)
            -> setNegative
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});