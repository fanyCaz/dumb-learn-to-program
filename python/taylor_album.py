import sys
import wikipediaapi

wiki = wikipediaapi.Wikipedia('en')

def argumentExists(func):
  def wrapper(*args,**kwargs):
    print(sys.argv)
    try:
      album = sys.argv[1]
    except:
      album = "Reputation Taylor Swift"
    func(album)
  return wrapper

def findTSAlbum(search: str):
  found = wiki.page(search)
  if found.exists():
    sections = (section.title for section in found.sections)
    print("Sections")
    for section in sections:
      print(section)
      print( found.section_by_title(section).text[0:50])
    print("Info")
    print( wiki.info(found))
  else:
    print("No se encontró :/")

@argumentExists
def selectedAlbum(album: str):
  print(album)
  findTSAlbum(album)

if __name__ == "__main__":
  selectedAlbum()

