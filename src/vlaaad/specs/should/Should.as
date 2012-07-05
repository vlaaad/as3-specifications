/**
 * Author: Vlaaad
 * Date: 02.07.12
 */
package vlaaad.specs.should {
import vlaaad.specs.*;

public class Should {
	use namespace specs_internal;

	specs_internal var _result:Boolean;
	protected var _not:Boolean = false;
	protected var _statementContinue:StatementContinue;
	specs_internal var _comment:String;

	public function Should(statement:Statement) {
		_statementContinue = new StatementContinue(statement);
	}

	specs_internal function setResult(value:Boolean, comment:String):void {
		_result = value;
		_comment = comment;
	}

}
}
