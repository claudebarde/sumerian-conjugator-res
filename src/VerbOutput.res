open Infixes 

type t = array<string>;

let firstPrefixPos = 0
let preformativePos = 1
let coordinatorPos = 2
let ventivePos = 3
let middlePrefixPos = 4
let initialPersonPrefixPos = 5
let indirectObjectPrefixPos = 6
let comitativePos = 7
let adverbialPos = 8
let locativePos = 9
let finalPersonPrefixPos = 10
let stemPos = 11;
let edMarkerPos = 12
let finalPersonSuffixPos = 13
let subordinatorPos = 14

let addStem = (stem: string, arr: t): t => {
    arr[stemPos] = stem
    arr
}

let addFirstPrefix = (arr: t, verb: VerbShared.verbForm): t => {
    switch (verb.firstPrefix) {
    | Some(FirstPrefix.Modal) => arr[firstPrefixPos] = "ḫa"
    | Some(FirstPrefix.Negative) => arr[firstPrefixPos] = "nu"
    | None => ()
    }
    arr
}

let addPreformative = (arr: t, verb: VerbShared.verbForm): t => {
    switch (verb.preformative) {
    | Some(A) => arr[preformativePos] = "a"
    | Some(I) => arr[preformativePos] = "i"
    | Some(U) => arr[preformativePos] = "u"
    | None => ()
    }
    arr
}

// TODO: create a function to add the coordinator prefix

let addVentive = (arr: t, verb: VerbShared.verbForm): t => {
    if (verb.ventive) {
        arr[ventivePos] = "mu"
    }
    arr
}

let addAdverbial = (arr: t, verb: VerbShared.verbForm): t => {
    switch (verb.adverbial) {
        | Some(Ablative) => arr[adverbialPos] = "ta"
        | Some(Terminative) => arr[adverbialPos] = "ši"
        | None => ()
    }
    arr
}

let addMiddlePrefix = (arr: t, verb: VerbShared.verbForm): t => {
    if (verb.middlePrefix) {
        arr[middlePrefixPos] = "ba"
    }
    arr
}

let addInitialPersonPrefix = (arr: t, verb: VerbShared.verbForm): t => {
    switch (verb.initialPersonPrefix) {
        | Some(FirstSing) => arr[initialPersonPrefixPos] = "ʔ"
        | Some(SecondSing) => arr[initialPersonPrefixPos] = "e"
        | Some(ThirdSingHuman) => arr[initialPersonPrefixPos] = "n"
        | Some(ThirdSingNonHuman) => arr[initialPersonPrefixPos] = "b"
        | Some(FirstPlur) => arr[initialPersonPrefixPos] = "mē"
        | Some(SecondPlur) => arr[initialPersonPrefixPos] = "enē"
        | Some(ThirdPlurHuman) => arr[initialPersonPrefixPos] = "nnē"
        | Some(ThirdPlurNonHuman) => arr[initialPersonPrefixPos] = "b"
        | None => ()
    }
    arr
}

let addIndirectObjectPrefix = (arr: t, verb: VerbShared.verbForm): t => {
    switch (verb.indirectObjectPrefix) {
        | Some(FirstSing) => arr[indirectObjectPrefixPos] = "ma"
        | Some(SecondSing) => arr[indirectObjectPrefixPos] = "ra"
        | Some(ThirdSingHuman) => arr[indirectObjectPrefixPos] = "nna"
        | Some(ThirdSingNonHuman) => arr[indirectObjectPrefixPos] = "ba"
        | Some(FirstPlur) => arr[indirectObjectPrefixPos] = "mē"
        | Some(SecondPlur) => arr[indirectObjectPrefixPos] = "ra"
        | Some(ThirdPlurHuman) => arr[indirectObjectPrefixPos] = "nnē"
        | Some(ThirdPlurNonHuman) => arr[indirectObjectPrefixPos] = "ba"
        | None => ()
    }
    arr
}

let addComitative = (arr: t, verb: VerbShared.verbForm): t => {
    if (verb.comitative) {
        arr[comitativePos] = "da"
    }
    arr
}

