open Jest;

describe("HUL verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "hul";

    let expected = "imdahul";
    test(expected, () => {
        // He was happy about it 22.6 (67b)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdSingHuman)
            -> setComitative(Some(ThirdSingNonHuman))
            -> setPreformative(I)
            -> setVentive
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })
});