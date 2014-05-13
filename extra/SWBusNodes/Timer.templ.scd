(
(
name: \Timer,
type: \busnode,
bus: { |s,nc| Bus.control( s, nc ) },
// settings: (),
synthdef: { |rate,nc|
    var synthDef = (\TimerNode++nc).asSymbol;
    SynthDef( synthDef, { arg out=0, in=1, mul=1, gate=1;
        EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );
        Out.kr( out, Timer.kr( In.kr( in, nc )*mul ) );
    }).add;
    synthDef;
};
);
);
