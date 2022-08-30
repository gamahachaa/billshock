package capture;

import ticket.TicketMobileFiveOneOneAccept;
import ticket.TicketMobileFiveOneOneSerenity;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HasSerenity extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: TicketMobileFiveOneOneSerenity, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _HowMadeHugeAmount, params: []}];
		super.onNoClick();
	}
	
}