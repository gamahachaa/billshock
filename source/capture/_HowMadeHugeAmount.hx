package capture;

import decide.SimplComp;
import tstool.process.ActionRadios;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class _HowMadeHugeAmount extends ActionRadios 
{
	public static inline var HOW:String = "How";
	public static inline var CH:String = "ch";
	public static inline var AB:String = "ab";
	public static inline var CDEF:String = "cdef";
	public static inline var SAT:String = "sat";
	public static inline var SURF:String = "surfv2";
	

	public function new() 
	{
		super(
		[
			{
				title: HOW,
				values:[CH, AB, CDEF, SAT, SURF],
				hasTranslation: true
			}
		]
		);
		
	}
	
	override public function onClick()
	{
		if (validate())
		{
			var next:Class<Process> = switch(status.get(HOW))
			{
				case CH: _ElligibleForRet;
				case AB: _ElligibleForRet;
				case CDEF: SimplComp;
				case SAT: SimplComp;
				case SURF: SimplComp;
				default: SimplComp;
			}
			this._nexts = [{step: next}];
			super.onClick();
		}		
	}
	
}