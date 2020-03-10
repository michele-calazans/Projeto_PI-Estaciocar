int pinoSensor = 0;
int valorLido = 0; 
float temperatura = 0;
int linha =0;

void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
Serial.println("CLEARDATA");
Serial.println("Temperatura");
}

void loop() {
  // put your main code here, to run repeatedly:
  valorLido = analogRead(pinoSensor);
  temperatura = (valorLido * 0.00488);//5volts dividido por 1023 = 0,0048 precisão do A/D
  temperatura = temperatura * 100;//converte milivolts para celsius - cada 10mv==1 grau C
  linha++;
  //Serial.print("DATA, TIME");
  Serial.println(temperatura);
  //Serial.print(",");
  //Serial.println(linha);

  if(linha > 100){//loop pra executar 100 vezes e depois repetir
    linha = 0;
    Serial.println("ROW, set, 2");
    }
    delay(1000);// tempo de um segundo para a exibição de dados
}
