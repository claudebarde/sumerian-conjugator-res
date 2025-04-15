open Jest;

describe("TI verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "ti";

    let expected = "baašibtie";
    test(expected, () => {
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

    let expected = "iʔtuku";
    test(expected, () => {
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

    let expected = "ibtuktukun";
    test(expected, () => {
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

    let expected = "iitukun";
    test(expected, () => {
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

    let expected = "ibtuktukuš";
    test(expected, () => {
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

    let expected = "numuʔdaatuku";
    test(expected, () => {
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

    let expected = "mēdantuku";
    test(expected, () => {
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