package decide;

import capture.HighUsageData;
import capture.TravelInfoRecieved;
import capture._HowMadeHugeAmount;
//import ticket.TicketMobileFiveOneOneAccept;
import ticket.TicketMobileFiveOneOneRefuse;
import tstool.process.Action;
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
	/*function getNext():Class<Process>
	{
		var where:String = "";
		where = Main.HISTORY.findValueOfFirstClassInHistory(_HowMadeHugeAmount, _HowMadeHugeAmount.HOW).value;
		if (
			(
				where != _HowMadeHugeAmount.CDEF
			)
			&&
			(
				Main.HISTORY.isClassInteractionInHistory(SimplComp, No) // CDEF SAT SURF REFUSES SIMPLE COMP
				||
				Main.HISTORY.isClassInteractionInHistory(HighUsageData, No) // NOT DATA
				|| // AB BUT NOT REFUSES
				Main.HISTORY.isClassInteractionInHistory(AlternativeCompensation, No)
			)
		)
		{
			return TicketMobileFiveOneOneRefuse;
		}
		else{
			var comp = GET_COMP();
			return if (comp>0 && comp < 40.01) ApplyCompensationInMarilyn else TicketMobileFiveOneOneAccept;
		}
	}

	static public function GET_COMP():Float
	{
		return if ( Main.HISTORY.isClassInteractionInHistory(SimplComp, Yes) )
		{
			Main.HISTORY.findValueOfFirstClassInHistory(SimplComp, SimplComp.COMPENSATE).value;
		}
		else if (Main.HISTORY.isClassInteractionInHistory(AlternativeCompensation, Yes) )
		{
			Main.HISTORY.findValueOfFirstClassInHistory(AlternativeCompensation, AlternativeCompensation.COMPENSATE).value;
		}
		else 0;
	}*/

}