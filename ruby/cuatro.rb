$flavours = ['mango','strawberry',['grape','melon']]

#the ',' get values from a position to other
puts $flavours[1,2]

def several
    #it starts at 0
    10.times do |num|
        puts num
    end
end

several()

ENV.each {|k,v| puts "#{k}: #{v}"}

$varUno = 20

while $varUno == 20
    puts "hola, soy #{$varUno}"
    $varUno = 
    #negative if
    unless $varUno == 4
        puts 'False'
        exit
    end
    if $varUno == 4
        puts 'True'
        exit
    end
end