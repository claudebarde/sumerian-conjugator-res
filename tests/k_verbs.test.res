open Jest;

describe("KAR verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "kar";

    let expectedVerb = "muʔdankar";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // He took it away from me 22.2 (12)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setComitative(Some(FirstSing))
            -> setVentive
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "bandankar";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // He took her away from him 21.2 (4)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingHuman)
            -> setComitative(Some(ThirdSingHuman))
            -> setMiddlePrefix
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "labadabkare";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // He takes it away from it 22.2 (12)
        let output =
            new(stem)
            -> isImperfective(None)
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setComitative(None)
            -> setMiddlePrefix
            -> setNegative
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    // BUG: inconsistent output
    // let expectedVerb = "baʔdankar";
    // let expected: VerbOutput.multiResult = { verb: expectedVerb };
    // test(expectedVerb, () => {
    //     // He took her away from me
    //     let output =
    //         new(stem)
    //         -> isPerfective
    //         -> isTransitive
    //         -> setSubject(ThirdSingHuman)
    //         -> setObject(ThirdSingHuman)
    //         -> setComitative(Some(ThirdSingHuman))
    //         -> setMiddlePrefix
    //         -> print;
    //     let _ = expect(Result.isOk(output)) -> toEqual(true);
        // let { verb, _ } = Result.getExn(output);
        // expect(verb) -> toEqual(expected.verb)
    // })
});

describe("KUR verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "kuř";

    let expectedVerb = "baadakuř";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // He took it away from me 22.2 (12)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdSingNonHuman)
            -> setMiddlePrefix
            -> setComitative(Some(SecondSing))
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "munnaninkuř";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // He let her enter it for him 17.2.2 (15)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setIndirectObject(ThirdSingHuman)
            -> setVentive
            -> setLocativeIn(None)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "labankuř";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // It was not brought into it 25.2 (23)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdSingNonHuman)
            -> setMiddlePrefix
            -> setNegative
            -> setLocativeIn(None)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "ḫēbtakuře";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // Should he break it 22.4.2 (80)
        let output =
            new(stem)
            -> isImperfective(None)
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setAblative(Some(ThirdSingNonHuman))
            -> setModal
            -> setPreformative(I)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});