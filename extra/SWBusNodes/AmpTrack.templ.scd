(
(
name: \AmpTrack,
type: \busnode,
bus: { |s,nc| Bus.control( s, nc ) },
settings: ( \atime: 0.01, \rtime: 0.01 ),
synthdef: { |rate,nc|
    var synthDef;
    if ( rate == \audio ){
        synthDef = (\AmptrackNode_ar_++nc).asSymbol;
        SynthDef( synthDef, { arg out=0, in=1, mul=1, gate=1, atime=0.01, rtime = 0.01;
            EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );
            Out.kr( out, Amplitude.kr(In.ar(in, nc ) * mul, atime, rtime) );
        }).add;
    }{ // control rate:
        synthDef = (\AmptrackNode_kr_++nc).asSymbol;
        SynthDef( synthDef, { arg out=0, in=1, mul=1, gate=1, atime=0.01, rtime = 0.01;
            EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );
            Out.kr( out, Amplitude.kr(In.kr(in, nc ) * mul, atime, rtime) );
        }).add;
    };
    synthDef;
}
);
)