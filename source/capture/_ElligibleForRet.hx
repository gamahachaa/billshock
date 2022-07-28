package capture;


import capture.calls.AboutWhatZone;
import decide.ActivateInternetEurope;
import decide.AlternativeCompensation;
import decide.calls.CompensateFullAmount;
import haxe.ds.Either;
//import haxe.extern.EitherType;
import ticket.TicketFourFourOne;
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
	/**/
	override public function create()
	{
		//this._nextProcesses = [];
		super.create();
	}
	/**/
	override public function onClick():Void
	{
		if (validate())
		{
			//var how:Snapshot;
			var clss: Class<Process>;
			//var zone:String;
			var calls:Bool = Main.HISTORY.isClassInteractionInHistory(HighUsageData, No);
			var how:Snapshot = if ( calls )
			{
				//zone = if (Main.HISTORY.isClassInteractionInHistory(AboutWhatZone, Yes)) AboutWhatZone.WORLD else if (Main.HISTORY.isClassInteractionInHistory(AboutWhatZone, No)) AboutWhatZone.EUROPE else AboutWhatZone.TRAVEL;
			//clss = AboutWhatZone;
			 Main.HISTORY.findFirstStepsClassInHistory(AboutWhatZone);
			}
			else{
				//clss = _HowMadeHugeAmount;
				 Main.HISTORY.findFirstStepsClassInHistory(_HowMadeHugeAmount);
				
			}
			//var how:Snapshot = Main.HISTORY.findFirstStepsClassInHistory(clss);
			//zone = how.values.get(clss.HOW);
			//var zone = how.values.get(_HowMadeHugeAmount.HOW);
			//var calls:Bool = Main.HISTORY.isClassInteractionInHistory(HighUsageData, No);
			
			var next:Class<Process> = if (status.get(RET_ELLIGIBLE) == NO_RET && status.get(SUB_TYPE) == DEVICE) 
			{
				// no ret
				if (!calls &&  how.values.get(_HowMadeHugeAmount.HOW) == _HowMadeHugeAmount.CH)
				{
					AlternativeCompensation;
				}
				else if (calls && how.values.get(AboutWhatZone.HOW) == AboutWhatZone.EUROPE)
				{
					TicketFourFourOne;
				}
				else{
					ActivateInternetEurope;
				}
			}
			else {
				//if ((zone == AboutWhatZone.EUROPE) && calls)
				    //CompensateFullAmount;
				//else
					_SelectPP;
			}
			
			this._nexts = [{step: next}];
			
			super.onClick();
		}
	}
	/*override public function pushToHistory(buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>=null):Void
	{
		super.pushToHistory(buttonTxt, interactionType, status);
	}*/
}