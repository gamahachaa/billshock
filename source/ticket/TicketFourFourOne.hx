package ticket;

import capture.InputCustomersDetails;
import tstool.process.ActionTicket;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class TicketFourFourOne extends ActionTicket 
{

	public function new() 
	{
		if(Main.customer.dataSet.get(InputCustomersDetails.PORTFOLIO).get(InputCustomersDetails.SEGMENT) == InputCustomersDetails.SOHO)
			super(SOTickets.MOBILE_511_B2B);
		else
			super(SOTickets.MOBILE_441_B2C);
	}
	override public function onClick():Void
	{
		this._nexts = [{step: End}];
		super.onClick();
	}
	
}
