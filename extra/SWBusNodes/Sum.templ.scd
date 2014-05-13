(
(
name: \Sum,
type: \busnode,
bus: { |s,nc| Bus.control( s, 1 ); },
synthdef: { |rate,nc|
    var synthDef = (\SumbusesNode_++nc).asSymbol;
    SynthDef( synthDef, { arg out=0, in=1, lag=0.05, mul=1, gate=1;
        EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );
        Out.kr( out, Mix.new( Lag.kr( In.kr(in, nc ) * mul, lag ) ) );
    }).add;
    synthDef;
}
)
);