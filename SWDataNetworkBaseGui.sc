// =====================================================================
// SenseWorld DataNetwork base GUI
// =====================================================================

SWDataNetworkBaseGui {

	var <>network;
	var w,button1,button2;
	var button3;

	*new{ |network|
		^super.new.network_( network ).init;
	}

	init{
		w = Window.new( "SenseWorld DataNetwork", Rect( 0, 0, 400, 120 ) );
		w.view.decorator = FlowLayout.new( Rect( 0, 0, 400, 100), 5@5, 5@5 );

		button1 = Button.new( w, Rect( 0, 0, 190, 80)).states_( [["View data nodes"]]).action_( {network.makeGui} ).font_( GUI.font.new( "Helvetica", 20));

		button2 = Button.new( w, Rect( 0, 0, 190, 80)).states_( [["View clients"]]).action_( { 
			if ( network.osc.isNil )
			{ 
				"no OSC interface present, adding OSC interface to network".warn;
				network.addOSCInterface;
			};
			network.osc.makeGui;
		} ).font_( GUI.font.new( "Helvetica", 20));

		button3 = Button.new( w, Rect( 0, 0, 190, 20)).states_( [["Record log"]]).action_( {network.makeLogGui} ).font_( GUI.font.new( "Helvetica", 16));

		StaticText.new( w, Rect( 0, 0, 190, 20)).string_( [ NetAddr.myIP, NetAddr.langPort ].asString ).font_( GUI.font.new( "Helvetica", 12));

		w.front;
	}
}