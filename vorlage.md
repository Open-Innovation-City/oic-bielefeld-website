---
title: "Diese Website wurde mit KI erstellt"
teaser: "Unsere neue Website ist da! Und sie ist nicht auf klassischem Wege entstanden. Anthropics Claude Code hat die Website fast im Alleingang erstellt, beim Hosting geholfen und die Erstellung von Newslettern automatisiert."
author: "Jens Edler"
category: "Tools"
date: 2025-07-22
header_image: "/assets/images/ki.png"
---

## Mit KI auf dem Weg zur neuen Website

### Warum nicht wie immer?

Als klar war, dass wir eine neue Website für Open Innovation City Bielefeld brauchen, war mein erster Gedanke: Schnell eine Website mit Wordpress aufsetzen, ein schönes Theme installieren und ab geht die Post. Genau so habe ich es ja schon vor 15 Jahren gemacht. Alles kein großes Ding. 

Pustekuchen!

Stellt sich raus: In den letzten 15 Jahren haben sich doch einige Dinge verändert. Die Installation von Wordpress ist immer noch schnell erledigt, aber beim Thema Themes... da hat sich einiges getan. Die Ära von einfachen Themes scheint vorbei zu sein. Alles, was irgendwie ansehnlich daher kommt, versteckt sich in einem Themebuilder, mit dem man sich haarklein sein Layout zusammenbauen kann. Das sit sicherlich super, wenn man sich damit auskennt. Das sit aber weniger toll, wenn man einfach nur eine Website haben möchte.

### Wie denn dann?

