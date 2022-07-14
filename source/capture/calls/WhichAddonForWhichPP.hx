package capture.calls;

import tstool.process.ActionMultipleInput;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class WhichAddonForWhichPP extends ActionMultipleInput 
{
	static inline var MARILYN_PASTED_PP:String = "MarilynPastedPP";

	public function new ()
	{
		super(
		[{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:250,
				prefix:MARILYN_PASTED_PP,
				position: [bottom, left]
			}
		}]
		);
	}
	
	/****************************
	* Needed for validation
	*****************************/
	override public function onClick():Void
	{
		if (validateYes()){
			this._nexts = [{step: getNext(), params: []}];
			super.onYesClick();
		}	
	}
	
	inline function getNext():Class<Process>{
		return ActivateRezonOption;
	}
	/*
	override public function validateYes():Bool
	{
		return true;
	}
	*/
	/*
	override public function validateNo():Bool
	{
		return true;
	}
	*/
	
}