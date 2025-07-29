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


### Was denn jetzt genau?

Zu diesem Zeitpunkt waren *zwei Dinge* klar:

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


### Wohin geht der Weg?

Ich kann euch nur empfehlen, einen Blick auf die Case Study von Antropic zu werfen. Dort werden praktische Anwendungsfälle für die Nutzung von Claude Code beschrieben, die auch Bereiche abseits von Programmierung berühren. Eine tolle Inspiration, auch für die Ntuzung anderer LLMs: [Case Study zur Nutzung von Claude Code](https://www-cdn.anthropic.com/58284b19e702b49db9302d5b6f135ad8871e7658.pdf)

Was mich schmerzt ist, dass Anthropic wieder mal ein amerikanische Unternehmen ist, das deutlich weiter ist, als die europäischen Alternativen. Ich hoffe, dass auch europäische Unternehmen wie z.B. [Mistral](https://mistral.ai) bald nachziehen und ähnlich Tools bereitstellen.  

---

**P.S.:** Für die technisch interessierten Menschen: Die Website nutzt [Jekyll](https://jekyllrb.com) als [Static Site Generator](https://www.ionos.de/digitalguide/websites/webseiten-erstellen/was-ist-ein-static-site-generator/) und [GitHub Pages](https://pages.github.com) für das Hosting. Das Repository dazu findet ihr [hier auf GitHub](https://github.com/jensedler/oic-bielefeld-website).
