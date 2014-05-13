(
(
name: \Lag,
type: \busnode,
bus: { |s,nc| Bus.control( s, nc ) },
settings: ( up: 0.1, down: 0.1 ),
synthdef: { |rate,nc|
    var synthDef;
    synthDef = (\LagNode++nc).asSymbol;
    SynthDef( synthDef, { arg out=0, in=1, mul=1, gate=1, up=0.1, down=0.1;
        var input;
        EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );
        input = In.kr( in,nc ) * mul;
        Out.kr( out,
            LagUD.kr( input, lagup, lagdown )
        );
    }).add;
    synthDef;
}
);
);
