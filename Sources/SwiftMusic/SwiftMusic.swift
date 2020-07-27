
infix operator ===: AdditionPrecedence
infix operator +++: AdditionPrecedence

typealias Octave = Int

typealias AbsPitch = Int

typealias Dur = Rational

enum InstrumentName {
    case acousticGrandPiano // TODO: fill in the rest
}

enum Mode {
    case major
    case minor
    case ionian
    case dorian
    case phrygian
    case lydian
    case mixolydian
    case aeolian
    case locrian
    case customMode(String)
}

enum PitchClass {
    case Cff, Cf, C, Dff, Cs, Df, Css, D, Eff, Ds,
    Ef, Fff, Dss, E, Ff, Es, F, Gff, Ess, Fs,
    Gf, Fss, G, Aff, Gs, Af, Gss, A, Bff, As,
    Bf, Ass, B, Bs, Bss
}

typealias Pitch = (PitchClass, Octave)

enum Primitive<T> {
    case note(Dur, T)
    case rest(Dur)
}

enum Control {
    case tempo(Rational)
    case transpose(AbsPitch)
    case instrument(InstrumentName)
    //case phrase([PhraseAttribute])
    case keySig(PitchClass, Mode)
    case custom(String)
}

indirect enum Music<T> {
    case prim(Primitive<T>)
    case sequence(Music<T>, Music<T>)
    case parallel(Music<T>, Music<T>)
    case modify(Control, Music<T>)
}

extension Music {
    static func ===(left: Music<T>, right: Music<T>) -> Music<T> {
        return .parallel(left, right)
    }
    
    static func +++(left: Music<T>, right: Music<T>) -> Music<T> {
        return .sequence(left, right)
    }
}

func note<T>(duration: Dur, pitch: T) -> Music<T> {
    return .prim(.note(duration, pitch))
}

func rest<T>(duration: Dur) -> Music<T> {
    return .prim(.rest(duration))
}

func tempo<T>(r: Dur, m: Music<T>) -> Music<T> {
    return .modify(.tempo(r), m)
}

func transpose<T>(pitch: AbsPitch, m: Music<T>) -> Music<T> {
    return .modify(.transpose(pitch), m)
}

func instrument<T>(name: InstrumentName, m: Music<T>) -> Music<T> {
    return .modify(.instrument(name), m)
}

//func phrase<T>(attribs: [PhraseAttribute], m: Music<T>) -> Music<T> {
//    return .modify(.phrase(attribs), m)
//}

func keysig<T>(pitchClass: PitchClass, mode: Mode, m: Music<T>) -> Music<T> {
    return .modify(.keySig(pitchClass, mode), m)
}

func cff(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Cff, o))
}

func c(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.C, o))
}

func css(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Css, o))
}

func df(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Df, o))
}

func ds(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Ds, o))
}

func eff(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Eff, o))
}

func e(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.E, o))
}

func ess(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Ess, o))
}

func ff(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Ff, o))
}

func fs(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Fs, o))
}

func gff(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Gff, o))
}

func g(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.G, o))
}

func gss(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Gss, o))
}

func af(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Af, o))
}

func `as`(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.As, o))
}

func bff(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Bff, o))
}

func b(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.B, o))
}

func bss(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Bss, o))
}

func cf(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Cf, o))
}

func cs(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Cs, o))
}

func dff(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Dff, o))
}

func d(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.D, o))
}

func dss(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Dss, o))
}

func ef(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Ef, o))
}

func es(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Es, o))
}

func fff(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Fff, o))
}

func f(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.F, o))
}

func fss(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Fss, o))
}

func gf(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Gf, o))
}

func gs(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Gs, o))
}

func aff(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Aff, o))
}

func a(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.A, o))
}

func ass(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Ass, o))
}

func bf(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Bf, o))
}

func bs(o: Octave, d: Dur) -> Music<Pitch> {
    return note(duration: d, pitch: (.Bs, o))
}

let bn = Rational(num: 2, denom: 1)
let wn = Rational(num: 1, denom: 1)

let dMinor = d(o: 4, d: wn) === f(o: 4, d: wn) === a(o: 4, d: wn)
let gMajor = g(o: 4, d: wn) === b(o: 4, d: wn) === d(o: 5, d: wn)
let cMajor = c(o: 4, d: bn) === e(o: 4, d: bn) === g(o: 4, d: bn)

let t251: Music<Pitch> = dMinor +++ gMajor +++ cMajor
