open Jest;

describe("E verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "ʔe";

    let expectedVerb = "ḫēnnabʔee";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // May he say it to him! 25.4.1 (49)
        let output =
            new(stem)
            -> isImperfective(None)
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setIndirectObject(ThirdSingHuman)
            -> setPreformative(I)
            -> setModal            
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});

describe("ʔÈ verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "ʔè";

    let expectedVerb = "ḫamuntaʔède";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // He must let it come out of him 16.2.2 (17)
        let output =
            new(stem)
            -> isImperfective(Some(EdMarker))
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setAblative(Some(ThirdSingHuman))
            -> setVentive
            -> setModal
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});