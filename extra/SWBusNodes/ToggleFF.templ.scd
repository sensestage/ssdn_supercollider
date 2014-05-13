(
(
name: \Toggle,
type: \busnode,
bus: { |s,nc| Bus.control( s, nc ) },
synthdef: { |rate,nc|
    var synthDef;
    synthDef = (\ToggleFFNode++nc).asSymbol;
    SynthDef( synthDef, { arg out=0, in=1, mul=1, gate=1;
        var input;
        EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );
        input = In.kr( in,nc ) * mul;
        Out.kr( out,
            ToggleFF.kr( input )
        );
    }).add;
    synthDef;
}
);
);