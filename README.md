Simple specification suite. Currently without some possibly needed stuff, like waiting for receiving events etc, but very intuitive and easy to use.
Example suite class:
    public class ExampleSuite extends Suite {
        public function ExampleSuite() {
        }
        override protected function addSpecs():void {
            add(new ExampleSpec("Example"));
        }
    }
Example spec:
    public class ExampleSpec extends Spec {
    
        public function ExampleSpec(describedEntity:String) {
            super(describedEntity);
        }

        override protected function describe():void {
            claim("Spec catches errors").so.calling(raise).shouldThrowError();
            claim("Spec catches errors with specific messages").so.callingWithParams(raise, "a").shouldThrowError("a");
            claim("Spec detects not throwing").so.calling(echo).shouldNotThrowError();
            claim("Spec catches errors with specific messages").so.callingWithParams(raise, "b").shouldNotThrowError("a");
            claim("Spec compares values").so.value(1).shouldBeEqual(1);
            claim("Spec with values, returned by functions").so.callingWithParams(echo, 1).returnedValue.shouldBeEqual(1);
            claim("More comparisons").so.value(1).shouldBeLessOrEqual(1);
            claim("More comparisons").so.value(1).shouldBeLessOrEqual(2);
            claim("More comparisons").so.value(1).shouldBeLessThan(2);
            claim("More comparisons").so.value(1).shouldBeMoreThan(0);
            claim("More comparisons").so.value(1).shouldBeMoreOrEqual(0);
            claim("More comparisons").so.value(1).shouldBeMoreOrEqual(1);
            claim("More comparisons").so.value(1).shouldBeEqual(1);
            claim("More comparisons").so.value(1).shouldNotBeEqual(2);
            claim("More comparisons").so.value(1).shouldNotBeNull;
            claim("More comparisons").so.value(null).shouldBeNull;
            claim("Simple And").so.value(false).shouldBeEqual(false).and.value(true).shouldBeEqual(true);
            claim("Simple Or").so.value(false).shouldBeEqual(true).or.value(true).shouldBeEqual(true);
            claim("Complex logic").so.value(true).shouldBeEqual(false).or.value(1).shouldBeMoreOrEqual(-4).and.calling(raise).shouldThrowError();
        }
    
        private static function echo(value:* = null):* {
            return value;
        }

        private static function raise(message:String = ""):void {
            throw new Error(message);
        }
    }
After instantiating suite and adding specs, result will be printed:
    [trace]    [info] Example:
    [trace] [success] - Spec catches errors
    [trace] [success] - Spec catches errors with specific messages
    [trace] [success] - Spec detects not throwing
    [trace] [success] - Spec catches errors with specific messages
    [trace] [success] - Spec compares values
    [trace] [success] - Spec with values, returned by functions
    [trace] [success] - More comparisons
    [trace] [success] - More comparisons
    [trace] [success] - More comparisons
    [trace] [success] - More comparisons
    [trace] [success] - More comparisons
    [trace] [success] - More comparisons
    [trace] [success] - More comparisons
    [trace] [success] - More comparisons
    [trace] [success] - More comparisons
    [trace] [success] - More comparisons
    [trace] [success] - Simple And
    [trace] [success] - Simple Or
    [trace] [success] - Complex logic
    [trace]    [info]
    [trace] [success] Total claims: 19. Successful: 19, failed: 0