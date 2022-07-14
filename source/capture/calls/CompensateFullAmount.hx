package capture.calls;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class CompensateFullAmount extends Descision 
{
	var amount:Float;
	var compensate:Float;
    override public function create():Void 
	{
		amount = Std.parseFloat(Main.customer.contract.balance.overdue);
		compensate = amount;
		super.create();
	}
	override public function onYesClick():Void
	{
		this._nexts = [{step: compensate > Intro.FRONT_COMP_LIMIT ? TicketMobileFiveOneOneAccept: ApplyCompensationInMarilyn}];
		super.onYesClick();
		
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: CHANGEME, params: []}];
		super.onNoClick();
	}
	override public function pushToHistory(buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>=null):Void
	{
		super.pushToHistory(buttonTxt, interactionType, [TOTAL_SCHOCK=>amount, COMPENSATE=> compensate]);
	}
}