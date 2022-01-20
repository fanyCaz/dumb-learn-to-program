# hola 3 -> holaholahola

def repeat(word: str):
  
  def times(number: int):
    # afirma que recibe un string
    assert type(word) == str, "Solo recibe strings texto"
    print(word*number)

  return times

# Retorna la division entre x y n
def make_division_by(divisor: int):
  
  def numerator(num: int):
    print(num/divisor)
  return numerator

if __name__ == '__main__':
  hello = repeat('hola')
  hello(3)
  hello(10)
  division_3 = make_division_by(3)
  division_3(18)
  division_18 = make_division_by(18)
  division_18(54)

