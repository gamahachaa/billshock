package capture.calls;

import ticket.TicketOneThreeOne;
import tstool.process.Action;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class SpeechNoWorryAdjustment extends Descision 
{

	override public function onNoClick():Void
	{
		this._nexts = [{step: End, params: []}];
		super.onNoClick();
	}
	override public function onYesClick():Void
	{
		this._nexts = [{step: TicketOneThreeOne, params: []}];
		super.onYesClick();
	}
	
}