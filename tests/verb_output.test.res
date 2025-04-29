open Jest;

describe("Testing consonant/vowel sequences", () => {
    open Expect;

    test("ak -> VC", () => {
        let output = Utils.consonantVowelSequence("ak");
        expect(output) -> toEqual("VC")
    })

    test("indaĝal -> VCCVCVC", () => {
        let output = Utils.consonantVowelSequence("indaĝal");
        expect(output) -> toEqual("VCCVCVC")
    })

    test("munšiĝen -> CVCCVCVC", () => {
        let output = Utils.consonantVowelSequence("munšiĝen");
        expect(output) -> toEqual("CVCCVCVC")
    })
});