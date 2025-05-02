open Jest;

describe("TAG verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "tag";

    let expectedVerb = "bintag";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
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

describe("TAKA verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "taka";

    let expectedVerb = "namminibtaka-takaa";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // He should not leave it therein! 25.5 (96)
        let output =
            new(stem)
            -> isImperfective(Some(Reduplicate))
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setLocativeIn(None)
            -> setVentive
            -> setNegativeNan
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
})

describe("TEĜ verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "teĝ";

    let expectedVerb = "nambabteĝe";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // He should not approach it 25.5 (92)
        let output =
            new(stem)
            -> isImperfective(None)
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setIndirectObject(ThirdSingNonHuman)
            -> setNegativeNan
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
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
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

    let expectedVerb = "labanti";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // He did not receive it 22.5 (20)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setIndirectObject(ThirdSingNonHuman)
            -> setNegative
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
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
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
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
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
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
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
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
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
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
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
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
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

    let expectedVerb = "ḫaaʔtuku";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // I wish to have her 25.4.2 (69)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(FirstSing)
            -> setObject(ThirdSingHuman)
            -> setPreformative(A)
            -> setModal
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
})

describe("TUM", () => {
    open Expect;
    open FiniteVerb;

    let stem = "tum";

    let expectedVerb = "numundantum";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // He was not able to bring it 25.2 (12)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setNegative
            -> setVentive
            -> setComitative(Some(ThirdSingHuman))
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "ḫamuutum";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // You should bring it 25.4.2 (12)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(SecondSing)
            -> setObject(ThirdSingNonHuman)
            -> setModal
            -> setVentive
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "garantum";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // I will bring him to you 25.6 (113)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(FirstSing)
            -> setObject(ThirdSingHuman)
            -> setIndirectObject(SecondSing)
            -> setModalGa
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
})

describe("TUŠ", () => {
    open Expect;
    open FiniteVerb;

    let stem = "tuš";

    let expectedVerb = "ḫamuʔdantuš";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis, warnings: [] };
    test(expectedVerb, () => {
        // She truly sat with me in it 25.4.2 (75)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdSingHuman)
            -> setModal
            -> setVentive
            -> setComitative(Some(FirstSing))
            -> setLocativeIn(None)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
})