let addLocative = (arr: t, verb: VerbShared.verbForm): t => {
    switch (verb.locative) {
        | Some(InWithInitialPerson) => arr[locativePos] = ""
        | Some(InWithoutInitialPerson) => arr[locativePos] = "ni"
        | Some(OnWithInitialPerson) => arr[locativePos] = "bi"
        | Some(OnWithoutInitialPerson) => arr[locativePos] = "e"
        | None => ()
    }
    arr
}

let addFinalPersonPrefix = (arr: t, verb: VerbShared.verbForm): t => {
    switch (verb.finalPersonPrefix) {
        | Some(FirstSing) => arr[finalPersonPrefixPos] = "ʔ"
        | Some(SecondSing) => arr[finalPersonPrefixPos] = "e"
        | Some(ThirdSingHuman) => arr[finalPersonPrefixPos] = "n"
        | Some(ThirdSingNonHuman) => arr[finalPersonPrefixPos] = "b"
        | None => ()
    }
    arr
}

let addEdMarker = (arr: t, verb: VerbShared.verbForm): t => {
    if (verb.edMarker) {
        arr[edMarkerPos] = "ed"
    }
    arr
}

let addFinalPersonSuffix = (arr: t, verb: VerbShared.verbForm): t => {
    switch (verb.finalPersonSuffix) {
        | Some(FirstSing) => arr[finalPersonSuffixPos] = "en"
        | Some(SecondSing) => arr[finalPersonSuffixPos] = "en"
        | Some(ThirdSingHuman) | Some(ThirdSingNonHuman) => {
            // can be Ø or "e"
            if verb.is_transitive && !verb.is_perfective {
                arr[finalPersonSuffixPos] = "e"
            } else {
                arr[finalPersonSuffixPos] = ""
            }
        }
        | Some(FirstPlur) => arr[finalPersonSuffixPos] = "enden"
        | Some(SecondPlur) => arr[finalPersonSuffixPos] = "enzen"
        | Some(ThirdPlurHuman) => arr[finalPersonSuffixPos] = {
            // can be "eš" or "enē"
            "eš"
        }
        | Some(ThirdPlurNonHuman) => arr[finalPersonSuffixPos] = ""
        | None => ()
    }
    arr
}

type markerName = 
    | FirstPrefix
    | Preformative
    | Coordinator
    | Ventive
    | MiddlePrefix
    | InitialPersonPrefix
    | IndirectObjectPrefix
    | Comitative
    | Adverbial
    | Locative
    | FinalPersonPrefix
    | Stem
    | EdMarker
    | FinalPersonSuffix
    | Subordinator

let markerByPos = (pos: int): option<markerName> => {
    switch pos {
        | 0 => Some(FirstPrefix)
        | 1 => Some(Preformative)
        | 2 => Some(Coordinator)
        | 3 => Some(Ventive)
        | 4 => Some(MiddlePrefix)
        | 5 => Some(InitialPersonPrefix)
        | 6 => Some(IndirectObjectPrefix)
        | 7 => Some(Comitative)
        | 8 => Some(Adverbial)
        | 9 => Some(Locative)
        | 10 => Some(FinalPersonPrefix)
        | 11 => Some(Stem)
        | 12 => Some(EdMarker)
        | 13 => Some(FinalPersonSuffix)
        | 14 => Some(Subordinator)
        | _ => None
    }
}

let rec findPreviousMorpheme = (arr: t, pos: int): option<(string, markerName)> => {
    if (pos < 1) {
        None
    } else {
        switch arr[pos - 1] {
            | Some(morph) if String.length(morph) > 0 => {
                switch markerByPos(pos - 1) {
                    | Some(marker) => Some((morph, marker))
                    | None => None
                }
            }
            | _ => findPreviousMorpheme(arr, pos - 1)
        }
    }
}

let rec findNextMorpheme = (arr: t, pos: int): option<(string, markerName)> => {
    if (pos > 14) {
        None
    } else {
        switch arr[pos + 1] {
            | Some(morph) if String.length(morph) > 0 => {
                switch markerByPos(pos + 1) {
                    | Some(marker) => Some((morph, marker))
                    | None => None
                }
            }
            | _ => findNextMorpheme(arr, pos + 1)
        }
    }
}

