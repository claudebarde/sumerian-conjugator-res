open Infixes 
open Utils

type t = VerbShared.verbOutput;
type multiResult = {
    verb: string,
    analysis: VerbAnalysis.t,
    warnings: array<string>
}

let addStem = (stem: string, arr: t): result<t, string> => {
    arr[stemPos] = stem
    Ok(arr)
}

let addFirstPrefix = (arr: result<t, string>, verb: VerbShared.verbForm): result<t, string> => {
     switch arr {
        | Error(err) => Error(err)
        | Ok(arr) => {
            switch (verb.firstPrefix) {
            | Some(FirstPrefix.Modal) => arr[firstPrefixPos] = "ḫa"
            | Some(FirstPrefix.Negative) => arr[firstPrefixPos] = "nu"
            | Some(FirstPrefix.NegativeNan) => arr[firstPrefixPos] = "nan"
            | Some(FirstPrefix.ModalGa) => arr[firstPrefixPos] = "ga"
            | None => ()
            }
            Ok(arr)
        }
     }
}

let addPreformative = (arr: result<t, string>, verb: VerbShared.verbForm): result<t, string> => {
    switch arr {
        | Error(err) => Error(err)
        | Ok(arr) => {
            switch (verb.preformative) {
            | Some(A) => arr[preformativePos] = "a"
            | Some(I) => arr[preformativePos] = "i"
            | Some(U) => arr[preformativePos] = "u"
            | None => ()
            }
            Ok(arr)
        }
    }
}

// TODO: create a function to add the coordinator prefix

let addVentive = (arr: result<t, string>, verb: VerbShared.verbForm): result<t, string> => {
    switch arr {
        | Error(err) => Error(err)
        | Ok(arr) =>{
            if (verb.ventive) {
                arr[ventivePos] = "mu"
            }
            Ok(arr)
        }
    }
}

let addAdverbial = (arr: result<t, string>, verb: VerbShared.verbForm): result<t, string> => {
    switch arr {
        | Error(err) => Error(err)
        | Ok(arr) => {
            switch (verb.adverbial) {
                | Some(Ablative) => arr[adverbialPos] = "ta"
                | Some(Terminative) => arr[adverbialPos] = "ši"
                | None => ()
            }
            Ok(arr)
        }
    }
}

let addMiddlePrefix = (arr: result<t, string>, verb: VerbShared.verbForm): result<t, string> => {
    switch arr {
        | Error(err) => Error(err)
        | Ok(arr) =>{
            if (verb.middlePrefix) {
                arr[middlePrefixPos] = "ba"
            }
            Ok(arr)
        }
    }
}

let addInitialPersonPrefix = (arr: result<t, string>, verb: VerbShared.verbForm): result<t, string> => {
    switch arr {
        | Error(err) => Error(err)
        | Ok(arr) => {
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
            Ok(arr)
        }
    }
}

let addIndirectObjectPrefix = (arr: result<t, string>, verb: VerbShared.verbForm): result<t, string> => {
    switch arr {
        | Error(err) => Error(err)
        | Ok(arr) =>{
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
            Ok(arr)
        }
    }
}

let addComitative = (arr: result<t, string>, verb: VerbShared.verbForm): result<t, string> => {
    switch arr {
        | Error(err) => Error(err)
        | Ok(arr) => {
            if (verb.comitative) {
                arr[comitativePos] = "da"
            }
            Ok(arr)
        }
    }
}

let addLocative = (arr: result<t, string>, verb: VerbShared.verbForm): result<t, string> => {
    // TODO: The local prefix {ni} is the only dimensional prefix that is never combined with an initial person-prefix. 20.2.1
    switch arr {
        | Error(err) => Error(err)
        | Ok(arr) => {
            switch (verb.locative) {
                | Some(InWithInitialPerson) => arr[locativePos] = ""
                | Some(InWithoutInitialPerson) => arr[locativePos] = "ni"
                | Some(OnWithInitialPerson) => arr[locativePos] = "bi"
                | Some(OnWithoutInitialPerson) => arr[locativePos] = "e"
                | None => ()
            }
            Ok(arr)
        }
    }
}

let addFinalPersonPrefix = (arr: result<t, string>, verb: VerbShared.verbForm): result<t, string> => {
    switch arr {
        | Error(err) => Error(err)
        | Ok(arr) => {
            switch (verb.finalPersonPrefix) {
                | Some(FirstSing) => arr[finalPersonPrefixPos] = "ʔ"
                | Some(SecondSing) => arr[finalPersonPrefixPos] = "e"
                | Some(ThirdSingHuman) => arr[finalPersonPrefixPos] = "n"
                | Some(ThirdSingNonHuman) => arr[finalPersonPrefixPos] = "b"
                | None => ()
            }
            Ok(arr)
        }
    }
}

