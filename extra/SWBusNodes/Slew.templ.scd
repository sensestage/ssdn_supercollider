(
(
name: \Slew,
type: \busnode,
bus: { |s,nc| Bus.control( s, nc ) },
settings: ( up: 1, down: 1 ),
synthdef: { |rate,nc|
    var synthDef;
    synthDef = (\SlewNode++nc).asSymbol;
    SynthDef( synthDef, { arg out=0, in=1, mul=1, gate=1, up=1, down=1;
        var input;
        EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );
        input = In.kr( in,nc ) * mul;
        Out.kr( out,
            Slew.kr( input, upSlope=1, downSlope=1 )
        );
    }).add;
    synthDef;
}
);
);
