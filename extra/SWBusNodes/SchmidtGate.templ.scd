(
(
name: \SchmidtGate,
type: \busnode,
bus: { |s,nc| Bus.control( s, nc ) },
settings: ( low: 0.0, hi: 1.0 ),
synthdef: { |rate,nc|
    var synthDef;
    synthDef = (\SchmidtGateNode++nc).asSymbol;
    SynthDef( synthDef, { arg out=0, in=1, mul=1, gate=1, low=0.1, hi=0.5;
        var input = In.kr( in, nc ) * mul;
        EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );
        Out.kr( out,
				Gate.kr( input, Schmidt.kr( input, low, hi ) )
        );
    }).add;
    synthDef;
}
);
);
