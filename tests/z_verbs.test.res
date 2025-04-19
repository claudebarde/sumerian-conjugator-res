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
});

describe("ZU verb", () => {
  open Expect;
  
  let stem = "zu";

  let expectedVerb = "munzu";
  let expectedAnalysis = VerbAnalysis.new();
  let expected: VerbOutput.multiResult = { verb: expectedVerb, analysis: expectedAnalysis };
  test(expectedVerb, () => {
    // He truly knows 22.1 (1)
    let output =
      FiniteVerb.new(stem)
      -> FiniteVerb.isPerfective
      -> FiniteVerb.isTransitive
      -> FiniteVerb.setSubject(ThirdSingHuman)
      -> FiniteVerb.setObject(ThirdSingNonHuman)
      -> FiniteVerb.setVentive
      -> FiniteVerb.print;
    let _ = expect(Result.isOk(output)) -> toEqual(true);
        let { verb, _ } = Result.getExn(output);
        expect(verb) -> toEqual(expected.verb)
  })
});