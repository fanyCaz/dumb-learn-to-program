import time

class FibonacciIterator:

  def __init__(self, maxi = None):
    self.maxi = maxi

  def __iter__(self):
    self.n1 = 0
    self.n2 = 1
    self.counter = 0
    return self

  def __next__(self):
    self.counter += 1
    if self.maxi < self.counter:
      raise StopIteration
    if self.counter == 0:
      return self.n1
    elif self.counter == 1:
      return self.n2
    else:
      self.aux = self.n1 + self.n2
      self.n1, self.n2 = self.n2, self.aux
      return self.aux

if __name__ == '__main__':
  fib = FibonacciIterator(3)
  for i in fib:
    print(f"{i}\n")
    time.sleep(0.05)

