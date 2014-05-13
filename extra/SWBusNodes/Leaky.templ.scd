(
(
name: \Leaky,
type: \busnode,
bus: { |s,nc| Bus.control( s, nc ) },
settings: ( posSlope1: 1.0, posSlope2: -1.0, negSlope: 0.015, minValue: 0.0 ),
synthdef: { |rate,nc|
    var synthDef = (\LeakyNode++nc).asSymbol;
    SynthDef( synthDef, { arg out=0, in=1, mul=1, gate=1, posSlope1=1,posSlope2=(-1),negSlope=0.015, minValue=0.0;
        EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );
        Out.kr( out, mul *
            FOS.kr( In.kr( in, nc ), posSlope1, posSlope2, -1*negSlope ).max( minValue );
        );
    }).add;
    synthDef;
}
);
);
