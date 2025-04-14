open Jest;

describe("LÁ verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "lá";

    let expected = "annalá";
    test(expected, () => {
        // It was weighed out for him 17.2.2 (8)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdSingNonHuman)
            -> setIndirectObject(ThirdSingHuman)
            -> setPreformative(A)
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })
});