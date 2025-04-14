open Jest;

describe("UG verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "ʔug";

    let expected = "uʔuged";
    test(expected, () => {
        // He is dying
        let output =
            new(stem)
            -> isImperfective(Some(EdMarker))
            -> isIntransitive
            -> setSubject(ThirdSingHuman)
            -> setPreformative(I)
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })
})