# Newsletter Generator - Schnelle Setup-Anleitung

## 🚀 5-Minuten Setup

### 1. Virtual Environment erstellen
```bash
# Im Website-Verzeichnis
python3 -m venv newsletter-env
```

### 2. Environment aktivieren
```bash
# Linux/Mac
source newsletter-env/bin/activate

# Windows
newsletter-env\Scripts\activate
```

### 3. Dependencies installieren
```bash
pip install PyYAML
```

### 4. Ersten Newsletter erstellen
```bash
python newsletter-generator.py
```

### 5. Environment deaktivieren
```bash
deactivate
```

## 📧 Regelmäßige Nutzung

```bash
# 1. Environment aktivieren
source newsletter-env/bin/activate

# 2. Newsletter erstellen
python newsletter-generator.py

# 3. Environment deaktivieren  
deactivate
```

## 📁 Ausgabe

Generierte Newsletter finden Sie in:
```
generated-newsletters/newsletter-YYYY-MM.html
```

## ❓ Probleme?

**PyYAML fehlt?**
```bash
source newsletter-env/bin/activate
pip install PyYAML
```

**Keine Beiträge gefunden?**
- Prüfen Sie, ob `_beitraege/` Verzeichnis existiert
- Verwenden Sie `--since-days 365` für längeren Zeitraum

**Template nicht gefunden?**
- Datei `newsletter-template.html` muss im Hauptverzeichnis liegen

## 📖 Vollständige Anleitung

Siehe: [NEWSLETTER-GENERATOR.md](NEWSLETTER-GENERATOR.md)

---

🎉 **Happy Newsletter Creating!**