Was also tun? Kurz vorher hatte ich in einem [Podcast](https://freakshow.fm/fs290-das-popcorn-problem) vom [Claude Code](https://www.anthropic.com/claude-code) gehört, einem Programmier-Tool der Firma [Anthropic](https://www.anthropic.com), das – anders als die meisten LLM-Tools – auf der Kommandozeile "wohnt" und nicht im Web-Browser. Das hat den unschätzbaren Vorteil, dass Claude Code direkt auf Dateien zugreifen und diese auch bearbeiten kann. Das fühlt sich dann so an, als hätte man eine erfahrene Programmiererin neben sich sitzen, der man Arbeitsaufträge geben, Fragen stellen und über Lösungsansätze diskutieren kann. 

Im Gegensatz dazu waren meine ersten Programmierversuche mit ChatGPT vor 2 Jahren noch sehr umständlich:

- In ChatGPT beschreiben, was programmiert werden soll
- Ergebnisse anschauen und bewerten
- Anpassungen und Korrekturen durchführen lassen
- Wieder kontrollieren
- Den Inhalt aus dem Browser kopieren und in einzelne Dateien ablegen
- Das Programm testen
- Fehlermeldungen in ChatGPT kopieren
- ...

Ein sehr mühsamer Prozess, der zudem noch fehleranfällig war.

Mit Tools wie Claude Code gehört das der Vergangenheit an, weil es direkt da arbeitet, wo man beim Programmieren auch arbeitet: Direkt auf dem eigenen Computer. Mit genau den Dateien, mit denen man selber arbeitet. Dadurch ist Claude Code selber in der Lage, das Programmierte zu testen, Fehlermeldungen zu analysieren und Korrekturen selbstständig durchzuführen.

### Was denn jetzt genau?

Zu diesem Zeitpunkt waren zwei Dinge klar:

1. Es soll keine Wordpress-Website werden
2. Claude Code soll mir bei der Erstellung helfen

Mittlerweile haben wir ja alle gelernt, dass es bei der Nutzung von KI-Tool vor allem darauf ankommt, dem jeweiligen Tool möglichst viel Kontext zur Aufgabe zu liefern. So kann man sicherstellen, dass die Ergebnisse nicht zu allgemein werden. Hier der Prompt, mit dem ich angefangen haben:


> Es handelt sich um eine Website für das Projekte Open Innovation City, kurz: OIC. Informationen darüber findest du bereits hier: https://www.openinnovationcity.de/. Ich brauche eine Seite für eine Unterprojekt für OIC in Bielefeld.
>
> Ich habe Erfahrungen in der Webentwicklung, bin mit CMS-Systemen vertraut und kann Webserver konfigurieren.
>
> Die Website soll in erster Linie das Projekte OIC Bielefeld darstellen. Unsere Vision und Mission, die Teammitglieder mit ihren Fachgebieten und unsere Projekte aus den unterschiedlichsten Bereichen, wie z.B. Smart City, Offene Innovationen usw. Die Website braucht keine Webshop-Komponenten usw.
>
> Vom Stil her dachte ich in Richtung wie bei https://www.ideo.com/ oder https://ajsmart.com/. Freundlich und offen gestaltet. Klare, einfach Typografie. Es gibt auch schon ein Logo für das Projekt und eine Art Grafiti, dass stilistisch gut passt. Ein paar nett Scrollanimationen und Parallaxeffekte dürfen schon dabei sein, damit die Website interessanter wird.
>
> Mit ist vor allem wichtig, dass ich die Website schnell veröffentlichen kann. Die Website soll idealerweise rein statisch ohne Datenbank etc. funktionieren.
>
> Soll ich die das Logo und das Grafitti hochladen, damit du einen Eindruck bekommst?
>
> Bitte fange nciht direkt mit der Programmierung an, sondern schreibe zuerst ein Umsetzungskonzept, damit wir beide wissen, dass wir auf dem richtigen Weg sind. Stelle mir gerne noch mehr Fragen.


Gerade der letzte Abschnitt war sehr wichtig in der Arbeit mit Claude Code. Durch die Fragen, die mir das Tool gestellt hat, sind wir zu einer Lösung gekommen, die schnell umsetzbar war, wenig komplex ist und zudem noch kostenlos nutzbar ist. Weil das Tool nicht direkt mit der Umsetzung begonnen hat, sondern erstmal ein Konzept erstellen sollte, war es viel einfacher, offene Fragen zu klären und sich genau zu überlegen, wo man eigentlich hin will. Durch die Rückfragen des Tool habe ich selber viel gelernt und habe über Details nachgedacht, die mir sonst entgangen wären und genau so soll es ja sein, wenn man mit anderen "zusammenarbeitet", auch wenn es in diesem Fall nur eine LLM war und kein Mensch. Gelernt habe ich trotzdem einiges.

### Wohin geht der Weg?

Natürlich ist nicht alles Gold, was glänzt. Ganz ohne Programmierkenntnisse kommt man aktuell noch nicht so weit. Das Tool kann sich doch mal an der ein oder anderen Stelle verzetteln oder es kommt zu Fehlern, bei denen man erstmal selber wissen muss, wo man hinschauen muss, damit man die KI auf die richtige Fährte setzen kann. Aber für Menschen mit einem grundlegenden Verständnis für Programmieren eröffnen sich völlig neue Möglichkeiten und Produktivitätsgewinne, die ich nicht für möglich gehalten hätte. Bestes Beispiel: Innerhalb von 5 Minuten habe ich mit Claude Code ein Script erstellt, das aus den aktuellsten Inhalten der Website automatisch einen Newsletter erstellt. Händisch hätte mich das mindestens 1-2 Tage gekostet und ich hätte wahrscheinlich nie damit angefangen.

Ich kann euch nur empfehlen, einen Blick auf die Case Study von Antropic zu werfen. Dort werden praktische Anwendungsfälle für die Nutzung von Claude Code beschrieben, die auch Bereiche abseits von Programmierung berühren. Eine tolle Inspiration, auch für die Ntuzung anderer LLMs: [Case Study zur Nutzung von Claude Code](https://www-cdn.anthropic.com/58284b19e702b49db9302d5b6f135ad8871e7658.pdf)

Was mich schmerzt ist, dass Anthropic wieder mal ein amerikanische Unternehmen ist, das deutlich weiter ist, als die europäischen Alternativen. Ich hoffe, dass auch europäische Unternehmen wie z.B. [Mistral](https://mistral.ai) bald nachziehen und ähnlich Tools bereitstellen.  

---

**P.S.:** Für die technisch interessierten Menschen: Die Website nutzt [Jekyll](https://jekyllrb.com) als [Static Site Generator](https://www.ionos.de/digitalguide/websites/webseiten-erstellen/was-ist-ein-static-site-generator/) und [GitHub Pages](https://pages.github.com) für das Hosting. Das Repository dazu findet ihr [hier auf GitHub](https://github.com/jensedler/oic-bielefeld-website).
