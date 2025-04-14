open Jest;

describe("BALA verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "bala";

    let expected = "ibbalan";
    test(expected, () => {
         // I cross it
        let output =
            new(stem)
            -> isImperfective(None)
            -> isTransitive
            -> setSubject(FirstSing)
            -> setObject(ThirdSingNonHuman)
            -> setPreformative(I)
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })
});