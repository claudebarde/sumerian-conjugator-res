open Jest;

describe("BA verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "ba";

    let expectedVerb = "namanba";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
         // He did not assign it to me 25.2 (13)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setNegative
            -> setIndirectObject(FirstSing)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});

describe("BALA verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "bala";

    let expectedVerb = "ibbalan";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
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

describe("BAR verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "bar";

    let expectedVerb = "ḫēbbare";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
         // He should open it on it
        let output =
            new(stem)
            -> isImperfective(None)
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setLocativeOn(Some(ThirdSingNonHuman))
            -> setPreformative(I)
            -> setModal
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});