let startsWithVowel = (str: string): bool => {
    let firstChar = str -> Js.String2.get(0);
    switch firstChar {
        | "a" | "á" | "e" | "è" | "i" | "o" | "u" => true
        | _ => false
    }
}

let endsWithVowel = (str: string): bool => {
    let lastChar = str -> Js.String2.get(Js.String2.length(str) - 1);
    switch lastChar {
        | "a" | "á" | "e" | "è" | "i" | "o" | "u" => true
        | _ => false
    }
}

let startsWithConsonant = (str: string): bool => {
    let firstChar = str -> Js.String2.get(0);
    switch firstChar {
        | "b" | "d" | "h" | "ḫ" | "g" | "k" | "l" | "m" | "n" | "p" | "r" | "s" | "š" 
        | "t" | "w" | "z" => true
        | _ => false
    }
}

let removeFirstChar = (str: string): string => {
    if (String.length(str) > 0) {
        str -> Js.String2.slice(~from=1, ~to_=Js.String2.length(str))
    } else {
        str
    }
}

let consonantVowelSequence = (str: string): string => {
    str 
    -> Js.String2.split("")
    -> Js.Array2.map((ch) => {
        switch ch {
            | "a" | "á" | "e" | "è" | "i" | "o" | "u" => "V"
            | _ => "C"
        }
    })
    ->Js.Array2.joinWith("")
}

