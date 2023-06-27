package examples.reqres;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate testDemo() {
        return Karate.run("userDetails").relativeTo(getClass());
    }
}
