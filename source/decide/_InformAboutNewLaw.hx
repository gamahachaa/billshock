package decide;

import capture.HighUsageData;
import capture.TravelInfoRecieved;
import capture._HowMadeHugeAmount;
//import ticket.TicketMobileFiveOneOneAccept;
import ticket.TicketMobileFiveOneOneRefuse;
//import tstool.process.Action;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class _InformAboutNewLaw extends Descision
{

	override public function onYesClick():Void
	{
		this._nexts = [{step:End, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step:TicketMobileFiveOneOneRefuse, params: []}];
		super.onNoClick();
	}


}