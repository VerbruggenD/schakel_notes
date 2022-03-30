# Hoorcollege 4
#### Uitbreiding vorige les examenrooster
Is veilig aanpassen en uitbreiden om ook meerdere dagen tussen de vakken te hebben.

## 8 Koninginnen probleem

````
public class Koningin {
    private int rij;
    private int kolom;  // is niet nodig --> de volgende zal altijd in de volgende kolom

}

import java.awt.Point;

public class QueensAlgoritme {
    private ArrayList<Point> positie;
    // of
    private Point[] koninginArray;  // dit is verkozen

}

DUS !!!

public class Queensalgoritme {
    private int[] rooster;  // een enkele globale variabele

    public static int[] plaats(int koningin, int rij) {
                                    // recursief liefst met parameters
            // probeer vooruit te gaan
        if (isVeilig(koningin, rij, rooster))
            rooster[koningin] = rij;
            return plaats(koningin+1, 0);
            // indien vast, ga terug
        return null;
    }

    private static boolean isVeilig(int koningin, int rij, int[] rooster) {

    }

    public static void main (String[] args) {
        int[] 
        int[] oplossing = plaats();
        System.out.println(oplossing);
    }
}

!!! kon niet volgen
dus niet volledig en gestopt

````

