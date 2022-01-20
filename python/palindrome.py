import mypy

def is_palindrome(word: str) -> bool:
  word = word.replace(' ','').lower()
  return word == word[::-1]

if __name__ == '__main__':
  print(is_palindrome(1000))
