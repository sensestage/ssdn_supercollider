(
(
name: \ASRmul,
type: \busnode,
bus: { |s,nc| Bus.control( s, nc ) },
synthdef: { |rate,nc|
    var synthDef;
    synthDef = (\ASRmul++nc).asSymbol;
    SynthDef( synthDef, { arg out=0, in=1, mul=1, gate=1, attack=0.5, release = 3.0, curve = 0;
        var input, maxval;
        EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );
        input = In.kr( in,nc ) * mul;
        maxval = RunningMax.kr( input, input ); // assumes input is going from 0 to a value, like a trigger (use with a previous InRange)
        Out.kr( out,
            EnvGen.kr(
                Env.asr( attack,maxval,release,curve ),
                input // gate
        ));
    }).add;
    synthDef;
}
);
);
