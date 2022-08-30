package ticket;

import tstool.process.ActionTicket;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class TicketMobileFiveOneOneSerenity extends ActionTicket 
{

	public function new() 
	{
		super(SOTickets.MOBILE_511_SERENITY);
	}
	override public function onClick():Void
	{
		this._nexts = [{step: End}];
		super.onClick();
	}
	
}