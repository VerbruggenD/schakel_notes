# Dependency beheer

### voorbeeld
````
public class CoolDing {
    public static void main(String[] args) {
        System.out.println("hallokes");
    }
}
````
Uit dit voorbeeld ziet men dat er meerdere files zijn aangemaakt.
In Java de dependencies kunnen beheerd worden met graddle, dit zorgt ervoor dat de dependencies via servers worden ingeladen ipv handmatig afhalen.

### Introductie GSON
#### een tool om dependencies te serialiseren to JSON
Alle libraries zijn beschikbaar in Maven Repository, de verzameling voor GSON dependencies.

````
public class CoolDing {
    public static void main(String[] args) {
        System.out.println("hallokes");

        Gson gson = new Gson();
        CoolDing cool = new CoolDing();

        String output = gson.toJson(cool);

        System.out.println(output);
        System.out.println("werkt niet?);
    }
}
````

De Gson in dezelfde map hebben staan is niet genoeg. De equivalent van include moet gebeuren.
In java is dit een import.

```
javac ... en nog wat
java -cp gson-2.9.0.jar:. Coolding
```

de gson-2.9.0:. is het gebruiken van classes in gson en . is de huidige map.

### Nu naar project in IntelliJ
- Een leeg prject openen.
- Vertrekken vanuit graddle -> java
- Graddle gaat al automatisch het lege project Builden
- Zo weten we al dat de dependencies juist zijn (voor dat leeg project)
- In build.graddle kunnen repo toegevoegd worden
    - kan online zijn of lokaal
- Code copieren in IntelliJ
- De dependency kopieren van GSON naar build.graddle
- Builden
- Controlleren met de external library tab te selecteren

