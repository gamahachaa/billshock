package ticket;

import capture.calls.AlreadyHasOptionButChargeAboveSixHundreds;
import tstool.process.ActionTicket;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class TicketOneThreeOneB extends ActionTicket 
{

	public function new() 
	{
		super(SOTickets.MOBILE_131b);
	}
	override public function onClick():Void
	{
		this._nexts = [{step: AlreadyHasOptionButChargeAboveSixHundreds}];
		super.onClick();
	}
	
}