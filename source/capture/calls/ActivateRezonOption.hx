package capture.calls;

import decide.ApplyCompensationInMarilyn;
import ticket.TicketMobileFiveOneOneAccept;
import ticket.TicketOneThreeOne;
import tstool.process.Action;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class ActivateRezonOption extends Action 
{
    var amount:Float;
	var compensate:Float;
	static inline var TOTAL_SCHOCK:String = "total shock";
	public static inline var COMPENSATE:String = "compensate 100% ";
    override public function create():Void 
	{
		amount = Std.parseFloat(Main.customer.contract.balance.overdue);
		compensate = amount;
		super.create();
	}
	override public function onClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onClick();
	}
	
	function getNext():Class<Process> 
	{
		var agentCanApply:Bool  = compensate > Intro.FRONT_COMP_LIMIT;
		return if (agentCanApply)
		{
			ApplyCompensationInMarilyn;
		}
		else{
			if (Main.HISTORY.isClassInteractionInHistory(capture.calls.AboutWhatZone,No))
			{
				TicketMobileFiveOneOneAccept;
			}
			else{
				TicketOneThreeOne;
			}
		}
	}
	 override public function pushToHistory(buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>=null):Void
	{
		super.pushToHistory(buttonTxt, interactionType, [TOTAL_SCHOCK=>amount, COMPENSATE=> compensate]);
	}
}