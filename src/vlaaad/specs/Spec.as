/**
 * Author: Vlaaad
 * Date: 02.07.12
 */
package vlaaad.specs {
public class Spec {
	internal var _describedEntity:String;
	internal const _statements:Vector.<Statement> = new Vector.<Statement>();

	public function Spec(describedEntity:String) {
		_describedEntity = describedEntity;
		describe();
	}

	protected function describe():void {

	}

	protected final function claim(statement:String):Statement {
		const s:Statement = new Statement(statement);
		_statements.push(s);
		return s;
	}
}
}
