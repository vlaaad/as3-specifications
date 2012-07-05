/**
 * Author: Vlaaad
 * Date: 02.07.12
 */
package vlaaad.specs.should {
import vlaaad.specs.*;

public class ValueShould extends Should {
	use namespace specs_internal;

	internal var _inputValue:*;
	internal var _compareValue:*;

	public function ValueShould(v:*, statement:Statement) {
		super(statement);
		_inputValue = v;
	}

	public function shouldBeEqual(v:*):StatementContinue {
		_compareValue = v;
		assertEquals();
		return _statementContinue;
	}

	public function shouldNotBeEqual(v:*):StatementContinue {
		_compareValue = v;
		_not = true;
		assertEquals();
		return _statementContinue;
	}

	public function get shouldNotBeNull():StatementContinue {
		_compareValue = null;
		_not = true;
		assertEquals();
		return _statementContinue;
	}

	public function get shouldBeNull():StatementContinue {
		_compareValue = null;
		assertEquals();
		return _statementContinue;
	}

	private function assertEquals():void {
		var success:Boolean = _compareValue == _inputValue;
		if (_not) success = !success;
		_result = success;
		generateComment("equal");
	}

	private function generateComment(assertion:String):void {
		_comment = String(_inputValue);
		const notStr:String = _not ? " is not " : " is ";
		_comment += notStr + assertion + " " + String(_compareValue);
	}

	public function shouldBeMoreThan(v:*):StatementContinue {
		assertMore(v);
		return _statementContinue
	}

	private function assertMore(v:*):void {
		try {
			if (_inputValue > v)
				setResult(true, _inputValue + " should be more than " + v);
			else
				setResult(false, _inputValue + " should be more than " + v);
		} catch (e:Error) {
			setResult(false, _inputValue + " should be more than " + v + ", but error was thrown: " + e.message);
		}
	}

	public function shouldBeLessThan(v:*):StatementContinue {
		assertLess(v);
		return _statementContinue;
	}

	private function assertLess(v:*):void {
		try {
			if (_inputValue < v)
				setResult(true, _inputValue + " should be less than " + v);
			else
				setResult(false, _inputValue + " should be less than " + v);
		} catch (e:Error) {
			setResult(false, _inputValue + " should be less than " + v + ", but error was thrown: " + e.message);
		}
	}

	public function shouldBeMoreOrEqual(v:*):StatementContinue {
		assertMoreOrEqual(v);
		return _statementContinue;
	}

	private function assertMoreOrEqual(v:*):void {
		try {
			if (_inputValue >= v)
				setResult(true, _inputValue + " should be more or equal " + v);
			else
				setResult(false, _inputValue + " should be more or equal " + v);
		} catch (e:Error) {
			setResult(false, _inputValue + " should be more or equal " + v + ", but error was thrown: " + e.message);
		}
	}

	public function shouldBeLessOrEqual(v:*):StatementContinue {
		assertLessOrEqual(v);
		return _statementContinue;
	}

	private function assertLessOrEqual(v:*):void {
		try {
			if (_inputValue <= v)
				setResult(true, _inputValue + " should be less or equal " + v);
			else
				setResult(false, _inputValue + " should be less or equal " + v);
		} catch (e:Error) {
			setResult(false, _inputValue + " should be less or equal " + v + ", but error was thrown: " + e.message);
		}
	}
}
}
