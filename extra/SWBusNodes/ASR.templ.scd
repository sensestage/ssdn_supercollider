(
(
name: \ASR,
type: \busnode,
bus: { |s,nc| Bus.control( s, nc ) },
synthdef: { |rate,nc|
    var synthDef;
    synthDef = (\ASRNode++nc).asSymbol;
    SynthDef( synthDef, { arg out=0, in=1, mul=1, gate=1, attack=0.5, release = 3.0, curve = 0;
        var input;
        EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );
        input = In.kr( in,nc );
        Out.kr( out,
            EnvGen.kr(
                Env.asr( attack,1,release,curve ),
                input // gate
        ) * mul);
    }).add;
    synthDef;
}
);
);