package;

import tstool.process.Process;
import tstool.process.TripletTemplate;
import tstool.salt.SOTemplate;

/**
 * ...
 * @author bb
 */
class TestTemplateSend extends TripletTemplate 
{

	public function new ()
	{
		super(SOTemplate.FIX_552);
	}
	
	override inline function getNext():Class<Process>{
		return Intro;
	}
	
}