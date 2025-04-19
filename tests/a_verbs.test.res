open Jest;

describe("AK verb", () => {
    open Expect;
    open FiniteVerb;

    let stem = "ʔak";

    let expectedVerb = "munʔak";
    
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setVentive          
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })

    // It was made with it
    let expectedVerb = "abdaʔak";
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        let output =
            new(stem)
            -> isPerfective
            -> isIntransitive
            -> setSubject(ThirdSingHuman)
            -> setComitative(Some(ThirdSingNonHuman))
            -> setPreformative(A)          
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })

    // He made it into it
    let expectedVerb = "ibšinʔak";
    
    let expected: VerbOutput.multiResult = { verb: expectedVerb };
    test(expectedVerb, () => {
        let output =
            new(stem)
            -> isPerfective
            -> isTransitive
            -> setSubject(ThirdSingHuman)
            -> setObject(ThirdSingNonHuman)
            -> setPreformative(I)      
            -> setTerminative(Some(ThirdSingNonHuman))    
            -> print;
        expect(output) -> toEqual(Ok(expected))
    })
});