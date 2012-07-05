/**
 * Author: Vlaaad
 * Date: 02.07.12
 */
package vlaaad.specs {
public class Statement {
	internal var _statement:String;
	private var _so:So;
	private const _or:Vector.<And> = new <And>[];

	public function Statement(statement:String) {
		_statement = statement;
		_so = new So(this);
		orSo(_so);
	}

	public function get so():So {
		return _so;
	}

	internal function andSo(so:So):void {
		_or[_or.length - 1].add(so);
	}

	internal function orSo(so:So):void {
		_or.push(new And(so));
	}

	internal function get result():Boolean {
		for each(var and:And in _or) {
			if (and.result) return true;
		}
		return false;
	}


	specs_internal function get comment():String {
		return _or.join(" OR ");
	}
}
}
