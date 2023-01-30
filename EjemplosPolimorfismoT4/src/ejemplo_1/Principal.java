package ejemplo_1;

public class Principal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Cuadrado cu1= new Cuadrado("Primer cuadrado", "Rojo", 1.0);
		Circulo ci1= new Circulo ("Primer Círculo", "Azul", 1.0);
		System.out.println(cu1);
		System.out.println(ci1);
		System.out.println("*********Área y perímetro**********");
		System.out.println("Área del primer cuadrado: "+cu1.calcularArea());
		System.out.printf("Perímetro del primer círculo: %.2f",ci1.calcularArea());

		//Prueba con polimorfismo
		
		System.out.println("\n\n\n***********************************************");
		Figura f1= new Cuadrado ("Segundo cuadrado", "verde", 2.0);
		Figura f2= new Circulo ("Segundo círculo", "Amarillo", 2.0);
		
		System.out.println(f1);
		System.out.println(f2);
		System.out.println("*********Áreas**********");
		System.out.println("Usan el método de cada clase concreta porque está sobrescrito");
		System.out.println("Área del segundo cuadrado: "+f1.calcularArea());
		System.out.printf("Perímetro del segundo círculo: %.2f",f2.calcularArea());
		System.out.println("\nPero ahora no pueden usar los métodos que solo están en cuadrado y círculo porque son figuras\n\n");
		
		//System.out.println(f1.mostrarLados ()); Error de compilación
		//System.out.println(f2.contarRadianes ());Error de compilación



	}

}
