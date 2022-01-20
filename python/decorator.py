fearless = ['breathe','tell me why','forever and always','the best day','mr perfectly fine']
speak_now = ['dear john','last kiss','enchanted','speak now']
red = ['all too well','red','nothing_new','come back','22','i almost do']

def is_in_some_album(func):
  def wrapper(*args,**kwargs):
    func(*args, **kwargs)
    song = args[0]
    album = args[1]
    if song in fearless and album == 'fearless':
      print("Le atinaste, está en fearless")
    elif song in speak_now and album == 'speak now':
      print("Le atinaste, está en Speak Now")
    elif song in red and album == 'red':
      print("Le atinaste, está en Red")
    else:
      print("No sabemos de donde es :c")
  return wrapper

@is_in_some_album
def guess_album(song: str, album: str):
  print(f"estará {song} en {album} ????")

guess_album('all too well','red')
 
