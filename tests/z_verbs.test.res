open Jest;

describe("ZIG verb", () => {
    open Expect;
    open FiniteVerb;
    
    let stem = "zig";

    let expectedVerb = "ibtazig";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
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
        expect(output) -> toEqual(Ok(expected))
    })
});

describe("ZU verb", () => {
  open Expect;
  
  let stem = "zu";

  let expectedVerb = "munzu";
  let expected: VerbOutput.multiResult = { verb: expectedVerb };
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
    expect(output) -> toEqual(Ok(expected))
  })
});