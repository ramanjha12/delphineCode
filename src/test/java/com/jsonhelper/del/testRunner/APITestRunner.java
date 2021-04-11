package com.jsonhelper.del.testRunner;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(plugin = {"pretty", "html:target/cucumber.html"},features = "src/test/resources/features/",glue = {"com/jasonhelper/del/stepdefs"}, tags = "@testApi")



public class APITestRunner {
}
