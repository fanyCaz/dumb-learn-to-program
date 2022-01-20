from datetime import datetime

def execution_time(func):
  def wrapper(*args, **kwargs):
    init_time = datetime.now()
    func(*args,**kwargs)
    end_time = datetime.now()
    elapsed = end_time - init_time
    print(f"Tiempo usado {elapsed.total_seconds()} segundos")
  return wrapper

