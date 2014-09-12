(
(
name: \RunningMax,
type: \busnode,
bus: { |s,nc| Bus.control( s, nc ) },
settings: ( rate: 1 ),
restartsettings: [],
synthdef: { |rate,nc|
    var synthDef;
    synthDef = (\RunningMax++nc).asSymbol;
    SynthDef( synthDef, { arg out=0, in=1, mul=1, gate=1, rate=1;
        var mean, max, input;
        EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );
        input = In.kr(in, nc ) * mul;
        // mean = RunningSum.kr( input, length )/length;
		max = RunningMax.kr( input, Impulse.kr( rate ));
        Out.kr( out, max );
    }).add;
    synthDef;
},
storeSynthdef: { |rate,nc|
    var synthDef;
    synthDef = (\RunningMax++nc).asSymbol;
    SynthDef( synthDef, { arg out=0, in=1, mul=1, gate=1, rate=1;
        var mean, max, input;
        EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );
        input = In.kr(in, nc ) * mul;
        // mean = RunningSum.kr( input, length )/length;
		max = RunningMax.kr( input, Impulse.kr( rate ));
        Out.kr( out, max );
    }).store;
},
);
);