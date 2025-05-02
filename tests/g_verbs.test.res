open Jest;

describe("ĜAL verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "ĝal";

    let expectedVerb = "indaĝal";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // This is with him 16.2.2 (14a)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdSingHuman)
            -> setComitative(Some(ThirdSingHuman))
            -> setPreformative(I)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "numunĝal";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // It is not there in it 25.2 (11)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdSingNonHuman)
            -> setLocativeIn(None)
            -> setNegative
            -> setVentive
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});

describe("ĜAR verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "ĝar";

    let expectedVerb = "ibtanĝar";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // He placed it from it 16.2.1 (7)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setAblative(Some(ThirdSingNonHuman))
            -> setPreformative(I)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "baaĝar";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // They were placed on it 21.2 (7)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdPlurNonHuman)
            -> setLocativeOn(None)
            -> setMiddlePrefix
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "inninĝar";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // He placed it on him 18.1 (3)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setObliqueObject(ThirdSingHuman)
            -> setPreformative(I)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "ḫamunnaaĝar-ĝare";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // He should place it on it for him 25.4.2 (63)
        let output =
            new(stem)
            -> isImperfective(Some(Reduplicate))
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setVentive
            -> setModal
            -> setLocativeOn(None)
            -> setIndirectObject(ThirdSingHuman)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "ḫēmtaĝar";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // May it be removed from it 25.4.2 (65)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdSingHuman)
            -> setVentive
            -> setModal
            -> setPreformative(I)
            -> setAblative(None)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "garaaĝar"
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // I will put it on it for you 25.6 (114)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setLocativeOn(None)
            -> setIndirectObject(SecondSing)
            -> setModalGa
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});

describe("GEN verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "gen";

    let expectedVerb = "ḫabibgene";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // He should be firm on it 25.4.1 (52)
        let output =
            new(stem)
            -> isImperfective(None)
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setModal
            -> setLocativeOn(Some(ThirdSingNonHuman))
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});

describe("ĜEN verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "ĝen";

    let expectedVerb = "munšiĝen";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // He came for him 22.6 (68a)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdSingHuman)
            -> setTerminative(Some(ThirdSingHuman))
            -> setVentive
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "imšiĝen";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // He came for it 22.6 (68b)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdSingHuman)
            -> setTerminative(Some(ThirdSingNonHuman))
            -> setVentive
            -> setPreformative(I)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "immaĝen";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // He came to it 17.2.1 (4)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdSingHuman)
            -> setIndirectObject(ThirdSingNonHuman)
            -> setPreformative(I)
            -> setVentive
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "nuumĝen";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // He doesn't come 22.5 (8)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdSingHuman)
            -> setNegative
            -> setVentive
            -> setPreformative(I)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});

describe("GI verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "gi";

    let expectedVerb = "ḫamuʔšingi-gie";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // He should send him to me 16.2.5 (31)
        let output =
            new(stem)
            -> isImperfective(Some(Reduplicate))
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingHuman)
            -> setTerminative(Some(FirstSing))
            -> setModal
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "nuubgi-gideš";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // They will not come back on this 25.2 (9)
        let output =
            new(stem)
            -> isImperfective(Some(Other("gi-gid")))
            -> isIntransitive
            -> setSubject(ThirdPlurHuman)
            -> setLocativeOn(Some(ThirdSingNonHuman))
            -> setNegative
            -> setPreformative(I)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "ḫēbgi";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // May it be reversed on it 25.4.2 (66)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdSingNonHuman)
            -> setModal
            -> setLocativeOn(Some(ThirdSingNonHuman))
            -> setPreformative(I)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});

describe("GUB verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "gub";

    let expectedVerb = "bannēgub";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // They were caused to stand 21.2 (6)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdPlurNonHuman)
            -> setIndirectObject(ThirdPlurHuman)
            -> setMiddlePrefix
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});

describe("GUR verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "gur";

    let expectedVerb = "nammibgure";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // He should not refuse this (91)
        let output =
            new(stem)
            -> isImperfective(None)
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setLocativeOn(Some(ThirdSingNonHuman))
            -> setVentive
            -> setNegativeNan
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});