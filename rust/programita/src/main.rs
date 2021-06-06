use std::io;
use rand::Rng;

fn main() {

    //so everything is constant unless said otherwise
    let secret_number = rand::thread_rng().gen_range(1..101);
    println!("Adivina el número");
    println!("Pon el número que crees que saldrá");

    //mut is to making them actually variable, mutable
    let mut guess = String::new();

    io::stdin()
        .read_line(&mut guess)
        .expect("No se pudo leer el dato");
    println!("Tu adivinaste : {}", guess);
    println!("El número secreto es : {}", secret_number);
}
