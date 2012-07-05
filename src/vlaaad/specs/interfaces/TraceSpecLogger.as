/**
 * Author: Vlaaad
 * Date: 03.07.12
 */
package vlaaad.specs.interfaces {
public class TraceSpecLogger implements ISpecLogger {
	public function TraceSpecLogger() {
	}

	public function logSpecResult(type:int, string:String):void {
		switch (type) {
			case 1:
				trace("   [info]", string);
				break;
			case 2:
				trace("[success]", string);
				break;
			case 3:
				trace("   [fail]", string);
		}
	}
}
}
