open Infixes
/*
    Slot 1 Modal prefix (ḫa), negative particle, prefix of anteriority, stem (in imperative forms)
    Slot 2 Finite-marker prefix, modal prefixes (all the other)
    Slot 3 Coordinator prefix
    Slot 4 Ventive (cislocative) prefix
    Slot 5 Middle prefix or the 3.SG.NH pronominal prefix /b/ (specifying the person,
    gender and number of the first in the sequence of adverbial prefixes)
    Slot 6 Initial Pronominal Prefix (= IPP) (specifying the person, gender and number
    of the first in the sequence of adverbial prefixes)
    Slot 7 Adverbial I: dative prefix
    Slot 8 Adverbial II: comitative prefix
    Slot 9 Adverbial III: ablative or terminative prefix
    Slot 10 Adverbial IV: locative1, locative2, or locative3 prefix
    Slot 11 Final Pronominal Prefix (= FPP) (referring to A or P, depending on the tense,
    or locative3)
    Slot 12 stem
    Slot 13 present-future marker (in intransitive verbs)
    Slot 14 pronominal suffix (referring A, S, or P depending on the tense)
    Slot 15 subordinator
*/

type t = VerbShared.verbForm;

type personParam =
    | FirstSing
    | SecondSing
    | ThirdSingHuman
    | ThirdSingNonHuman
    | FirstPl
    | SecondPl
    | ThirdPlHuman
    | ThirdPlNonHuman

type ipfvStem =
    | Reduplicate
    | EdMarker
    | Other(string)

let new = (stem: string): t => {
    {
        stem,
        is_perfective: false,
        is_transitive: false,
        firstPrefix: None,
        preformative: None,
        coordinator: false,
        ventive: false,
        middlePrefix: false,
        initialPersonPrefix: None,
        indirectObjectPrefix: None,
        comitative: false,
        adverbial: None,
        locative: None,
        finalPersonPrefix: None,
        edMarker: false,
        finalPersonSuffix: None,
        subordinator: false
    }
}

let isPerfective = (verb: t): t => {
    {...verb, is_perfective: true}
}

let isImperfective = (verb: t, ipfvStem: option<ipfvStem>): t => {
    switch (ipfvStem) {
        | Some(Reduplicate) => {...verb, stem: verb.stem ++ "-" ++ verb.stem, is_perfective: false, edMarker: false}
        | Some(EdMarker) => {...verb, is_perfective: false, edMarker: true}
        | Some(Other(stem)) => {...verb, is_perfective: false, stem}
        | None => {...verb, is_perfective: false}
    }
}

let isTransitive = (verb: t): t => {
    {...verb, is_transitive: true}
}

let isIntransitive = (verb: t): t => {
    {...verb, is_transitive: false}
}

let setNegative = (verb: t): t => {
    {...verb, firstPrefix: Some(FirstPrefix.Negative)}
}

let setModal = (verb: t): t => {
    {...verb, firstPrefix: Some(FirstPrefix.Modal)}
}

let setPreformative = (verb: t, preformative: preformative): t => {
    {...verb, preformative: Some(preformative)}
}

let setCoordinator = (verb: t): t => {
    {...verb, coordinator: true}
}

let setVentive = (verb: t): t => {
    {...verb, ventive: true}
}

let setTerminative = (verb: t, person: option<personParam>): t => {
    let ipp: option<initialPersonPrefix> = switch person {
        | Some(FirstSing) => Some(FirstSing)
        | Some(SecondSing) => Some(SecondSing)
        | Some(ThirdSingHuman) => Some(ThirdSingHuman)
        | Some(ThirdSingNonHuman) => Some(ThirdSingNonHuman)
        | Some(FirstPl) => Some(FirstPlur)
        | Some(SecondPl) => Some(SecondPlur)
        | Some(ThirdPlHuman) => Some(ThirdPlurHuman)
        | Some(ThirdPlNonHuman) => Some(ThirdPlurNonHuman)
        | None => None
    }
    {...verb, adverbial: Some(Terminative), initialPersonPrefix: ipp}
}

let setAblative = (verb: t, person: option<personParam>): t => {
    let ipp: option<initialPersonPrefix> = switch person {
        | Some(FirstSing) => Some(FirstSing)
        | Some(SecondSing) => Some(SecondSing)
        | Some(ThirdSingHuman) => Some(ThirdSingHuman)
        | Some(ThirdSingNonHuman) => Some(ThirdSingNonHuman)
        | Some(FirstPl) => Some(FirstPlur)
        | Some(SecondPl) => Some(SecondPlur)
        | Some(ThirdPlHuman) => Some(ThirdPlurHuman)
        | Some(ThirdPlNonHuman) => Some(ThirdPlurNonHuman)
        | None => None
    }
    {...verb, adverbial: Some(Ablative), initialPersonPrefix: ipp}
}

let setMiddlePrefix = (verb: t): t => {
    {...verb, middlePrefix: true}
}

