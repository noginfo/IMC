unit UnitIMC;

interface

type

  TCalculadora_IMC = class(TObject)
  Peso:double;
  Altura:double;
  IMC:double;
  Classifica:string;
  function Calcular_IMC(Peso,Altura:Double):Double;
  function Retornar_IMC (IMC:Double):String;

end;

implementation

function TCalculadora_IMC.Calcular_IMC(Peso: Double; Altura: Double):Double;
begin
  IMC:=(Peso /(Altura*Altura));
  Result:= IMC;
end;

function TCalculadora_IMC.Retornar_IMC(IMC: Double):String;
begin
  if IMC < 18.5 then
    Classifica:='Abaixo do peso'
  else
    if IMC <= 24.9 then
      Classifica:='Peso normal'
    else
      if IMC <= 29.9 then
        Classifica:='Sobrepeso'
      else
        if IMC <= 34.9 then
          Classifica:='Obesidade Grau I'
        else
          if IMC <= 39.9 then
            Classifica:='Obesidade Grau II'
          else
            Classifica:='Obesidade Grau III';
  Result:=Classifica;
end;

end.

