/**
 * Author: Vlaaad
 * Date: 02.07.12
 */
package vlaaad.specs {
import vlaaad.specs.should.FunctionShould;
import vlaaad.specs.should.Should;
import vlaaad.specs.should.ValueShould;

public class So {
	use namespace specs_internal;

	private var _should:Should;
	private var _statement:Statement;

	public function So(statement:Statement) {
		_statement = statement;
	}

	public function value(v:*):ValueShould {
		const vs:ValueShould = new ValueShould(v, _statement);
		_should = vs;
		return vs;
	}

	public function calling(func:Function):FunctionShould {
		const fs:FunctionShould = new FunctionShould(func, null, _statement);
		_should = fs;
		return fs;
	}

	public function callingWithParams(func:Function, ...params):FunctionShould {
		const fs:FunctionShould = new FunctionShould(func, params, _statement);
		_should = fs;
		return fs;
	}

	specs_internal function get success():Boolean {
		return _should._result;
	}

	specs_internal function get comment():String {
		return _should._comment;
	}

	public function toString():String {
		return "[" + comment + (_should._result ? " (success)]" : " (fail)]");
	}
}
}
