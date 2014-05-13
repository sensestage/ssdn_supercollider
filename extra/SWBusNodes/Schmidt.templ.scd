(
(
name: \Schmidt,
type: \busnode,
bus: { |s,nc| Bus.control( s, nc ) },
settings: ( low: 0.0, hi: 1.0 ),
synthdef: { |rate,nc|
    var synthDef;
    synthDef = (\SchmidtNode++nc).asSymbol;
    SynthDef( synthDef, { arg out=0, in=1, mul=1, gate=1, low=0.1, hi=0.5;
        EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );
        Out.kr( out,
            Schmidt.kr( In.kr( in,nc ) * mul, low, hi )
        );
    }).add;
    synthDef;
}
);
);
