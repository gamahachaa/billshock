package capture.calls;

import ticket.TicketOneThreeOneB;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsLineCreditBlocked extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: TicketOneThreeOneB, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: AlreadyHasOptionButChargeAboveSixHundreds, params: []}];
		super.onNoClick();
	}
	
}