package capture.calls;

import tstool.layout.History.Interactions;
import tstool.process.ActionMultipleInput;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class WhichAddonForWhichPP extends ActionMultipleInput 
{
	public inline static var ADD_ON:String = "Add-On";
	public static inline var MARILYN_PASTED_PP:String = "MarilynPastedPP";

	public function new ()
	{
		super(
		[{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:400,
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
		if (validate()){
			this._nexts = [{step: ActivateRezonOption, params: []}];
			super.onClick();
		}	
	}
	override public function pushToHistory(buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>=null):Void
	{
		var pp = multipleInputs.getText(MARILYN_PASTED_PP);
		//var addon = findAddon();
		super.pushToHistory(buttonTxt, interactionType, [MARILYN_PASTED_PP=>pp]);
	}
	
	/*inline function getNext():Class<Process>{
		//return ActivateRezonOption;
	}*/
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