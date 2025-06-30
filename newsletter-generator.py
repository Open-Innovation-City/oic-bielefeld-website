#!/usr/bin/env python3
"""
OIC Newsletter Generator
========================

Automatischer Newsletter-Generator für OIC Beiträge.
Scannt _beitraege/ Verzeichnis und erstellt Newsletter aus ausgewählten Beiträgen.

Usage:
    python newsletter-generator.py

Author: OIC Bielefeld Team
"""

import os
import sys
import yaml
import re
from datetime import datetime, date
from pathlib import Path
from typing import List, Dict, Optional
import argparse

class NewsletterGenerator:
    def __init__(self, base_path: str = "."):
        self.base_path = Path(base_path)
        self.beitraege_path = self.base_path / "_beitraege"
        self.output_path = self.base_path / "_site" / "newsletter"
        self.template_path = self.base_path / "newsletter-template.html"
        
        # Stelle sicher, dass Output-Verzeichnis existiert
        self.output_path.mkdir(parents=True, exist_ok=True)
    
    def parse_front_matter(self, content: str) -> tuple[Dict, str]:
        """Extrahiert YAML Front Matter aus Markdown-Datei."""
        if not content.startswith('---'):
            return {}, content
        
        try:
            # Front Matter extrahieren
            parts = content.split('---', 2)
            if len(parts) < 3:
                return {}, content
            
            front_matter = yaml.safe_load(parts[1])
            markdown_content = parts[2].strip()
            
            return front_matter or {}, markdown_content
        except yaml.YAMLError as e:
            print(f"❌ YAML Parse Error: {e}")
            return {}, content
    
    def get_all_posts(self) -> List[Dict]:
        """Lädt alle Beiträge aus _beitraege/ Verzeichnis."""
        posts = []
        
        if not self.beitraege_path.exists():
            print(f"❌ Beiträge-Verzeichnis nicht gefunden: {self.beitraege_path}")
            return posts
        
        for file_path in self.beitraege_path.glob("*.md"):
            try:
                with open(file_path, 'r', encoding='utf-8') as f:
                    content = f.read()
                
                front_matter, markdown_content = self.parse_front_matter(content)
                
                if not front_matter:
                    continue
                
                # Post-Daten sammeln
                post = {
                    'file_path': file_path,
                    'filename': file_path.stem,
                    'title': front_matter.get('title', file_path.stem),
                    'teaser': front_matter.get('teaser', ''),
                    'author': front_matter.get('author', ''),
                    'category': front_matter.get('category', ''),
                    'date': front_matter.get('date', ''),
                    'content': markdown_content,
                    'url': f"/beitraege/{file_path.stem}/"
                }
                
                # Datum parsen
                if post['date']:
                    if isinstance(post['date'], date):
                        post['date_obj'] = post['date']
                    else:
                        try:
                            post['date_obj'] = datetime.strptime(str(post['date']), '%Y-%m-%d').date()
                        except ValueError:
                            post['date_obj'] = None
                else:
                    post['date_obj'] = None
                
                posts.append(post)
                
            except Exception as e:
                print(f"⚠️  Fehler beim Lesen von {file_path}: {e}")
        
        # Nach Datum sortieren (neueste zuerst)
        posts.sort(key=lambda x: x['date_obj'] or date.min, reverse=True)
        return posts
    
    def filter_posts_by_date(self, posts: List[Dict], since_date: date) -> List[Dict]:
        """Filtert Posts nach Datum."""
        filtered = []
        for post in posts:
            if post['date_obj'] and post['date_obj'] >= since_date:
                filtered.append(post)
        return filtered
    
    def interactive_post_selection(self, posts: List[Dict]) -> List[Dict]:
        """Interaktive Auswahl der Posts für den Newsletter."""
        if not posts:
            print("❌ Keine Beiträge gefunden!")
            return []
        
        print(f"\n📄 Verfügbare Beiträge ({len(posts)}):")
        print("=" * 60)
        
        for i, post in enumerate(posts, 1):
            date_str = post['date_obj'].strftime('%d.%m.%Y') if post['date_obj'] else 'Kein Datum'
            print(f"[{i:2d}] {post['title']}")
            print(f"     📅 {date_str} | 👤 {post['author']} | 🏷️  {post['category']}")
            if post['teaser']:
                teaser = post['teaser'][:80] + "..." if len(post['teaser']) > 80 else post['teaser']
                print(f"     💭 {teaser}")
            print()
        
        print("Auswahl-Optionen:")
        print("• Einzelne Nummern: 1,3,5")
        print("• Bereiche: 1-3")
        print("• Alle: 'all' oder 'alle'")
        print("• Keine: 'none' oder Enter")
        
        while True:
            selection = input("\n➤ Beiträge auswählen: ").strip()
            
            if not selection or selection.lower() in ['none', 'keine']:
                return []
            
            if selection.lower() in ['all', 'alle']:
                return posts
            
            try:
                selected_indices = set()
                
                # Parse Auswahl
                parts = selection.split(',')
                for part in parts:
                    part = part.strip()
                    if '-' in part:
                        # Bereich: 1-3
                        start, end = map(int, part.split('-'))
                        selected_indices.update(range(start, end + 1))
                    else:
                        # Einzelne Nummer
                        selected_indices.add(int(part))
                
                # Validierung
                invalid = [i for i in selected_indices if i < 1 or i > len(posts)]
                if invalid:
                    print(f"❌ Ungültige Nummern: {invalid}")
                    continue
                
                # Posts auswählen
                selected_posts = [posts[i-1] for i in sorted(selected_indices)]
                
                print(f"\n✅ {len(selected_posts)} Beiträge ausgewählt:")
                for post in selected_posts:
                    print(f"   • {post['title']}")
                
                return selected_posts
                
            except ValueError:
                print("❌ Ungültige Eingabe! Bitte Zahlen, Bereiche oder 'all' verwenden.")
    
    def load_newsletter_template(self) -> str:
        """Lädt das Newsletter-Template."""
        try:
            with open(self.template_path, 'r', encoding='utf-8') as f:
                return f.read()
        except FileNotFoundError:
            print(f"❌ Newsletter-Template nicht gefunden: {self.template_path}")
            sys.exit(1)
    
    def generate_newsletter_content(self, selected_posts: List[Dict]) -> str:
        """Generiert Newsletter-Content aus ausgewählten Posts."""
        if not selected_posts:
            return ""
        
        # Header-Infos
        current_date = datetime.now().strftime("%B %Y")
        months_de = {
            'January': 'Januar', 'February': 'Februar', 'March': 'März',
            'April': 'April', 'May': 'Mai', 'June': 'Juni',
            'July': 'Juli', 'August': 'August', 'September': 'September',
            'October': 'Oktober', 'November': 'November', 'December': 'Dezember'
        }
        for en, de in months_de.items():
            current_date = current_date.replace(en, de)
        
        # Newsletter-Inhalt generieren
        content_sections = []
        
        for i, post in enumerate(selected_posts, 1):
            # Abschnitt für jeden Post
            section = f"""
            <h3 style="margin: 30px 0 15px 0; color: #666cde; font-size: 20px; font-weight: 600;">
                {post['title']}
            </h3>
            <p style="margin: 0 0 20px 0; color: #2c3e50; font-size: 16px; line-height: 1.6;">
                {post['teaser']}
            </p>
            """
            
            # Call-to-Action Button für jeden Post
            if post['url']:
                section += f"""
                <table role="presentation" cellspacing="0" cellpadding="0" border="0" style="margin: 25px 0;">
                    <tr>
                        <td style="border-radius: 25px; background: linear-gradient(135deg, #00b2bb 0%, #666cde 100%); text-align: center;">
                            <a href="https://oic-bielefeld.de{post['url']}" style="display: inline-block; padding: 12px 30px; color: #ffffff; text-decoration: none; font-weight: 600; font-size: 16px; border-radius: 25px;">
                                Beitrag lesen
                            </a>
                        </td>
                    </tr>
                </table>
                """
            
            # Meta-Informationen
            date_str = post['date_obj'].strftime('%d.%m.%Y') if post['date_obj'] else ''
            meta_info = []
            if date_str:
                meta_info.append(f"📅 {date_str}")
            if post['author']:
                meta_info.append(f"👤 {post['author']}")
            if post['category']:
                meta_info.append(f"🏷️ {post['category']}")
            
            if meta_info:
                section += f"""
                <p style="margin: 0 0 20px 0; color: #666; font-size: 14px; font-style: italic;">
                    {' | '.join(meta_info)}
                </p>
                """
            
            content_sections.append(section)
        
        # Zusammenfassung generieren
        intro_text = f"""
        Liebe Innovationsbegeisterte,
        
        herzlich willkommen zu unserem Newsletter für {current_date}! 
        Wir haben {len(selected_posts)} spannende Beiträge aus der Welt der offenen Innovation für Sie zusammengestellt.
        """
        
        closing_text = f"""
        Das waren unsere Highlights für {current_date}. Wir hoffen, Sie fanden die Beiträge interessant und inspirierend!
        
        Haben Sie Fragen oder Anregungen? Sprechen Sie uns gerne an.
        """
        
        return {
            'date': current_date,
            'intro': intro_text.strip(),
            'sections': ''.join(content_sections),
            'closing': closing_text.strip(),
            'title': f"OIC Newsletter {current_date}"
        }
    
    def generate_newsletter_html(self, selected_posts: List[Dict]) -> str:
        """Generiert vollständige Newsletter-HTML."""
        template = self.load_newsletter_template()
        content_data = self.generate_newsletter_content(selected_posts)
        
        if not content_data:
            return template
        
        # Template-Platzhalter ersetzen
        newsletter_html = template
        
        # Datum
        newsletter_html = newsletter_html.replace('[DATUM - z.B. Juni 2024]', content_data['date'])
        
        # Hauptüberschrift
        newsletter_html = newsletter_html.replace('[HAUPTÜBERSCHRIFT]', content_data['title'])
        
        # Einleitungstext
        newsletter_html = newsletter_html.replace('[EINLEITUNGSTEXT - Begrüßung und kurze Einführung in die Newsletter-Ausgabe]', content_data['intro'])
        
        # Content-Bereiche durch generierten Inhalt ersetzen
        # Wir ersetzen den ganzen mittleren Bereich
        start_marker = '<!-- Section 1 -->'
        end_marker = '<!-- Closing -->'
        
        start_pos = newsletter_html.find(start_marker)
        end_pos = newsletter_html.find(end_marker)
        
        if start_pos != -1 and end_pos != -1:
            before = newsletter_html[:start_pos]
            after = newsletter_html[end_pos:]
            
            newsletter_html = before + content_data['sections'] + '\n            <!-- Closing -->' + after
        
        # Abschlusstext
        newsletter_html = newsletter_html.replace('[ABSCHLUSSTEXT - Verabschiedung und Ausblick]', content_data['closing'])
        
        return newsletter_html
    
    def save_newsletter(self, html_content: str, filename: str = None) -> str:
        """Speichert Newsletter als HTML-Datei."""
        if not filename:
            timestamp = datetime.now().strftime('%Y-%m')
            filename = f"newsletter-{timestamp}.html"
        
        output_file = self.output_path / filename
        
        try:
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write(html_content)
            
            return str(output_file)
        except Exception as e:
            print(f"❌ Fehler beim Speichern: {e}")
            return ""
    
    def run(self, since_days: int = 30):
        """Hauptfunktion - Führt den Newsletter-Generator aus."""
        print("🚀 OIC Newsletter Generator")
        print("=" * 40)
        
        # 1. Posts laden
        print("📁 Lade Beiträge...")
        all_posts = self.get_all_posts()
        
        if not all_posts:
            print("❌ Keine Beiträge gefunden!")
            return
        
        print(f"✅ {len(all_posts)} Beiträge gefunden")
        
        # 2. Datum-Filter
        since_date = date.today().replace(day=1)  # Erster Tag des aktuellen Monats
        if since_days:
            from datetime import timedelta
            since_date = date.today() - timedelta(days=since_days)
        
        print(f"🗓️  Suche Beiträge seit: {since_date.strftime('%d.%m.%Y')}")
        
        recent_posts = self.filter_posts_by_date(all_posts, since_date)
        
        if not recent_posts:
            print(f"❌ Keine Beiträge seit {since_date.strftime('%d.%m.%Y')} gefunden!")
            print("💡 Verwenden Sie --since-days um den Zeitraum zu erweitern")
            return
        
        print(f"✅ {len(recent_posts)} aktuelle Beiträge gefunden")
        
        # 3. Interaktive Auswahl
        selected_posts = self.interactive_post_selection(recent_posts)
        
        if not selected_posts:
            print("❌ Keine Beiträge ausgewählt. Newsletter-Generierung abgebrochen.")
            return
        
        # 4. Newsletter generieren
        print(f"\n🔄 Generiere Newsletter mit {len(selected_posts)} Beiträgen...")
        newsletter_html = self.generate_newsletter_html(selected_posts)
        
        # 5. Speichern
        output_file = self.save_newsletter(newsletter_html)
        
        if output_file:
            print(f"\n✅ Newsletter erfolgreich generiert!")
            print(f"📄 Datei: {output_file}")
            print(f"🌐 URL: /newsletter/{Path(output_file).name}")
            print(f"\n💡 Tipp: Öffnen Sie die Datei in einem Browser zur Vorschau")
        else:
            print("❌ Fehler beim Speichern des Newsletters")

def main():
    """CLI Entry Point."""
    parser = argparse.ArgumentParser(description='OIC Newsletter Generator')
    parser.add_argument('--since-days', type=int, default=30,
                       help='Beiträge der letzten N Tage berücksichtigen (Standard: 30)')
    parser.add_argument('--base-path', type=str, default='.',
                       help='Basis-Pfad der Jekyll-Website (Standard: aktuelles Verzeichnis)')
    
    args = parser.parse_args()
    
    # Generator erstellen und ausführen
    generator = NewsletterGenerator(args.base_path)
    generator.run(args.since_days)

if __name__ == '__main__':
    main()