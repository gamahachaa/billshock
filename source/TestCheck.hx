package;

import ticket.TicketMobileFiveOneOne;
import tstool.process.ActionCheck;

/**
 * ...
 * @author bb
 */
class TestCheck extends ActionCheck 
{

	public function new() 
	{
		super(["test1", "test2", "test non traduit"], 800);
		
	}
	override public function onClick():Void 
	{
		this._nexts = [{step:TicketMobileFiveOneOne}];
		super.onClick();
	}
	override function onChecked(id:String, checked:Bool) 
	{
		super.onChecked(id, checked);
		allChecked();
		trace("Fomr child ", id, checked, this.status);
	}
	
}