---
title: "KI und Open Source – Digitale Souveränität mit openWebUI"
teaser: "Ihr wollt euch nicht nur auf große US-Unternehmen verlassen und wieder in die nächste Abhängigkeit laufen? Mit der Kombination aus Open Source-Tool, frei verfügbaren LLMs und europäischen KI-Anbietern gibt es gute Alternativen. Wir stellen euch eine Kombination vor, die ihr mal ausprobieren solltet."
author: "Jens Edler"
category: "Tools"
date: 2025-10-01 
header_image: "/assets/images/graffiti.png"
---
### Warum brauchen wir Alternativen?
Große US-Unternehmen dominieren aktuell den Markt für [generative KI](https://de.wikipedia.org/wiki/Generatives_KI-Modell), kurz GenAI. Und das nicht zu unrecht. Tools wie Claude, ChatGPT und Perplexity funktionieren super und erleichtern in vielen Bereichen unsere Arbeit. Allerdings laufen wir als Gesellschaft ein weiteres Mal Gefahr, uns von großen US-Unternehmen abhängig zu machen. Im Extremfall sind wir nur eine willkürliche Entscheidung davon entfernt, dass wir von heute auf morgen keinen Zugriff auf die Tools bekommen, auf die wir uns so sehr verlassen. Aber auch abgesehen von so einem Worst-Case-Szenario gibt es genug Gründe, eine Abhängigkeit zu vermeiden: Der mangelhafte Datenschutz ist schon Grund genug, sich nach sinnvollen Alternativen umzuschauen. Dazu kommt noch, dass wir zukünftigen Preisanpassungen nichts entgegenzusetzen haben, wenn uns gefühlt die Alternativen fehlen.

### openWebUI als zentrale KI-Schnittstelle für lokale LLMs
Glücklicherweise veröffentlichen viele KI-Anbieter Modelle zur freien Verwendung als sogenannte [Open Weight](https://www.business-reporter.co.uk/ai--automation/ai-understanding-open-weight-models)-Modelle. Möchte man diese Modelle nutzen, hilft das Tool [Ollama](https://ollama.com), mit dem man diese Modelle herunterladen und auf dem eigenen Rechner nutzen kann. Damit diese Modelle von möglichst vielen Menschen in eurer Organisation genutzt werden können, müssen sie einfach zugänglich gemacht werden. Da kommt [openWebUI](https://github.com/open-webui/open-webui) in Spiel. openWebUI ist eine Webinterface für LLMs, das ihr auf eurem eigenen Server installieren könnt. Darüber bekommen die Nutzenden eine Oberfläche, die sehr ähnlich zu den Oberflächen der gängigen KI-Anbieter ist. Das Entscheidende ist, dass openWebUI [Open Source Software](https://de.wikipedia.org/wiki/Free/Libre_Open_Source_Software) ist. Der Quellcode ist frei verfügbar und ihr könnt openWebUI ohne Lizenzgebühren nutzen. Natürlich steht es euch frei, professionellen Support dafür zu kaufen, wenn der Bedarf besteht.

![Webinterface von openWebUI generiert eine Antwort auf die Frage nach der Definition von Open Innovation](/assets/images/beitraege/openwebui.gif "openWebUI in Aktion")

Über die Oberfläche von openWebUI können verschiedene LLMs genutzt werden, die von euch auf eurem Server zur Verfügung gestellt werden. Der Clou dabei ist: Ihr seid nicht auf lokale LLMs beschränkt. Über openWebUI könnt ihr auch Modelle externer Anbieter wie z.B. OpenAI und Anthropic einbinden. Aber halt! Eigentlich geht es ja darum, sich nicht weiter von den großen US-Techfirmen abhängig zu machen... 

### Mehr Power mit Mistral

Zum Glück gibt es bereits leistungsfähige Alternativen, die aus der EU kommen. Die wahrscheinlich bekannteste davon ist [Mistral](https://mistral.ai). Mistral wurde von ehemaligen Mitarbeitenden von [Google DeepMind](https://deepmind.google) und Meta gegründet und ist in Frankreich ansässig. Mistral stellt leistungsfähige Modelle für diverse Anwendungsfälle zur Verfügung. Über Text- und Bildegenerierung, Spracherkennung und Programmierung ist alles dabei. Natürlich stellt Mistral auch viele seiner Modelle als freie Open Weight-Modelle zur Verfügung, sodass ihr problemlos testen könnt. Die Einbindung von Mistral – und auch anderer externer LLMs – kann einfach in openWebUI konfiguriert werden. Die so eingebundenen Modelle stehen den Nutzenden dann direkt im Webinterface zur Verfügung und reihen sich in die Auswahl der LLMs mit ein.

### Macht das schon wer?

Vorreiter in der Nutzung lokaler LLMs und openWebUI in Kommunen ist die [Stadt Nettetal](https://www.nettetal.de). Der dortige CTO [Thorsten Rode](https://www.linkedin.com/in/thorstenrode/) hat schon vor einiger Zeit die ersten Schritte in Richtung Digitale Souveränität gemacht, sodass die Mitarbeitenden in Nettetal auf lokale LLMs auf eigenen Servern zugreifen können. So geht digitale Souveränität ganz praktisch. Mehr Informationen über die Umsetzung in Nettetal bekommt ihr in [diesem Artikel bei kommune21](https://www.kommune21.de/k21-meldungen/potenziale-frueh-erkannt/). Außerdem kann ich euch nur wärmstens empfehlen, auch mal direkt mit Thorsten zu sprechen. Ganz im Sinne der Open Innovation teilt er gerne seine Erfahrungen mit euch. 
