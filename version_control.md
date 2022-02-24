# version control

### waarom?
- meerdere lokale versies vermijden
  - vb: versie1, versie2, final, final2
- problemen hdd -> op het internet (meerdere backups)

### Hoe?
- plain text (code) gaat makkelijk
  - op basis van regelnummers
- word (.docx) is een binary (zip map)
  - dan kan het niet
  - mergen van binaries gaat altijd fout

### Vroeger (SVN)
#### timestamp met volledige copy
- enkel nieuwe versie staat lokaal
- op server enkel de algemene
  - server in de fik -> data loss
- is dus met een working copy van de server

### Distributed (git)
#### gemaakt door Linus Torvalds
- geen server
- iedereen heeft copy van bestanden op zen pc (van de hele repo)
- geen centrale computer
- bij een git load, wordt alles ingeladen (alle branches en files
- heeft geen internet nodig (kan dus in een bedrijfsomgeving met hun eigen server)

### Github specifiek
- heeft wel een server (voor het samenwerken)
- deze server is niet de master, een git node die identiek is aan de user pc
- bovenop nog een UI laag
- de server is dus een mirror
#### extra:
- heeft handige features zoals: loadbalance (nodig voor grote projecten en veel gebruikers)

### demo:
- aanmaken folder (mkdir)
- enable git
- .git folder wordt automatisch toegevoegd

### git cmd's
- git status
- git add
- git commit
- git push
- git pull

- git remote add <name> <url>
  
#### !!! na commit hebt ge een unieke hash, hierbij gaan er conflicten opgelost worden

## Opdracht 1
git clone repo opdracht 1
git branch dieter
git checkout dieter

openen met intellij

