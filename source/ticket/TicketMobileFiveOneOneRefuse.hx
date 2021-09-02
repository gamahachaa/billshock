package ticket;

//import tstool.process.ActionMail;
import tstool.process.ActionTicket;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class TicketMobileFiveOneOne extends ActionTicket
{

	public function new() 
	{
		super(SOTickets.MOBILE_511);
	}
	override public function onClick():Void
	{
		this._nexts = [{step: End}];
		super.onClick();
	}
	
}