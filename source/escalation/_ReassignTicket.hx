package escalation;

import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _ReassignTicket extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: _InformUpmostPrio, params: []}];
		super.onClick();
	}
}