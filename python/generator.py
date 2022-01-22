import time

def fibo_generator(stop):
  n1= 0
  n2= 1
  counter = 0

  while counter < stop:
    if counter == 0:
      counter += 1
      yield n1
    elif counter == 1:
      counter += 1
      yield n2
    else:
      counter += 1
      aux = n1+n2
      n1,n2 = n2, aux
      yield aux

maxi = 10
fib = fibo_generator(maxi)

for i in fib:
  print(i)
  time.sleep(0.5)
