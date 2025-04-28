open Jest;

describe("NAĜ verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "naĝ";

    let expectedVerb = "innaĝ";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // He drank it 18.3.2 (65a)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setPreformative(I)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    // TODO: verify that "e" suffix becomes "a" after stem that ends in "a"
    // let expectedVerb = "ibna-naa";
    // let expectedAnalysis = VerbAnalysis.new();
    // let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    // test(expectedVerb, () => {
    //     // He is drink it (NA)
    //     let output =
    //         new(stem)
    //         -> isImperfective(Some(Other("na-na")))
    //         -> isTransitive
    //         -> setSubject(ThirdSingHuman)
    //         -> setObject(ThirdSingNonHuman)
    //         -> setPreformative(I)
    //         -> print;
    //     let _ = expect(Result.isOk(output)) -> toEqual(true);
    //     let { verb, _ } = Result.getExn(output);
    //     expect(verb) -> toEqual(expected.verb)
    // })

    let expectedVerb = "imunninnaĝ";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // He let him drink it 18.3.2 (65b)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setObliqueObject(ThirdSingHuman)
            -> setPreformative(I)
            -> setVentive
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});