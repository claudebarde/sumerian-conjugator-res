open Jest;

describe("TAG verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "tag";

    let expectedVerb = "bintag";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
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
        expect(output) -> toEqual(Ok(expected))
    })
})

describe("TI verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "ti";

    let expectedVerb = "baašibtie";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
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
        expect(output) -> toEqual(Ok(expected))
    })
})

describe("TUKU verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "tuku";

    let expectedVerb = "iʔtuku";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
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
        expect(output) -> toEqual(Ok(expected))
    })

    let expectedVerb = "ibtuktukun";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
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
        expect(output) -> toEqual(Ok(expected))
    })

    let expectedVerb = "iitukun";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
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
        expect(output) -> toEqual(Ok(expected))
    })

    let expectedVerb = "ibtuktukuš";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
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
        expect(output) -> toEqual(Ok(expected))
    })

    let expectedVerb = "numuʔdaatuku";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
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
        expect(output) -> toEqual(Ok(expected))
    })

    let expectedVerb = "mēdantuku";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
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
        expect(output) -> toEqual(Ok(expected))
    })
})