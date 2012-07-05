/**
 * Author: Vlaaad
 * Date: 03.07.12
 */
package vlaaad.specs.interfaces {
public interface ISpecLogger {
	/**
	 *
	 * @param type 1 - info, 2 - success, 3 - fail
	 * @param string
	 */
	function logSpecResult(type:int, string:String):void;
}
}
