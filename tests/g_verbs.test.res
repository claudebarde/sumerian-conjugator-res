open Jest;

describe("ĜAL verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "ĝal";

    let expected = "indaĝal";
    test(expected, () => {
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

    let expected = "ibtanĝar";
    test(expected, () => {
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

    // let expected = "baaĝar";
    // test(expected, () => {
    //     // They were placed on it 21.2 (7)
    //     let output =
    //         new(stem)
    //         -> isPerfective
    //         -> isTransitive
    //         -> setSubject(ThirdSingNonHuman)
    //         -> setIndirectObject(ThirdSingNonHuman)
    //         -> setMiddlePrefix
    //         -> print;
    //     expect(output) -> toEqual(Ok(expected))
    // })
});

describe("ĜEN verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "ĝen";

    let expected = "munšiĝen";
    test(expected, () => {
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

    let expected = "imšiĝen";
    test(expected, () => {
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

    let expected = "immaĝen";
    test(expected, () => {
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

    let expected = "ḫamuʔšingi-gie";
    test(expected, () => {
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

    let expected = "bannēgub";
    test(expected, () => {
        // They were caused to stand 21.2 (6)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdPlNonHuman)
            -> setIndirectObject(ThirdPlHuman)
            -> setMiddlePrefix
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })
});