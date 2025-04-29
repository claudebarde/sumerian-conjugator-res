open Jest;

describe("ZIG verb", () => {
    open Expect;
    open FiniteVerb;
    
    let stem = "zig";

    let expectedVerb = "ibtazig";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // They were raised from these 22.1 (1)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdPlurNonHuman)
            -> setAblative(Some(ThirdPlurNonHuman))
            -> setPreformative(I)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "nuubtazig";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // It was not raised from it 25.2 (5)
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdSingNonHuman)
            -> setAblative(Some(ThirdSingNonHuman))
            -> setNegative
            -> setPreformative(I)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "nannazi-zige";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // He should not raise it against him 25.5 (88)
        let output =
            new(stem)
            -> isImperfective(Some(Other("zi-zig")))
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setNegativeNan
            -> setIndirectObject(ThirdSingHuman)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })

    let expectedVerb = "nannēzi-zige";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // (nobody) should not raise it for them 25.5 (89)
        let output =
            new(stem)
            -> isImperfective(Some(Other("zi-zig")))
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setNegativeNan
            -> setIndirectObject(ThirdPlurHuman)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});

describe("ZU verb", () => {
  open Expect;
  open FiniteVerb;
  
  let stem = "zu";

  let expectedVerb = "munzu";
  let expectedAnalysis = VerbAnalysis.new();
  let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
  test(expectedVerb, () => {
    // He truly knows 22.1 (1)
    let output =
      new(stem)
      -> isPerfective
      -> isTransitive
      -> setSubject(ThirdSingHuman)
      -> setObject(ThirdSingNonHuman)
      -> setVentive
      -> print;
    let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
  })

    let expectedVerb = "ḫēnzu";
    let expectedAnalysis = VerbAnalysis.new();
    let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
    test(expectedVerb, () => {
        // May he know it 25.4.2 (68)
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setModal
            -> setPreformative(I)
            -> print;
        let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
    })
});