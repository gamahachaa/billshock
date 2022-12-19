package decide;

import capture.calls.AboutWhatZone;
import decide.calls.CompensateFullAmount;
import firetongue.Replace;
import ticket.TicketMobileFiveOneOneAccept;
import ticket.TicketOneThreeOne;
import tstool.process.Descision;
import haxe.Json;
import tstool.process.Process;


class ApplyCompensationInMarilyn extends Descision 
{
    var activateEurope:Bool;
	override public function onYesClick():Void
	{
		this._nexts = [{step: End, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onNoClick();
	}
	inline function getNext():Class<Process>
	{
		return if (Main.HISTORY.isClassInteractionInHistory(AboutWhatZone, Yes))
		{
			TicketOneThreeOne;
		}
		else{
			TicketMobileFiveOneOneAccept;
		}
	}
	override public function create():Void
	{
		activateEurope = Main.HISTORY.isClassInteractionInHistory(ActivateInternetEurope, Yes);
		var temp = Json.parse( _titleTxt );
		_titleTxt = if (activateEurope)
		{
			 temp.option + "\n" + temp.base;
		}
		else{
			 temp.base;
		}
		//this._titleTxt = Replace.flags(_titleTxt, ["<COMP>"], [Std.string(getComp())]);
		super.create();
		this.question.text = Replace.flags(_titleTxt, ["<COMP>"], [Std.string(getComp())]);
	}
	function getComp():Float
	{
		return 
		if (Main.HISTORY.isClassInteractionInHistory(ProposeSerenity, Yes))
		{
			Main.HISTORY.findValueOfFirstClassInHistory(ProposeSerenity, ProposeSerenity.COMPENSATE).value;
		}
		else if ( Main.HISTORY.isClassInteractionInHistory(SimplComp, Yes) )
		{
			Main.HISTORY.findValueOfFirstClassInHistory(SimplComp, SimplComp.COMPENSATE).value;
		}
		else if (Main.HISTORY.isClassInteractionInHistory(AlternativeCompensation, Yes) )
		{
			Main.HISTORY.findValueOfFirstClassInHistory(AlternativeCompensation, AlternativeCompensation.COMPENSATE).value;
		}
		else if (Main.HISTORY.isClassInteractionInHistory(NewSimplComp, Yes) )
		{
			Main.HISTORY.findValueOfFirstClassInHistory(NewSimplComp, NewSimplComp.COMPENSATE).value;
		}
		else if ( activateEurope )
		{
			Main.HISTORY.findValueOfFirstClassInHistory(ActivateInternetEurope, ActivateInternetEurope.COMPENSATE).value;
		}
		else if (Main.HISTORY.isClassInHistory(CompensateFullAmount))
		{
			// rezoning calls
			Main.HISTORY.findValueOfFirstClassInHistory(CompensateFullAmount, CompensateFullAmount.COMPENSATE).value;
		}
		else 0;
	}
	
}