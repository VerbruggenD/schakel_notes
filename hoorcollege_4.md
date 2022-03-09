# Hoorcollege 4
## Backtracking

### Herhaling algoritmes
- Brute force
- Divide en conquer
- Transform en conquer

## Idee van backtracking
- Doe een poging die (op dat moment) gepast is
- werk verder
- Dan komt men vast te zitten

- Kijken in vorige stap of daar een aanpassing kan gemaakt worden
- Als men hier vast zat een extra stap terug gaan

## Voorbeeld: 8 koningen probleem
- Probleem: zet 8 koninginen op het bord zodat ze veilig staan tov elkaar.
- Oplossing met de hand. Pionnen plaatsen een voor een, als men vast zit gaat men de vorige stap aanpassen, lukt dit nog steeds niet dan gaat men terug een stap terug.

## Voorbeeld: Examen rooster
- eisen
    - periode 8 tot 23 juni
    - weekends niet
    - 2 dagen tussen examen
    - elk vak heeft een aantal mogelijke dagen

- Bepaalde systematische volgorde
- wanneer is een nieuwe poging veilig?
- Wanneer zit je vast?
- Hoe ga je de data opslaan zodat men kan backtracken?

```
public class Vak {
    private String naam;
    private String Array;

    public Vak(String naam, ArrayList<Integer> mogelijkeDagen) {
        this.naam = naam;
        this.mogelijkeDagen = new ArrayList<>();
        for (int i =0; i<mogelijkeDagen.length; i++>)
        {
            this.mogelijkeDagen.add(mogelijkeDagen[i]);
        }

    }

    public string getNaam () {
        return naam;
    }

    public ArrayList<Integer> getMogeljkeDagen() {
        return mogelijkeDagen;
    }

    public boolean isMogelijk (int dag) {
        return mogelijkeDagen.contains(dag);
    }

    public class GeplaatsVak () {
        private Vak vak;
        private int datum;
    }

    public Vak getVak () {
        return vak;
    }

    public int getDatum () {
        return datum;
    }

    public void setDatum () {
        // iets
    }

    public class RoosterAlgoritme {
        public static void main(String[] args) {
            ArrayList<Vak> vakken = new ArrayList<>();
            
            int[] dagenVak1Array = {8,9,10};
            vakken.add(new Vak("v1", dagenVak1Array));

            RoosterAlgoritme rekenaar = new RoosterAlgoritme;
            System.out.println(rekenaar.rooster(vakken, 8, 23, 11, new ArrayList<GeplaatstVak>()));
        }
    }

    public Optional<ArrayList <GeplaatsteVak>> rooster(ArrayList<Vak> vakken, // Hierbij is vaknr overbodig door de arraylist
                                            int dagnr, int eindeExamenPeriode, int eersteZaterdag, 
                                            ArrayList<GeplaatstVak> lijstVanGeplaatsteVakken) 
        {
                if (vakken.size == 0) return Optional.of(lijstVanGeplaatsteVakken);

                Vak huidigVak = vakken.get(0);

                if (isVeilig(huidigVak, dagnr, eindeExamenPeriode, eersteZaterdag)) {
                    vakken.remove(0);
                    GeplaatstVak plaatsing = new GeplaatstVak(huidigVak, dagnr);
                    lijstVanGeplaatsteVakken.add(plaatsing);
                    return rooster(vakken, 8, eindeExamenPeriode, eersteZaterdag, lijstVanGeplaatsteVakken);
                }
                else if (dagnr == eindeExamenPeriode) {
                    if (lijstVanGeplaatsteVakken.size() == 0) {
                        // ik wil backtracken maar kan niet
                        return Optional.empty();
                    }
                    // trackBack
                    GeplaatstVak laatste = lijstVanGeplaatsteVakken.get(lijstVanGeplaatseVakken.size()-1);
                    lijstVanGeplaatsteVakken.remove(laatste);
                    int dagNrLaatste = laatste.dagnr.getDatum();
                    Vak laatsteVak = laatste.getVak();
                    vakken.add(0, laatsteVak);
                    return rooster(vakken, dagNrLaatste++, eindeExamenPeriode, eersteZaterdag, lijstVanGeplaatsteVakken);
                }
                else {
                    return rooster(vakken, dagnr++, eindeExamenPeriode, eersteZaterdag, lijstVanGeplaatsteVakken)
                }
            return null;
        }
    
    public boolean isVeilig(Vak vak, int dagnr, int eindeExamenPeriode, int eersteZaterdag) {
        if (dagnr > eindeExamenPeriode) return false;
            // zaterdag
        if ((eersteZaterdag - dagnr)%7 == 0) return false;
            //zondag, is zelfde als zaterdag
        if ((eersteZaterdag+1 - dagnr)%7 == 0) return false;
        
            // kan de docent ?
        return vak.isMogelijk(dagnr);
    }
}
```