let setInitialPersonPrefix = (verb: t, ipp: personParam): t => {
    let prefix: initialPersonPrefix = switch ipp {
        | FirstSing => FirstSing
        | SecondSing => SecondSing
        | ThirdSingHuman => ThirdSingHuman
        | ThirdSingNonHuman => ThirdSingNonHuman
        | FirstPl => FirstPlur
        | SecondPl => SecondPlur
        | ThirdPlHuman => ThirdPlurHuman
        | ThirdPlNonHuman => ThirdPlurNonHuman
    }
    {...verb, initialPersonPrefix: Some(prefix)}
}

let setIndirectObject = (verb: t, ipp: personParam): t => {
    let prefix: indirectObjectPrefix = switch ipp {
        | FirstSing => FirstSing
        | SecondSing => SecondSing
        | ThirdSingHuman => ThirdSingHuman
        | ThirdSingNonHuman => ThirdSingNonHuman
        | FirstPl => FirstPlur
        | SecondPl => SecondPlur
        | ThirdPlHuman => ThirdPlurHuman
        | ThirdPlNonHuman => ThirdPlurNonHuman
    }
    {...verb, indirectObjectPrefix: Some(prefix)}
}

let setComitative = (verb: t, person: option<personParam>): t => {
    let ipp: option<initialPersonPrefix> = switch person {
        | Some(FirstSing) => Some(FirstSing)
        | Some(SecondSing) => Some(SecondSing)
        | Some(ThirdSingHuman) => Some(ThirdSingHuman)
        | Some(ThirdSingNonHuman) => Some(ThirdSingNonHuman)
        | Some(FirstPl) => Some(FirstPlur)
        | Some(SecondPl) => Some(SecondPlur)
        | Some(ThirdPlHuman) => Some(ThirdPlurHuman)
        | Some(ThirdPlNonHuman) => Some(ThirdPlurNonHuman)
        | None => None
    }
    {...verb, comitative: true, initialPersonPrefix: ipp}
}

let setLocativeIn = (verb: t, person: option<personParam>): t => {
    switch (person) {
        | Some(_) => {...verb, locative: Some(InWithInitialPerson)}
        | None => {...verb, locative: Some(InWithoutInitialPerson)}
    }
}

let setLocativeOn = (verb: t, person: option<personParam>): t => {
    switch (person) {
        | Some(_) => {...verb, locative: Some(OnWithInitialPerson)}
        | None => {...verb, locative: Some(OnWithoutInitialPerson)}
    }
}

let setSubject = (verb: t, person: personParam): t => {
    if !verb.is_transitive || (verb.is_transitive && !verb.is_perfective) {
        let suffix: option<finalPersonSuffix> = switch person {
            | FirstSing => Some(FirstSing)
            | SecondSing => Some(SecondSing)
            | ThirdSingHuman => Some(ThirdSingHuman)
            | ThirdSingNonHuman => Some(ThirdSingNonHuman)
            | FirstPl => Some(FirstPlur)
            | SecondPl => Some(SecondPlur)
            | ThirdPlHuman => Some(ThirdPlurHuman)
            | ThirdPlNonHuman => Some(ThirdPlurNonHuman)
        }
        {...verb, finalPersonSuffix: suffix}
    } else {
        let prefix: option<finalPersonPrefix> = switch person {
            | FirstSing => Some(FirstSing)
            | SecondSing => Some(SecondSing)
            | ThirdSingHuman => Some(ThirdSingHuman)
            | ThirdSingNonHuman => Some(ThirdSingNonHuman)
            | _ => %todo("TODO: handle plural subjects in perfective verbs")
        }
        {...verb, finalPersonPrefix: prefix}
    }
}

let setObject = (verb: t, person: personParam): t => {
    if verb.is_transitive && verb.is_perfective {
        let suffix: option<finalPersonSuffix> = switch person {
            | FirstSing => Some(FirstSing)
            | SecondSing => Some(SecondSing)
            | ThirdSingHuman => Some(ThirdSingHuman)
            | ThirdSingNonHuman => Some(ThirdSingNonHuman)
            | FirstPl => Some(FirstPlur)
            | SecondPl => Some(SecondPlur)
            | ThirdPlHuman => Some(ThirdPlurHuman)
            | ThirdPlNonHuman => Some(ThirdPlurNonHuman)
        }
        {...verb, finalPersonSuffix: suffix}
    } else if verb.is_transitive && !verb.is_perfective {
        let prefix: option<finalPersonPrefix> = switch person {
            | FirstSing => Some(FirstSing)
            | SecondSing => Some(SecondSing)
            | ThirdSingHuman => Some(ThirdSingHuman)
            | ThirdSingNonHuman => Some(ThirdSingNonHuman)
            | _ => %todo("TODO: handle plural objects in imperfective verbs")
        }
        {...verb, finalPersonPrefix: prefix}
    } else {
        // cannot set the object of an intransitive verb
        // TODO: may be worth throwing an error here
        // but it will mess with the verb building with pipes
        verb
    }
}

let setEdMarker = (verb: t): t => {
    {...verb, edMarker: true}
}

let print = (verb: t): result<string, string> => VerbOutput.print(verb)