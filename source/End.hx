package;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class End extends Action 
{
	
	override public function create()
	{
		super.create();
		Main.track.setResolution();
		Main.track.send();
	}
	
	override public function onClick():Void
	{
		this._nexts = [{step: Intro}];
		super.onClick();
	}
}