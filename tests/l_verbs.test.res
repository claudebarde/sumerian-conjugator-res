open Jest;

describe("LÁ verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "lá";

    let expectedVerb = "annalá";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
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