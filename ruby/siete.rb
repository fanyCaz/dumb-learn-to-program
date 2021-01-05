require 'logger'

$LOG = Logger.new('this_month.log','monthly')
$LOG.debug("numerator 10 , denominator 0")
begin
    10/0
rescue Exception => exception
    $LOG.error("Error in division #{exception}")
end
