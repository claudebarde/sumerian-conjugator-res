open Jest;

describe("SA verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "sa";

    let expectedVerb = "innēšinsa";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // He bought her from them 16.2.3 (18)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingHuman)
            -> setPreformative(I)
            -> setTerminative(Some(ThirdPlurHuman))
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })
})

describe("SA verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "sá";

    let expectedVerb = "absá";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // It has been straightened out 18.2.2 (11b)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setPreformative(A)
            -> setObliqueObject(ThirdSingNonHuman)
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })
})

describe("SIG-SIG verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "sig-sig";

    let expectedVerb = "mininsig-sig";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // He put them in it 20.1 (2a)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setVentive
            -> setLocativeIn(None)
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })

    let expectedVerb = "imminsig-sig";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // He loaded it on them 20.1 (2b)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setVentive
            -> setLocativeOn(Some(ThirdPlurNonHuman))
            -> setPreformative(I)
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })
})

describe("SUG verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "sug";

    let expectedVerb = "basugeš";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // They stood for it 16.2.1 (2)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdPlurHuman)
            -> setIndirectObject(ThirdSingNonHuman)
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })
})

describe("SUM verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "šum";

    let expectedVerb = "banšum";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // He gave to it 17.2.1 (1)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setIndirectObject(ThirdSingNonHuman)
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })

    let expectedVerb = "immašume";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // He gave it to it 17.2.1 (3)
        let output =
            new(stem)
            -> isImperfective(None)
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setIndirectObject(ThirdSingNonHuman)
            -> setPreformative(I)
            -> setVentive
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })

    let expectedVerb = "innanšum";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // He gave this to him 17.2.2 (9)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setIndirectObject(ThirdSingHuman)
            -> setPreformative(I)
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })

    let expectedVerb = "munnanšum";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // She gave it to him 17.2.2 (14)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setIndirectObject(ThirdSingHuman)
            -> setVentive
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })

    let expectedVerb = "rabšume";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // He will give it to you 17.2.4 (36)
        let output =
            new(stem)
            -> isImperfective(None)
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setIndirectObject(SecondSing)
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })

    let expectedVerb = "ḫarabšume";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // Let him give it to you 17.2.4 (37)
        let output =
            new(stem)
            -> isImperfective(None)
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setIndirectObject(SecondSing)
            -> setModal
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })

    let expectedVerb = "nuraʔšum";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // I did not give her to you 17.2.4 (38)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(FirstSing)
            -> setObject(ThirdSingHuman)
            -> setIndirectObject(SecondSing)
            -> setNegative
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })
})