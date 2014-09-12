(
(
name: \Stddev,
type: \busnode,
bus: { |s,nc| Bus.control( s, nc ) },
settings: ( length: 50 ),
restartsettings: [ \length ],
synthdef: { |rate,nc|
    var synthDef;
    synthDef = (\StddevNode++nc).asSymbol;
    SynthDef( synthDef, { arg out=0, in=1, mul=1, gate=1, length=50;
        var mean, stddev, input;
        EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );
        input = In.kr(in, nc ) * mul;
        // mean = RunningSum.kr( input, length )/length;
        stddev = StdDevUGen.kr( input, length, mean);
        Out.kr( out, stddev );
    }).add;
    synthDef;
},
storeSynthdef: { |rate,nc|
    var synthDef;
    synthDef = (\StddevNode++nc).asSymbol;
    SynthDef( synthDef, { arg out=0, in=1, mul=1, gate=1, length=50;
        var mean, stddev, input;
        EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );
        input = In.kr(in, nc ) * mul;
        // mean = RunningSum.kr( input, length )/length;
        stddev = StdDevUGen.kr( input, length, mean);
        Out.kr( out, stddev );
    }).store;
},
);
);