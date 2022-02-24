package capture;


import decide.ActivateInternetEurope;
import decide.AlternativeCompensation;
import tstool.layout.History.Interactions;
import tstool.layout.History.Snapshot;
import tstool.process.ActionRadios;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class _ElligibleForRet extends ActionRadios 
{
	static inline var SUB_TYPE:String = "Subscription Type";
	static inline var RET_ELLIGIBLE:String = "Retention Elligibility";
	//static inline var RET_ELLIGIBLE:String = "1234567891011121314151617181920";
	static inline var SIMMO:String = "Sim Only";
	static inline var DEVICE:String = "Device";
	static inline var STANDARD:String = "Standard";
	static inline var ERET:String = "eRet";
	static inline var NO_RET:String = "Not Elligible";
	
	public function new() 
	{
		
		super(
		[
			{
				title: SUB_TYPE,
				values: [SIMMO, DEVICE],
				hasTranslation:true
			},
			{
				title: RET_ELLIGIBLE,
				values: [STANDARD,ERET,NO_RET],
				hasTranslation:true
			}
		]
		);
	}
	/*
	override public function create()
	{
		this._nextProcesses = [];
		super.create();
	}
	*/
	override public function onClick():Void
	{
		//var how:Array<Snapshot> = Main.HISTORY.findStepsInHistory("capture.HowMadeHugeAmount");
		if (validate())
		{
			var how:Snapshot = Main.HISTORY.findFirstStepsClassInHistory(_HowMadeHugeAmount);
			var zone = how.values.get(_HowMadeHugeAmount.HOW);
			#if debug
			trace("capture._ElligibleForRet::onClick::zone", zone );
			#end
			/*var next:Class<Process> = if (status.get(RET_ELLIGIBLE) == NO_RET)
			{
				if (zone == _HowMadeHugeAmount.CH)
				{
					AlternativeCompensation;
				}
				else{
					ActivateInternetEurope;
				}
			}
			else{
				if (status.get(SUB_TYPE) == DEVICE)
				{
					ActivateInternetEurope;
				}
				else{
					_SelectPP;
				}
			}*/
			
			var next:Class<Process> = if (status.get(RET_ELLIGIBLE) == NO_RET && status.get(SUB_TYPE) == DEVICE) 
			{
				if (zone == _HowMadeHugeAmount.CH)
				{
					AlternativeCompensation;
				}
				else{
					ActivateInternetEurope;
				}
			}
			else _SelectPP;
			
			this._nexts = [{step: next}];
			//this._nextProcesses = [next];
			super.onClick();
		}
	}
	/*override public function pushToHistory(buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>=null):Void
	{
		super.pushToHistory(buttonTxt, interactionType, status);
	}*/
}