let addEdMarker = (arr: result<t, string>, verb: VerbShared.verbForm): result<t, string> => {
    switch arr {
        | Error(err) => Error(err)
        | Ok(arr) => {
            if (verb.edMarker) {
                arr[edMarkerPos] = "ed"
            }
            Ok(arr)
        }
    }
}

let addFinalPersonSuffix = (arr: result<t, string>, verb: VerbShared.verbForm): result<t, string> => {
    switch arr {
        | Error(err) => Error(err)
        | Ok(arr) => {
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
            Ok(arr)
        }
    }
}

let addObliqueObject = (arr: result<t, string>, verb: VerbShared.verbForm): result<t, string> => {
    // 18.2.1 Expressing an oblique object is only one possible use of the final person-prefixes, and it is
    // the least important one. The final person-prefixes have two other uses, which have priority
    switch arr {
        | Error(err) => Error(err)
        | Ok(arr) => {
            switch verb.obliqueObject {
                | FinalPersonPrefix(finalPersonPrefix) => {
                    switch verb.finalPersonPrefix {
                        | Some(_) => Error("Oblique object would overwrite final person prefix")
                        | None => {
                            let _ = 
                                arr[finalPersonPrefixPos] = 
                                    switch finalPersonPrefix {
                                        | FirstSing => "ʔ"
                                        | SecondSing => "e"
                                        | ThirdSingHuman => "n"
                                        | ThirdSingNonHuman => "b"
                                    };
                            Ok(arr)
                        }
                    }
                }
                | InitialPersonPrefix(initialPersonPrefix) => {
                    switch verb.initialPersonPrefix {
                        | Some(_) => Error("Oblique object would overwrite initial person prefix")
                        | None => {
                            let _ = 
                                arr[initialPersonPrefixPos] = 
                                    switch initialPersonPrefix {
                                        | FirstSing => "mu"
                                        | SecondSing => "ri"
                                        | ThirdSingHuman => "nni"
                                        | ThirdSingNonHuman => "bi"
                                        | FirstPlur => "mē"
                                        | SecondPlur => "enē"
                                        | ThirdPlurHuman => "nnē"
                                        | ThirdPlurNonHuman => "bi"
                                    };
                            Ok(arr)
                        }
                    }
                }
                | None => Ok(arr)
            }
        }
    }
}

