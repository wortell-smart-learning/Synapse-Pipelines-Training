# Lab9 - Batching en DIUs

*Vereisten*

Om de lab te kunnen starten is het van belang dat Lab8 is afgerond.

*Doel*

We hebben nu zo goed als alles behandeld rondom de standaard orchestrie in de ADF. Toch kan het voorkomen dat enkele pipelines zoveel data moeten overhalen dat ze niet heel vlot draaien. Er zijn enkele knoppen waar nog aan gedraait kunnen worden om dit sneller te kunnen laten verlopen in de vorm van Batching en DIUs. Volg de opdrachten stap voor stap.

## Opdracht 1 - Batching

1. Ga naar de **PL_copy_Deltaload_Training** pipeline en open de **ForEach** om bij de **Copy data** activiteit te komen.

2. Klik **Copy Tables** aan en ga naar de tab **Sink**. Onder **Pre-copy script** zie je de optie **Write batch size** en vul hier 1 in.

3. Klik op **Debug** en wacht tot de pipeline klaar is. Je zult zien dat het nu heel lang duurt om alles te laden omdat er per 1 rij per keer wordt weggeschreven. Dit is natuurlijk niet gunstig en je wilt dit zo hoog mogelijk hebben. Normaliter bepaald de ADF zelf hoe groot zijn Batch sizes zijn, dit is meestal tussen de 1200 en 1500 regels. Het kan zijn dat je een proces hebt, waarbij het van belang is dat alle data in 1x geladen wordt zodat er geen mismatches kunnen ontstaan. Dit is bijvoobeeld erg fijn als je een row-based Datamodel hanteerd. 

4. Verander de **batchsize** van 1 in iets anders,  klik op **Debug** en bekijk je resultaten. Probeer enkele **batchsizes** tot het moment dat het geen verschil meer maakt.


## Opdracht 2 - Data Integration Units.

1. Ga in de **Copy Tables** activiteit naar de tab **Settings**.

2. Je ziet hier de optie voor **Data integration unit**, en deze staat standaard op **Auto**. Hiermee bepaald de ADF zelf hoeveel DIUs het denkt nodig te hebben voor een bepaalde workload. Vaak is de bepaling accuraat maar kan het voorkomen dat extra rekenkracht kan helpen. Pas de **Data integration unit** naar **2**.

3. Klik op **Debug** en wacht tot de pipeline klaar is. Bekijk de resultaten, het meeste zal klaar zijn tussen de 10 en 15 seconden. 

4. Verander de **Data integration unit** van 2 in iets anders,  klik op **Debug** en bekijk je resultaten. Probeer enkele **Data integration units** tot het moment dat het geen verschil meer maakt.

### Einde Lab9