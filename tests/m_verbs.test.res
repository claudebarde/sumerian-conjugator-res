open Jest;

describe("ME verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "me";

    let expectedVerb = "nuumen";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        // I am not
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(FirstSing)
            -> setNegative
            -> setPreformative(I)
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })
});