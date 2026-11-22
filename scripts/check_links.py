"""Check local assets and page links in a Hugo build with a GitHub Pages base path."""

from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import urljoin, urlsplit
import sys


BASE = "https://example.github.io/ownword-workshop/"
OUTPUT = Path(sys.argv[1] if len(sys.argv) > 1 else ".build-check").resolve()
BASE_PATH = urlsplit(BASE).path


class Links(HTMLParser):
    def __init__(self):
        super().__init__()
        self.urls = []

    def handle_starttag(self, tag, attrs):
        for key, value in attrs:
            if key in {"href", "src"} and value:
                self.urls.append(value)


missing = []
checked = 0
for html_file in OUTPUT.rglob("*.html"):
    parser = Links()
    parser.feed(html_file.read_text(encoding="utf-8"))
    page_url = BASE + html_file.relative_to(OUTPUT).as_posix()
    if html_file.name == "index.html":
        directory = html_file.parent.relative_to(OUTPUT).as_posix()
        page_url = BASE if directory == "." else BASE + directory + "/"
    for link in parser.urls:
        if link.startswith("#"):
            continue
        parsed = urlsplit(urljoin(page_url, link))
        if parsed.netloc != urlsplit(BASE).netloc or not parsed.path.startswith(BASE_PATH):
            continue
        relative = parsed.path[len(BASE_PATH):]
        target = OUTPUT / relative
        if parsed.path.endswith("/"):
            target /= "index.html"
        checked += 1
        if not target.is_file():
            missing.append((str(html_file.relative_to(OUTPUT)), link))

for source, link in missing[:50]:
    print(f"MISSING {source}: {link}")
print(f"Checked {checked} local links/assets across {len(list(OUTPUT.rglob('*.html')))} HTML files; {len(missing)} missing.")
sys.exit(1 if missing else 0)
