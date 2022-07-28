package ticket;

import capture.IsCompTicketOpened;
import tstool.process.ActionTicket;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class TicketOneThreeOne extends ActionTicket 
{

	public function new() 
	{
		
		if(Main.HISTORY.isClassInteractionInHistory(IsCompTicketOpened, Mid))
			super(SOTickets.MOBILE_142_B2B);
		else
			super(SOTickets.MOBILE_131_B2C);
	}
	override public function onClick():Void
	{
		this._nexts = [{step: End}];
		super.onClick();
	}
	
}