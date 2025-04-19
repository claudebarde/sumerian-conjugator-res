open Jest;

describe("TAG verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "tag";

    let expectedVerb = "bintag";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // He let it touch them 18.2.2 (4)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setObliqueObject(ThirdSingNonHuman)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
})

describe("TI verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "ti";

    let expectedVerb = "baašibtie";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // He will let it approach towards you 17.2.1 (6)
        let output =
            new(stem)
            -> isImperfective(None)
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setTerminative(Some(SecondSing))
            -> setMiddlePrefix
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
})

describe("TUKU verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "tuku";

    let expectedVerb = "iʔtuku";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // I had it
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(FirstSing)
            -> setObject(ThirdSingNonHuman)
            -> setPreformative(I)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "ibtuktukun";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // You have me
        let output =
            new(stem)
            -> isImperfective(Some(Other("tuktuku")))
            -> isTransitive
            -> setSubject(FirstSing)
            -> setObject(ThirdSingNonHuman)
            -> setPreformative(I)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "iitukun";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // You had me
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(SecondSing)
            -> setObject(FirstSing)
            -> setPreformative(I)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "ibtuktukuš";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // They have it
        let output =
            new(stem)
            -> isImperfective(Some(Other("tuktuku")))
            -> isTransitive
            -> setSubject(ThirdPlurHuman)
            -> setObject(ThirdSingNonHuman)
            -> setPreformative(I)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "numuʔdaatuku";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // You do not have it with me 16.2.5 (30)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(SecondSing)
            -> setObject(ThirdSingNonHuman)
            -> setComitative(Some(FirstSing))
            -> setNegative
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "mēdantuku";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // He has it with us 16.2.6 (34)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setComitative(Some(FirstPlur))
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
})