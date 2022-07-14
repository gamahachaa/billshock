package capture.calls;

import ticket.TicketOneThreeOne;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class SpeechIsrael extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: TicketOneThreeOne, params: []}];
		super.onClick();
	}
	
}