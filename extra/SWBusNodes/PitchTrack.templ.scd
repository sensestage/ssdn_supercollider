(
(
name: \PitchTrack,
type: \busnode,
bus: {|s,nc| Bus.control( s, nc ) },
settings: ( lpfreq: 500, hpfreq: 100, initFreq: 300, minFreq: 100, maxFreq: 500, ampTreshold: 0.01, offset: 0.5 ),
synthdef: { |rate, nc|
    var synthDef;
    if ( rate == \audio ){
        synthDef = (\PitchtrackNode_ar_++nc).asSymbol;
        SynthDef( synthDef,{
            |out=0,in=1, mul=1, gate=1,
            lpfreq=500,hpfreq=100, initFreq=300,
            minFreq=100, maxFreq=500, ampThreshold=0.01|

            var input, freq, hasFreq;
            var spec,output;
            input = In.ar(in, nc ) * mul;
            3.do{
                input = LPF.ar( HPF.ar( input, hpfreq ), lpfreq );
            };
            # freq, hasFreq = Pitch.kr(
                input, initFreq, minFreq, maxFreq, median: 7, ampThreshold: ampThreshold ).flop;

            EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );

            output = Gate.kr( freq, hasFreq);
            Out.kr( out,output  );
        }).add;
    }{
        synthDef = (\PitchtrackNode_kr_++nc).asSymbol;

        SynthDef( synthDef,{
            |out=0,in=1,mul=1, gate=1,
            lpfreq=2000,hpfreq=400, initFreq=440,
            minFreq=60, maxFreq=4000, ampThreshold=0.01,offset=0.5|

            var input, freq, hasFreq;
            var spec,output;
            //			spec = [minFreq,maxFreq,\exponential].asSpec;
            input = In.kr(in, nc ) - DC.kr( offset );
            /*
            3.do{
            input = LPF.ar( HPF.ar( input, hpfreq ), lpfreq );
            };
            */
            # freq, hasFreq = Pitch.kr(
                input, initFreq, minFreq, maxFreq, median: 7, ampThreshold: ampThreshold ).flop;

            EnvGen.kr( Env.cutoff( 1 ), gate, doneAction: 2 );

            output = Gate.kr( freq, hasFreq);
            //			spec.unmap( output ).poll;
            Out.kr( out,output  );
        }).add;
    };
    synthDef;
};
)
)