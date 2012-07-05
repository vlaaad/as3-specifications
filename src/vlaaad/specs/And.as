/**
 * Author: Vlaaad
 * Date: 03.07.12
 */
package vlaaad.specs {
public class And {
	use namespace specs_internal;

	private const soContainer:Vector.<So> = new <So>[];

	public function And(so:So) {
		add(so);
	}

	public function add(so:So):void {
		soContainer.push(so);
	}

	public function get result():Boolean {
		for each(var so:So in soContainer) {
			if (!so.success) return false;
		}
		return true;
	}

	public function toString():String {
		return soContainer.join(" AND ");
	}
}
}
