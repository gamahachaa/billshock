package ticket;

import capture.InputCustomersDetails;
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
		
		if(Main.customer.dataSet.get(InputCustomersDetails.PORTFOLIO).get(InputCustomersDetails.SEGMENT) == InputCustomersDetails.SOHO)
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