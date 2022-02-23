# Hoorcollege 2

### schatting tijscomplexiteit
#### zeker kunnen op examen

#### doel tijdscompexiteit
- een idee geven over waar ze nu aan het werken zijn
- reduceren van de complexitiet door de aanduiding van de funtie

### abstract data type
- vvorbeeld queue
    - enkel achteraan aanschuiven
    - enkel voorraan weggaan

### java collection framework
- list: lijst, hierin mogen dubbele entries hebben, volgorde ni belangrijk
- set: zoals een lijst, zonder dubbels
    - sortedSet: geordend
- queue:
- Deque: queue accesible vanuit 2 kanten

- map: key associeren met een value
- iterator: manier om door een verzameling te gaan, zonder structuur te kennen

#### Hierachie
- linked list: achtereenvolgende elementen zijn gelinkt

### Array
- geheugenblok
- vaste lengte
- vb: int[17] = 32 bit x 17
- afstand tussen adressen, is de bitgrootte van datatype

### arraylist
- onderliggend array
- efficientie zelfde als gewone
- enkel geen vaste grootte, onderliggend gaat de grootte aangepast worden
- heel flexibel, makkelijk

### linked list
- een lijst gevormd door de pointer naar het volgende element op te slaan
- hoeven niet vlak achter elkaar te liggen
- in java: dubbel gelinked
    - kan ook met de pointer naar de vorige gaan

- aantal elementen verdubbeld, grootte ook verdubbelen
- voordeel op array, wijzigingen zijn met een constante tijd
    - eenvoudig door de structuur
    - element toevoegen door de pointers te updaten naar een extra element

### hashtable (examenvraag)
- een lijst opstellen door opvragen in constante tijd
- hash functie
    - waarde berekend door eenvoudige functie -> snel
    - uitgang is bijna niet terug te rekenen
    - passwoorden
    - willekeurig patroon
- key die de hashfunctie gebruikt om de inhoud om te vormen naar een random waarden
- Tijdscompl:
    - beste geval is vrij goed
    - als de buckets gevuld zijn, duurt het heeeeel lang om door alles te gaan

### tree
- gebruikt voor gesorteerde lijst
- voorbeeld les:
    - alles links van 50 is kleiner als 50, rechts groter

- makkelijk om elementen toe te voegen
- maar een klein stuk aanpassen bij nieuw element
- gaat snel
- kans op slecht design, bijvoorbeeld alle elementen links van de eerste

## algoritmes
### recursie
- lijst van getallen om op te tellen
- som is dan een recursie

#### grootst gemene deler Euclides
- ggd(312, 2022) = ggd(312, 150) = ggd(150, 12) = ggd( 12,6) = ggd( 6, 0) = 6
- code: 

```
public static int ggd(int a, int b) {
    int kl = Math.min(a,b);
    int gr = Math.max(a,b);
    if(kl == 0) return gr;
    return ggd(kl, gr%kl);
}
```

### voorbeeld: torens van Hanoi
```

public static void hanoi(int aantal, int bron, int doel, int hulp)
{
    hanoi(aantalSchijven -1, bron, hulp, doel);
    System.out.println("schijf diameter" + aantalSchijven + "van mijn" bron "paal naar men" doel "paal");
    hanoi(aantalSchijven-1, hulp, doel, bron);
}

```

- typisch probleem bij recursie
- doet heel veel oproepen
    - dus krijgt een stackoverflow error
- aanpassing: ``if(aantalSchijven == 0) return; ``

