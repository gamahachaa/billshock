package decide;
import ticket.TicketMobileFiveOneOneAccept;
import ticket.TicketMobileFiveOneOneRefuse;
import tstool.process.Process;
import tstool.process.TripletTemplate;
import tstool.salt.SOTemplate;

/**
 * ...
 * @author bb
 */
class ExplainBSProtections extends TripletTemplate
{
	var compensate:Float;
	var accepted:Bool;

	public function new ()
	{
		super(SOTemplate.MOBILE_BILLSHOCK_EXPLAIN);
		compensate = 0;
	}
	 override public function create()
	{
		super.create();
		var compensateValue = Main.HISTORY.findValueOfFirstClassInHistory(NewSimplComp, NewSimplComp.COMPENSATE);
		accepted = Main.HISTORY.isClassInteractionInHistory(NewSimplComp, Yes);
		if (compensateValue.exists)
		{
			compensate = compensateValue.value;
		}
	}
	override inline function getNext():Class<Process>{
		return accepted ? compensate > Intro.FRONT_COMP_LIMIT ? TicketMobileFiveOneOneAccept: ApplyCompensationInMarilyn : TicketMobileFiveOneOneRefuse; 
	}
	override public function onYesClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onMidClick();
	}
}