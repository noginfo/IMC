unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, UnitIMC;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    SB_Calcular_IMC: TSpeedButton;
    GroupBox2: TGroupBox;
    Edit3: TEdit;
    Edit4: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    SB_Novo_Calculo: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SB_Novo_CalculoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Informar_dados(Sender: TObject);
    procedure SB_Calcular_IMCClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Calculadora_IMC: TCalculadora_IMC;

implementation

{$R *.dfm}

procedure TForm1.Informar_dados(Sender: TObject);
begin
  Calculadora_IMC:= TCalculadora_IMC.Create;
  Calculadora_IMC.Peso:= StrToFloat(Edit1.Text);
  Calculadora_IMC.Altura:= StrToFloat(Edit2.Text);
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:= MessageDLG('Deseja realmente fechar?',MTConfirmation,[MBYES,MBNO],0)=MRYES;
end;

procedure TForm1.SB_Calcular_IMCClick(Sender: TObject);
begin
  Informar_dados(Sender);
  Calculadora_IMC.Calcular_IMC(Calculadora_IMC.Peso,Calculadora_IMC.Altura);
  Calculadora_IMC.Retornar_IMC(Calculadora_IMC.IMC);
  Edit3.Text:= FloatToStr(Calculadora_IMC.IMC);
  Edit4.Text:= Calculadora_IMC.Classifica;
end;

procedure TForm1.SB_Novo_CalculoClick(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit1.SetFocus;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
