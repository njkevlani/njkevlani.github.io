+++
title = "Final in Java"
date = 2021-12-15
lastmod = 2021-12-15
tags = ["java", "json", "serialisation"]
+++
In `java`, normally you'd think if a variable is defined as `final`, its value will not change.

For example, the content of `Main.java`:

```java
public class Main {
  public static void main(String... args) {
    Example example = new Example();
    example.printI();
  }
}

class Example {
  final private Integer i = 10;
  public void printI() {
    System.out.println(i);
  }
}
```

The above code should always print `10`, right? Well, that's not the case. At least in this case:

```java
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;

public class Main {
    public static void main(String... args) throws IOException {
        Example example1 = new Example();
        example1.printI();

        ObjectMapper mapper = new ObjectMapper();
        String jsonInString = "{\"i\": 11}";
        Example example2 = mapper.reader().withType(Example.class).readValue(jsonInString);
        example2.printI();
    }
}

class Example {
    public final Integer i = 10;

    public void printI() {
        System.out.println(i);
    }
}
```

This will print:
```
10
11
```

Reason for this?

> Deserialization is implemented by the JVM on a level below the basic language constructs.[^1]

So, language rules do not apply to JVM. The object was initialized with `i = 10` and it was updated while deserialization despite being `final`.

Code sample on GitHub: https://github.com/njkevlani/final-in-java-code.

[^1]: https://stackoverflow.com/a/2904589/6645446
