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
				labels:["Switzerland", "zones AB (EU & USA)", "zones C,D,E,FAR", "zone SAT", "using SURF v2"]
			}
		]
		);
		
	}
	
	/*
	override public function create()
	{
		this._nextProcesses = [new XXX()];
		super.create();
		
	}
	*/
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
	/*
	override public function validate():Bool
	{
		return true;
	}
	*/
	
}