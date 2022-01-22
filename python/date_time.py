from datetime import datetime
import pytz

bogota = pytz.timezone("America/Bogota")
bog_date = datetime.now(bogota)
print(bog_date)
