(
(
name: \Inrange,
type: \busnode,
bus: { |s,nc| Bus.control( s, nc ) },
settings: ( low: 0.0, hi: 1.0 ),
synthdef: { |rate,nc|
    var synthDef;
    synthDef = (\InRangeNode++nc).asSymbol;
    SynthDef( synthDef, { arg out=0, in=1, mul=1, gate=1, low=0.1, hi=1;
        EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );
        Out.kr( out,
            InRange.kr( In.kr( in,nc ) * mul, low, hi )
        );
    }).add;
    synthDef;
}
);
);