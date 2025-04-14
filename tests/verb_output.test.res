open Jest;

describe("Testing consonant/vowel sequences", () => {
    open Expect;
    open VerbOutput;

    test("ak -> VC", () => {
        let output = consonantVowelSequence("ak");
        expect(output) -> toEqual("VC")
    })

    test("indaĝal -> VCCVCVC", () => {
        let output = consonantVowelSequence("indaĝal");
        expect(output) -> toEqual("VCCVCVC")
    })

    test("munšiĝen -> CVCCVCVC", () => {
        let output = consonantVowelSequence("munšiĝen");
        expect(output) -> toEqual("CVCCVCVC")
    })
});