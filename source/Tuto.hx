package;

import tstool.MainApp;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class Tuto extends Action 
{
	override public function create():Void
	{
		
		super.create();
		this.question.text = "Hello " + MainApp.agent.firstName + ",\n\n" + this._titleTxt;
	}
	override public function onClick():Void
	{
		this._nexts = [{step: Intro, params: []}];
		super.onClick();
	}
	
}