let print = (verb: VerbShared.verbForm): result<string, string> => {
    let newArr = Array.make(~length=15, "");
    // builds the array with all the markers
    let outputArr = 
        verb.stem 
        -> addStem(newArr)
        -> addFirstPrefix(verb)
        -> addPreformative(verb)
        -> addVentive(verb)
        -> addAdverbial(verb)
        -> addMiddlePrefix(verb)
        -> addInitialPersonPrefix(verb)
        -> addIndirectObjectPrefix(verb)
        -> addComitative(verb)
        -> addLocative(verb)
        -> addFinalPersonPrefix(verb)
        -> addEdMarker(verb)
        -> addFinalPersonSuffix(verb)
    // apply phonological changes to the markers
    let outputRes = {
        // PERFORMATIVE CONTRACTION
        // TODO: 24.3.1 they are never found before a prefix with the shape /CV/.
        // Instead of a vocalic prefix we then find zero, that is, no preformative at all.
        let outputArr = switch outputArr[preformativePos] {
            | Some(preformative) if Js.String2.length(preformative) > 0 => {
                // find previous morpheme
                switch findPreviousMorpheme(outputArr, preformativePos) {
                    | Some((marker, _)) => {
                        switch (marker, preformative) {
                            | ("ḫa", "i") => {
                                // If the verbal form begins with the vocalic prefix /ʔi/ (§24.3),
                                // /ḫa/ contracts with it. The sequence /ḫaʔi/ thus becomes /ḫē/
                               let _ = outputArr[preformativePos] = "";
                               let _ = outputArr[firstPrefixPos] = "ḫē";
                               outputArr
                            }
                            | ("nu", "i") => {
                                // 24.3.2
                                let _ = outputArr[preformativePos] = "u";
                                outputArr
                            }
                            | _ => {
                                // no change
                                outputArr
                            }
                        }
                    }
                    | None => {
                        // 24.3.2 The prefix {ʔi} may also contract with the verbal stem,
                        // if the latter has an initial glottal stop.
                        switch findNextMorpheme(outputArr, preformativePos) {
                            | Some((morpheme, marker)) => {
                                if marker === Stem {
                                    // stem must start with CV and first consonant must be a glottal stop
                                    let stemStartStruct = 
                                        consonantVowelSequence(morpheme) -> Js.String2.slice(~from=0, ~to_=2);
                                    if stemStartStruct === "CV" && morpheme -> Js.String2.get(0) === "ʔ" {
                                        let prefix = morpheme -> Js.String2.get(1);
                                        let _ = outputArr[preformativePos] = prefix;
                                        outputArr
                                    } else {
                                        // no change
                                        outputArr
                                    }
                                } else {
                                    // no change
                                    outputArr
                                }
                            }
                            | None => {
                                // there is no marker after the preformative
                                outputArr
                            }
                        }
                    }
                }
            }
            | _ => outputArr
        };

        // INITIAL PERSON PREFIX CHANGES
        let outputArr = switch (outputArr[ventivePos], outputArr[initialPersonPrefixPos]) {
            | (Some(ventive), Some(ipp)) if Js.String2.length(ventive) > 0 => {
                if (ipp === "b") {
                    // First, the prefix {b} cannot occur between the ventive prefix and a consonant (see §22.4).
                    // Second, between the form /m/ of the ventive and a vowel, the prefix {b} assimilates to the /m/.
                    switch findNextMorpheme(outputArr, initialPersonPrefixPos) {
                        | Some((morpheme, _)) => {
                            if (morpheme -> startsWithConsonant && ventive === "mu") {
                                let _ = outputArr[initialPersonPrefixPos] = "";
                                outputArr
                            } else if (morpheme -> startsWithVowel && ventive === "m") {
                                let _ = outputArr[initialPersonPrefixPos] = "m";
                                outputArr
                            } else {
                                // no change
                                outputArr
                            }
                        }
                        | None => {
                            // there is no marker after the initial person prefix
                            outputArr
                        }
                    }
                } else {
                    // no change
                    outputArr
                }
            }
            | (Some(ventive), Some(ipp)) if Js.String2.length(ventive) === 0 => {
                // 16.2.5 In the texts of our corpus, the ventive prefix {mu} (chapter 17)
                // is always used before the initial person-prefix /ʔ/ and always has the form /mu/
                if ipp === "ʔ" {
                    let _ = outputArr[ventivePos] = "mu";
                    outputArr
                } else {
                    // no change
                    outputArr
                }
            }
            | _ => outputArr
        }

        let outputArr = switch outputArr[initialPersonPrefixPos] {
            | Some(ipp) if ipp === "e" => {
                // 16.2.4 The prefix {e} contracts with a preceding vowel, lengthening that vowel.
                switch findPreviousMorpheme(outputArr, initialPersonPrefixPos) {
                    | Some((marker, _)) => {
                        if (endsWithVowel(marker)) {
                            // gets the last vowel of the marker
                            let lastVowel = 
                                marker -> Js.String2.slice(~from=Js.String2.length(marker) - 1, ~to_=Js.String2.length(marker));
                            let _ = outputArr[initialPersonPrefixPos] = lastVowel;
                            outputArr
                        } else {
                            // no change
                            outputArr
                        }
                    }
                    | None => {
                        // there is no marker before the initial person prefix
                        outputArr
                    }
                }
            }
            | _ => outputArr
        }

        let outputArr = {
            // FINAL PERSON PREFIX CHANGES
            // 13.2.4 The prefix {e} contracts with a preceding vowel, lengthening that vowel
            switch outputArr[finalPersonPrefixPos] {
                | Some(fpp) if fpp === "e" => {
                    // find previous morpheme
                    switch findPreviousMorpheme(outputArr, finalPersonPrefixPos) {
                        | Some((marker, _)) => {
                            if (endsWithVowel(marker)) {
                                // gets the last vowel of the marker
                                let lastVowel = 
                                    marker -> Js.String2.slice(~from=Js.String2.length(marker) - 1, ~to_=Js.String2.length(marker));
                                let _ = outputArr[finalPersonPrefixPos] = lastVowel;
                                outputArr
                            } else {
                                // no change
                                outputArr
                            }
                        }
                        | None => {
                            // there is no marker before the final person prefix
                            outputArr
                        }
                    }
                }
                | _ => outputArr
            }
        }

        let outputArr = {
            // FINAL PERSON SUFFIX CONTRACTION
            // 14.1 First, the /e/ contracts with a preceding vowel.
            // Secondly, the /e/ may assimilate to a stem vowel /u/ or /i/.
            //TODO: Finally, the /e/ may be reduced in forms with the nominalizing suffix {ʔa}.
            switch outputArr[finalPersonSuffixPos] {
                | None => outputArr
                | Some(suffix) => {
                    // find previous morpheme
                    switch findPreviousMorpheme(outputArr, finalPersonSuffixPos) {
                        | Some((marker, _)) => {
                            // FIXME: leaving "e" untouched for now
                            if (String.length(suffix) > 1 && 
                                startsWithVowel(suffix) && 
                                endsWithVowel(marker)) {
                                // removes the first character of the suffix
                                let _ = outputArr[finalPersonSuffixPos] = removeFirstChar(suffix);
                                outputArr
                            } else {
                                // no change
                                outputArr
                            }
                        }
                        | None => {
                            // there is no marker before the preformative
                            outputArr
                        }
                    }
                }
            }
        }

        // ED MARKER CONTRACTION
        let outputArrRes = switch outputArr[edMarkerPos] {
            | Some(edMarker) => {
                // only the stem can be before the marker
                switch outputArr[stemPos] {
                    | Some(stem) => {
                        if endsWithVowel(stem) {
                            // removes the first character of the marker
                            let _ = outputArr[edMarkerPos] = removeFirstChar(edMarker);
                            Ok(outputArr)
                        } else {
                            // no change
                            Ok(outputArr)
                        }
                    }
                    | None => Error("No stem was set")
                }
                
            }
            | None => Ok(outputArr)
        };

        switch outputArrRes {
            | Error(err) => Error(err)
            | Ok(outputArr) => {
                switch outputArr[ventivePos] {
                    | Some(ventive) if Js.String2.length(ventive) > 0 => {
                        let iop = Option.getOr(outputArr[indirectObjectPrefixPos], "");
                        if (iop === "ba") {
                            // 17.2.1 After the ventive prefix (§22.2), the prefix {ba} has a slighly different form,
                            // because the /b/ of {ba} assimilates to the preceding /m/ of the ventive:
                            let _ = outputArr[indirectObjectPrefixPos] = "ma";
                            let _ = outputArr[ventivePos] = "m";
                            Ok(outputArr)
                        } else {
                            let middlePrefix = Option.getOr(outputArr[middlePrefixPos], "");
                            if middlePrefix === "ba" {
                                // 21.2 Only after the ventive prefix (§22.2), {ba} has a slightly different form,
                                // because the /b/ of {ba} assimilates to the preceding /m/ of the ventive.
                                let _ = outputArr[middlePrefixPos] = "ma";
                                let _ = outputArr[ventivePos] = "m";
                                Ok(outputArr)
                            } else {
                                // VENTIVE CONTRACTION                                
                                switch findNextMorpheme(outputArr, ventivePos) {
                                    | Some((morpheme, _)) => {                                        
                                        // 22.2 Before the indirect-object prefix {ra}, the oblique-object prefix {ri},
                                        // and the local prefix {ni}, however, the /u/ is always retained
                                        // but may assimilate to the vowel of the following syllable.                                        
                                        if (morpheme === "ni" || morpheme === "ri") {
                                            let _ = outputArr[ventivePos] = "mi";
                                            Ok(outputArr)
                                        } else if morpheme === "ra" {
                                            let _ = outputArr[ventivePos] = "ma";
                                            Ok(outputArr)
                                        } else {
                                            // 22.2 The basic form of the ventive prefix is /mu/, 
                                            // but the /u/ of the prefix is lost in the sequence /muCV/, that is, 
                                            // if followed by a consonant and a vowel (§3.9.4).
                                            let morphStartStruct = consonantVowelSequence(morpheme) -> Js.String2.slice(~from=0, ~to_=2);
                                            if (ventive === "mu" && morphStartStruct === "CV") {
                                                // removes the "u" of the ventive
                                                let _ = outputArr[ventivePos] = "m";
                                                Ok(outputArr)
                                            } else {
                                                // no change
                                                Ok(outputArr)
                                            }
                                        }
                                    }
                                    | None => Ok(outputArr)
                                }
                            }
                        }
                    }
                    | _ => Ok(outputArr)
                }
            }
        }
    };
    
    // returns the final string
    switch outputRes {
        | Error(err) => Error(err)
        | Ok(outputArr) => outputArr -> Js.Array2.joinWith("") -> Ok;
    }
}