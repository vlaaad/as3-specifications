# Simple specification suite. 
Currently without some possibly needed stuff, like waiting for receiving events etc, but very intuitive and easy to use.
# Main features:
- comparing values (lol)
- dealing with throwing errors of functions and function's returned values
- multiple comparisons in single specification (achieved by simple logical operations)
- apprehensible desriptions of failed specifications.

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

# Other stuff

You can customize your suite by overriding it's init method:

    override protected function init():void {
        /**
        * Your custom logger, must implement ISpecLogger. 
        * Default logger is instance of TraceSpecLogger class
        */
        setSpecLogger(new MyCustomSpecLogger()); 
        /**
        * By default only failed statements params are printed.
        * You can print them all.
        */
        printAll = true;
    }
    
When you print all result comments (not only failed), output will look like:

    [trace]    [info] Example:
    [trace] [success] - Spec catches errors
    [trace] [success]   [function should throw (success)]
    [trace] [success] - Spec catches errors with specific messages
    [trace] [success]   [function should throw error with message "a" (success)]
    [trace] [success] - Spec detects not throwing
    [trace] [success]   [function should not throw (success)]
    [trace] [success] - Spec catches errors with specific messages
    [trace] [success]   [function should not throw error with message "a", message was "b" (success)]
    [trace] [success] - Spec compares values
    [trace] [success]   [1 is equal 1 (success)]
    [trace] [success] - Spec with values, returned by functions
    [trace] [success]   [function should not throw (success)] AND [1 is equal 1 (success)]
    [trace] [success] - More comparisons
    [trace] [success]   [1 should be less or equal 1 (success)]
    [trace] [success] - More comparisons
    [trace] [success]   [1 should be less or equal 2 (success)]
    [trace] [success] - More comparisons
    [trace] [success]   [1 should be less than 2 (success)]
    [trace] [success] - More comparisons
    [trace] [success]   [1 should be more than 0 (success)]
    [trace] [success] - More comparisons
    [trace] [success]   [1 should be more or equal 0 (success)]
    [trace] [success] - More comparisons
    [trace] [success]   [1 should be more or equal 1 (success)]
    [trace] [success] - More comparisons
    [trace] [success]   [1 is equal 1 (success)]
    [trace] [success] - More comparisons
    [trace] [success]   [1 is not equal 2 (success)]
    [trace] [success] - More comparisons
    [trace] [success]   [1 is not equal null (success)]
    [trace] [success] - More comparisons
    [trace] [success]   [null is equal null (success)]
    [trace] [success] - Simple And
    [trace] [success]   [false is equal false (success)] AND [true is equal true (success)]
    [trace] [success] - Simple Or
    [trace] [success]   [false is equal true (fail)] OR [true is equal true (success)]
    [trace] [success] - Complex logic
    [trace] [success]   [true is equal false (fail)] OR [1 should be more or equal -4 (success)] AND [function should throw (success)]
    [trace]    [info]
    [trace] [success] Total claims: 19. Successful: 19, failed: 0
    
When some specs are failed, output will be like this:

    [trace]    [info] Example:
    [trace] [success] - one claim
    [trace]    [fail] - other claim fails because of:
    [trace]    [fail]   [function should throw error with message "expected message", message was: "not expected message" (fail)]
    [trace]    [info]
    [trace]    [fail] Total claims: 2. Successful: 1, failed: 1

# License
WTFPL
# Like it? Fork it and help it to grow!