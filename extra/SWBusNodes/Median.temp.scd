(
(
name: \Median,
type: \busnode,
bus: { |s,nc| Bus.control( s, nc ) },
settings: ( length: 21 ),
synthdef: { |rate,nc|
    var synthDef;
    synthDef = (\MedianNode++nc).asSymbol;
    SynthDef( synthDef, { arg out=0, in=1, mul=1, gate=1, length=21;
        EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );
        Out.kr( out, Median.kr(length, In.kr(in, nc ) * mul) );
    }).add;
    synthDef;
}
);
);