let print = (verb: VerbShared.verbForm): result<multiResult, string> => {
    let warnings = [];
    let newArr = Array.make(~length=15, "");
    // builds the array with all the markers
    let outputRes = 
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
        -> addObliqueObject(verb)

    switch outputRes {
        | Error(err) => Error(err)
        | Ok(outputArr) => {
            // apply phonological changes to the markers
            let outputRes = {
                // PREFORMATIVE CONTRACTION
                // TODO: 24.3.1 they are never found before a prefix with the shape /CV/.
                // Instead of a vocalic prefix we then find zero, that is, no preformative at all.
                let outputArr = switch outputArr[preformativePos] {
                    | Some(preformative) if Js.String2.length(preformative) > 0 => {
                        // find previous morpheme
                        switch findPreviousMorpheme(outputArr, preformativePos) {
                            | Some((marker, _)) => {
                                switch (marker, preformative) {
                                    // TODO: An imperfective form with {h~a} is always transitive 25.4.2
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

                // LOCATIVE CHANGES
                let outputArr = {
                    switch outputArr[locativePos] {
                        | Some(locative) if Js.String2.length(locative) > 0 => {
                            // 21.2 (7) Although there are many plene spellings of the type ba-a-, they
                            // typically represent a sequence of two different prefixes, mostly a contraction of {ba} and {e}.
                            if locative === "e" {
                                // TODO: 20.3.1 If the verbal form also contains a final person-prefix, the
                                // local prefix {e} cannot be used at all.
                                switch findPreviousMorpheme(outputArr, locativePos) {
                                    // 20.3.1 This /e/ has the same forms and spellings as the final
                                    // person-prefix {e} of the second person.
                                    // Just like the latter, it contracts with a preceding vowel,                              lengthening the preceding vowel
                                    | Some((morpheme, marker)) => {
                                        switch marker {
                                            | MiddlePrefix if morpheme === "ba" => {
                                                let _ = outputArr[locativePos] = "a"
                                                outputArr
                                            } 
                                            | _ => {
                                                if morpheme->endsWithVowel{
                                                    let newMorpheme = String.substringToEnd(morpheme, ~start=String.length(morpheme) - 1)
                                                    let _ = outputArr[locativePos] = newMorpheme
                                                    outputArr
                                                } else {
                                                    outputArr
                                                }
                                            }
                                        }
                                    }
                                    | None => outputArr
                                }
                            } else if locative === "bi" {
                                switch findPreviousMorpheme(outputArr, locativePos) {
                                    | Some((_, marker)) => {
                                        switch marker {
                                            | Ventive => {
                                                let _ = outputArr[locativePos] = "mi"
                                                let _ = outputArr[ventivePos] = "m"
                                                outputArr
                                            } 
                                            | _ => {
                                                switch outputArr[finalPersonPrefixPos] {
                                                | Some(fpp) if fpp === "" => {
                                                    // TODO: verify that "bi" behaves like "ni"
                                                    let _ = outputArr[locativePos] = "b"
                                                    outputArr
                                                }
                                                | _ => outputArr
                                            }
                                            }
                                        }
                                    }
                                    | None => outputArr
                                }
                            } else if locative === "ni" {
                                switch outputArr[finalPersonPrefixPos] {
                                    | Some(fpp) if fpp === "" => {
                                        // 20.2.1 In the absence of a final person-prefix, the prefix {ni} stands immediately before the stem.
                                        // Since every stem begins with a consonant and a vowel (§3.10), {ni} is then found in the
                                        // sequence /niCV/, where the /i/ of the prefix is lost (§3.9.4).
                                        let _ = outputArr[locativePos] = "n"
                                        outputArr
                                    }
                                    | _ => outputArr
                                }
                            } else {
                                // no changes
                                outputArr
                            }
                        }
                        | _ => outputArr
                    }
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
                                    if suffix === "e" {
                                        // finds the previous vowel and assimilates the "e"
                                        switch outputArr[edMarkerPos] {
                                            | Some(marker) if String.length(marker) > 0 => {
                                                // CHECK: may need to assimilate the "e" anyway
                                                // if the "e" of ED marker assimilated to the stem
                                                outputArr
                                            }
                                            | _ => {
                                                // CHECK: may need to assimilate the "e" anyway
                                                // to the last vowel of the stem
                                                if verb.stem->endsWithVowel {
                                                    let lastVowel = 
                                                        verb.stem
                                                        ->String.get(String.length(verb.stem) - 1)
                                                        ->Option.getExn(~message="Verb stem is missing")
                                                    // CHECK: the other vowels may assimilate the "e" too
                                                    if lastVowel === "a" {
                                                        let _ = outputArr[finalPersonSuffixPos] = lastVowel
                                                        outputArr
                                                    } else {
                                                        outputArr
                                                    }
                                                } else {
                                                    outputArr
                                                }
                                            }
                                        }
                                    } else if (String.length(suffix) > 1 && 
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
                        let outputArrRes = switch outputArr[ventivePos] {
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
                                            | Some((morpheme, marker)) => {                                        
                                                // 22.2 Before the indirect-object prefix {ra}, the oblique-object prefix {ri},
                                                // and the local prefix {ni}, however, the /u/ is always retained
                                                // but may assimilate to the vowel of the following syllable.                                        
                                                if (morpheme === "ni" || morpheme === "ri") {
                                                    let _ = outputArr[ventivePos] = "mi";
                                                    Ok(outputArr)
                                                } else if morpheme === "ra" {
                                                    let _ = outputArr[ventivePos] = "ma";
                                                    Ok(outputArr)
                                                } else if morpheme === "bi" {
                                                    // 18.2.2 If /bi/ follows the ventive prefix, the /b/ of /bi/ assimilates to the preceding /m/:
                                                    let _ = outputArr[ventivePos] = "m";
                                                    let _ = outputArr[markerToPos(marker)] = "mi";
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

                        switch outputArrRes {
                        | Error(err) => Error(err)
                        | Ok(outputArr) => switch outputArr[firstPrefixPos] {
                                | Some(firstPrefix) if String.length(firstPrefix) > 0 => {
                                    switch firstPrefix {
                                    | "nu" => {
                                        // 25.2 If the following vowel is /a/, {nu} becomes /na/. 
                                        // This /na/ is written explicitly from the Ur III period onwards. Earlier texts have nu.
                                        switch findNextMorpheme(outputArr, firstPrefixPos) {
                                            | Some((morpheme, _)) => {
                                                switch (morpheme->String.get(0), morpheme->String.get(1)) {
                                                    | (Some(ch1), Some(ch2)) 
                                                        if ch1 === "b" && ch2 === "a" => {
                                                        let _ = outputArr[firstPrefixPos] = "la";
                                                        Ok(outputArr)
                                                    }
                                                    | (Some(ch1), Some(ch2)) 
                                                        if ch1 === "b" && ch2 === "i" => {
                                                        let _ = outputArr[firstPrefixPos] = "li";
                                                        Ok(outputArr)
                                                    }
                                                    | (Some(ch1), Some(ch2)) 
                                                        if ch1 !== "b" && ch2 === "a" => {
                                                        let _ = outputArr[firstPrefixPos] = "na";
                                                        Ok(outputArr)
                                                    }
                                                    | (Some(ch1), Some(ch2)) 
                                                        if ch1 !== "b" && ch2 === "i" => {
                                                        let _ = outputArr[firstPrefixPos] = "na";
                                                        Ok(outputArr)
                                                    }
                                                    | _ => {
                                                        // no change
                                                        Ok(outputArr)
                                                    }
                                                }
                                            }
                                            | _ => Ok(outputArr)
                                        }
                                        // TODO: 
                                        // 17.2.4 (38) Also, the negative proclitic {nu} is never written nu-ù- before {ra}, a spelling that would be
                                        // expected to occur if {nu} were followed by /÷i/ (§25.2). E.g.:
                                    }
                                    | "nan" => {
                                        // TODO: 25.5 while negative {na(n)} is almost exclusively used in imperfective forms
                                        // 25.5 /nan/ is used before a single consonant (i.e., before /CV/) and 
                                        // /na/ before a cluster of two consonants (i.e., before /CC/). 
                                        // The form /na/ is probably also the one used before a vowel
                                        let tempVerb = outputArr->Array.sliceToEnd(~start=1)->Array.join("");
                                        let cvcSeq = consonantVowelSequence(tempVerb);
                                        if String.slice(cvcSeq, ~start=0, ~end=2) === "CC"
                                            || String.slice(cvcSeq, ~start=0, ~end=1) === "V" {
                                            let _ = outputArr[firstPrefixPos] = "na";
                                            Ok(outputArr)
                                        } else {
                                            // 25.5 A by-form /nam/ occurs before /b/ or /m/
                                            if String.slice(tempVerb, ~start=0, ~end=1) === "b"
                                            || String.slice(tempVerb, ~start=0, ~end=1) === "m" {
                                                let _ = outputArr[firstPrefixPos] = "nam";
                                                Ok(outputArr)
                                            } else {
                                                // no change
                                                Ok(outputArr)
                                            }
                                        }
                                    }
                                    | "ga" => {
                                        // 25.6 The verbal forms with the prefix {ga} have a hybrid make-up, 
                                        // just like those of the imperative (§25.3). 
                                        // They have perfective stem forms (§15.3.1) 
                                        // but they use the final person-prefixes as in the imperfective inflection (§15.2.3).
                                        if !verb.is_perfective {
                                            Error("The modal \"ga\" requires a perfective verb form")
                                        } else if verb.is_transitive {
                                            // the subject must be first person
                                            switch verb.finalPersonPrefix {
                                                | Some(ps) => 
                                                    switch ps {
                                                        | FirstSing => {
                                                            // switches the position of the object
                                                            switch verb.finalPersonSuffix {
                                                                | Some(fps) => {
                                                                    let tempVerb = { ...verb, finalPersonPrefix: Some(fps->fromFPStoFPP)}
                                                                    switch addFinalPersonPrefix(Ok(outputArr), tempVerb) {
                                                                        | Error(_) => Error("Error while switching fpp and fps with \"ga\" modal")
                                                                        | Ok(newOutputArr) => Ok(newOutputArr)
                                                                    }
                                                                }
                                                                | None => {
                                                                    let _ = outputArr[finalPersonPrefixPos] = ""
                                                                    Ok(outputArr)
                                                                }
                                                            }
                                                        }
                                                        | _ => Error("The modal \"ga\" doesn't need a subject")
                                                    }
                                                | None => {
                                                    // 25.6 The final person-prefixes can also be used to refer to the oblique object.
                                                    switch verb.obliqueObject {
                                                        | None => Ok(outputArr)
                                                        | FinalPersonPrefix(_) => Ok(outputArr)
                                                        | InitialPersonPrefix(ipp) => {
                                                            // switches the position of the object
                                                            let tempVerb = { ...verb, finalPersonPrefix: Some(ipp->fromIPPtoFPP)}
                                                            switch addFinalPersonPrefix(Ok(outputArr), tempVerb) {
                                                                | Error(_) => Error("Error while switching fpp and fps with \"ga\" modal")
                                                                | Ok(newOutputArr) => Ok(newOutputArr)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        } else {                                            
                                            Ok(outputArr)
                                        }
                                    }
                                    | _ => Ok(outputArr)
                                }
                                }
                                | _ => Ok(outputArr)
                            } 
                        }
                    }
                }
            };
            
            // returns the final string
            switch outputRes {
                | Error(err) => Error(err)
                | Ok(outputArr) => { 
                    verb: outputArr->Js.Array2.joinWith(""),
                    analysis: outputArr->VerbAnalysis.analyse(verb, VerbAnalysis.new(), 0),
                    warnings
                }->Ok;
            }
        }
    };
}