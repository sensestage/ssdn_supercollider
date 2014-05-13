(
(
name: \Friction,
type: \busnode,
bus: { |s,nc| Bus.control( s, nc ) },
settings: ( friction: 0.5, spring: 0.414, damp: 0.313, mass: 0.1, beltmass: 1 ),
synthdef: { |rate,nc|
    var synthDef = (\FrictionNode++nc).asSymbol;
    SynthDef( synthDef, { arg out=0, in=1, mul=1, gate=1, friction=0.5, spring=0.414, damp=0.313, mass =0.1, beltmass = 1;
        EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );
        Out.kr( out, Friction.kr( In.kr(in, nc ) * mul, friction, spring, damp, mass, beltmass) );
    }).add;
    synthDef
};
)
);
