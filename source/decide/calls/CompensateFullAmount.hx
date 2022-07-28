package decide.calls;

import capture.calls.AboutWhatZone;
import firetongue.Replace;
import ticket.TicketMobileFiveOneOneAccept;
import ticket.TicketMobileFiveOneOnePPRenewalAccept;
import ticket.TicketOneThreeOne;
import tstool.layout.History.Interactions;
import tstool.process.Action;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class CompensateFullAmount extends Action 
{
	var amount:Float;
	var compensate:Float;
	static inline var TOTAL_SCHOCK:String = "total shock";
	public static inline var COMPENSATE:String = "compensate 100% ";
    override public function create():Void 
	{
		amount = Std.parseFloat(Main.customer.contract.balance.overdue);
		compensate = amount;
		this._titleTxt = Replace.flags(_titleTxt,  ["<AMOUNT>"], [Std.string(amount)]);
		super.create();
	}
	override public function onClick():Void
	{
		this._nexts = [{step: getNext()}];
		super.onClick();
		
	}
	inline function getNext():Class<Process>
	{
		return if (compensate > Intro.FRONT_COMP_LIMIT)
		{
			if (Main.HISTORY.findValueOfFirstClassInHistory(AboutWhatZone, AboutWhatZone.HOW).value != AboutWhatZone.EUROPE)
			{
				TicketOneThreeOne;
			}
			else{
				TicketMobileFiveOneOnePPRenewalAccept;
			}
		}
		else{
			ApplyCompensationInMarilyn;
		}
	}
	//override public function onNoClick():Void
	//{
		//this._nexts = [{step: CHANGEME, params: []}];
		//super.onNoClick();
	//}
	override public function pushToHistory(buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>=null):Void
	{
		super.pushToHistory(buttonTxt, interactionType, [TOTAL_SCHOCK=>amount, COMPENSATE=> compensate]);
	}
}