open Jest;

describe("ĜAL verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "ĝal";

    let expectedVerb = "indaĝal";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
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
        expect(output) -> toEqual(Ok(expected))
    })
});

describe("ĜAR verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "ĝar";

    let expectedVerb = "ibtanĝar";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
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
        expect(output) -> toEqual(Ok(expected))
    })

    let expectedVerb = "baaĝar";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
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
        expect(output) -> toEqual(Ok(expected))
    })

    let expectedVerb = "inninĝar";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
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
        expect(output) -> toEqual(Ok(expected))
    })
});

describe("ĜEN verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "ĝen";

    let expectedVerb = "munšiĝen";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
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
        expect(output) -> toEqual(Ok(expected))
    })

    let expectedVerb = "imšiĝen";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
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
        expect(output) -> toEqual(Ok(expected))
    })

    let expectedVerb = "immaĝen";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
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
        expect(output) -> toEqual(Ok(expected))
    })
});

describe("GI verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "gi";

    let expectedVerb = "ḫamuʔšingi-gie";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
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
        expect(output) -> toEqual(Ok(expected))
    })
});

describe("GUB verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "gub";

    let expectedVerb = "bannēgub";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
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
        expect(output) -> toEqual(Ok(expected))
    })
});