unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, StdCtrls, LCLIntf, Buttons, DbCtrls, ComCtrls,
  componentes1;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    chkTagForm: TCheckBox;
    cbbTemplate: TComboBox;
    cbbTheme: TComboBox;
    edtDataType: TEdit;
    edtTitle: TEdit;
    edtNome: TEdit;
    SDK3Button1: TSDK3Button;
    SDK3ComboBox1: TSDK3ComboBox;
    SDK3Edit1: TSDK3Edit;
    SDK3Edit2: TSDK3Edit;
    SDK3Edit3: TSDK3Edit;
    SDK3Edit4: TSDK3Edit;
    SDK3Edit5: TSDK3Edit;
    SDK3Edit6: TSDK3Edit;
    SDK3Image1: TSDK3Image;
    SDK3Label1: TSDK3Label;
    SDK3Label2: TSDK3Label;
    SDK3Label3: TSDK3Label;
    SDK3Label4: TSDK3Label;
    SDK3Label5: TSDK3Label;
    SDK3Label6: TSDK3Label;
    SDK3Label7: TSDK3Label;
    SDK3Layout1: TSDK3Layout;
    SDK3RichEdit1: TSDK3RichEdit;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;

    procedure cbbThemeChange(Sender: TObject);
    procedure chkTagFormChange(Sender: TObject);
    function TColorToHex(Cor: TColor): string;
    function Replaces(s: string; tags: String): String;
    function Aligns(item: TWinControl): String;
    function AlignsNotWinControl(itemA: TAlign; item: TControl): String;
    function Fonts(item: TFont): String;

    function MakeButton(item: TSDK3Button): String;
    function MakeColorComboBox(item: TSDK3ColorComboBox): String;
    function MakeComboBox(item: TSDK3ComboBox): String;
    function MakeCheckBox(item: TSDK3CheckBox): String;
    function MakeEdit(item: TSDK3Edit): String;
    function MakeFlowLayout(item: TSDK3FlowLayout): String;
    function MakeImage(item: TSDK3Image): String;
    function MakeLayout(item: TSDK3Layout): String;
    function MakeFlowPart(item: TSDK3FlowPart): String;
    function MakeImageCheckBox(item: TSDK3ImageCheckBox): String;
    function MakeLabel(item: TSDK3Label): String;
    function MakeProgressBar(item: TSDK3ProgressBar): String;
    function MakeRadioButton(item: TSDK3RadioButton): String;
    function MakeTabControl(item: TSDK3TabControl): String;
    function MakeTab(item: TCustomPage): String;
    function MakeRichEdit(item: TSDK3RichEdit): String;
    function MakeScrollBox(item: TSDK3ScrollBox): String;

    procedure FormCreate(Sender: TObject);
    procedure Finalizar(Sender: TObject);
    function geraTags(comp: TComponent; memo: TMemo): String;
    function PanXpan(comp: TComponent): String;

    function xMLE(S: String): String;

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

function TfrmMain.MakeButton(item: TSDK3Button): String;
var
  s: String;
begin
     s := 'text="' + xMLE(item.Caption) + '" enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + xMLE(item.Hint) + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" '+#13+#9+#9+' fontColor="#' + TColorToHex(item.Font.Color) +
     '" fontFamily="' + xMLE(item.Font.Name) + '" fontSize="' + inttostr(item.Font.Size);

     s := s + '"' + Fonts(item.Font)+#13+#9+#9;
     s := s + ' ' + Aligns(item);

     result := Replaces(s, '<button ');
end;

function TfrmMain.MakeColorComboBox(item: TSDK3ColorComboBox): String;
var
  s: String;
begin
     s := 'color="Null" enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + xMLE(item.Hint) + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" field="' + xMLE(item.Field) + '" '+#13+#9+#9;

     s := s + ' ' + Aligns(item);
     result := Replaces(s, '<colorComboBox ');
end;

function TfrmMain.MakeComboBox(item: TSDK3ComboBox): String;
var
  s: String;
begin
     s := 'enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + xMLE(item.Hint) + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" field="' + xMLE(item.Field) + '" '+#13+#9+#9 +
     'fontColor="#' + TColorToHex(item.Font.Color) +
     '" fontFamily="' + xMLE(item.Font.Name) + '" fontSize="' + inttostr(item.Font.Size) + '"'+
     ' items="' + item.Items + '" values="' + item.values + '" value="' + item.value + '" '+#13+#9+#9;

     s := s + Fonts(item.Font);
     s := s + ' ' + Aligns(item);
     result := Replaces(s, '<comboBox ');
end;

function TfrmMain.MakeCheckBox(item: TSDK3CheckBox): String;
var
  s: String;
begin
     s := 'text="' + xMLE(item.Caption) + '" checked="' + LowerCase(booltostr(item.Checked)) +
     '" enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + xMLE(item.Hint) + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" field="' + xMLE(item.Field) + '"'+
     'fontColor="#' + TColorToHex(item.Font.Color) +
     '" fontFamily="' + xMLE(item.Font.Name) + '" fontSize="' + inttostr(item.Font.Size) + '" '+#13+#9+#9;

     s := s + Fonts(item.Font);
     s := s + ' ' + Aligns(item);
     result := Replaces(s, '<checkBox ');
end;

function TfrmMain.MakeEdit(item: TSDK3Edit): String;
var
  s: String;
begin
     s := 'text="' + xMLE(item.Caption) + '" enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + xMLE(item.Hint) + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" field="' + xMLE(item.Field) + '" '+
     'fontColor="#' + TColorToHex(item.Font.Color) +
     '" fontFamily="' + xMLE(item.Font.Name) + '" fontSize="' + inttostr(item.Font.Size) + '"'+#13+#9+#9+
     'textPrompt="' + xMLE(item.TextPrompt) + '" transparent="' + LowerCase(booltostr(item.Transparent))+
     '" isPasswordEdit="' + LowerCase(booltostr(item.IsPasswordEdit)) + '" min="' + floattostr(item.Min) +
     '" max="' + floattostr(item.Max) + '" decimalPlaces="'+ inttostr(item.DecimalPlaces) + '" asNumber="'+
     floattostr(item.asNumber)+'" ';

     s := s + Fonts(item.Font);
     s := s + ' ' + Aligns(item);
     result := Replaces(s, '<edit ');
end;

function TfrmMain.MakeFlowLayout(item: TSDK3FlowLayout): String;
var
  s: String;
begin
     s := 'enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + xMLE(item.Hint) + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" '+#13+#9+#9 +
     'autoHeight="' + LowerCase(booltostr(item.AutoHeight)) + '" maxControlsPerLine="' +
     inttostr(item.MaxControlsPerLine) + '" maxColumns="' + inttostr(item.MaxColumns)+
     '" lineSpacing="' + floattostr(item.LineSpacing) + '" '+#13+#9+#9+'contentWidth="' +
     floattostr(item.ContentWidth) + '" contentHeight="' + floattostr(item.ContentHeight) +
     '" frameStyle="' + xMLE(item.FrameStyle) + '" frameRegion="' + xMLE(item.FrameRegion) +'"'+#13+#9+#9;

     s := s + ' ' + Aligns(item);
     result := Replaces(s, '<flowLayout ');
end;

function TfrmMain.MakeImage(item: TSDK3Image): String;
var
  s: String;
begin
     s := 'enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + xMLE(item.Hint) + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" '+#13+#9+#9 +
     ' center="' + LowerCase(booltostr(item.Center)) + '" editable="' +
     LowerCase(booltostr(item.Editable)) + '" field="' + xMLE(item.Field) + '" '+
     'naturalWidth="' + floattostr(item.NaturalWidth) + '" naturalHeight="' +
     floattostr(item.NaturalHeight) + '" optimize="' +
     LowerCase(booltostr(item.Optimize)) + '" showProgress="' +
     LowerCase(booltostr(item.ShowProgress)) + '" src="' + xMLE(item.Src) + '" '+#13+#9+#9 +
     'URLWhileLoading="' + xMLE(item.URLWhileLoading) + '" ';

     s := s + ' ' + AlignsNotWinControl(item.Align, item);
     result := Replaces(s, '<image ');
end;

function TfrmMain.MakeLayout(item: TSDK3Layout): String;
var
  s: String;
begin
     s := 'enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + xMLE(item.Hint) + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" '+#13+#9+#9 +
     'frameStyle="' + xMLE(item.FrameStyle) + '" frameRegion="' + xMLE(item.FrameRegion) +'" ';

     s := s  + Aligns(item);
     result := Replaces(s, '<layout ');
end;

function TfrmMain.MakeFlowPart(item: TSDK3FlowPart): String;
var
  s: String;
begin
     s := 'enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + xMLE(item.Hint) + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" '+#13+#9+#9 +
     'frameStyle="' + xMLE(item.FrameStyle) + '" frameRegion="' + xMLE(item.FrameRegion) +
     '" minWidth="' + floattostr(item.MinWidth) +'" maxWidth="' + floattostr(item.MaxWidth) +
     '" minScaledWidth="'+ floattostr(item.MinScaledWidth) + '" maxScaledWidth="' +
     floattostr(item.MaxScaledWidth) + '" avoidScale="' + LowerCase(booltostr(item.AvoidScale)) +
     '" ' + #13+#9+#9 + ' stepSizes="' + xMLE(item.StepSizes) + '" adjustHeightToLine="' +
     LowerCase(booltostr(item.adjustHeightToLine)) + '" ' ;

     s := s  + Aligns(item);
     result := Replaces(s, '<flowPart ');
end;

function TfrmMain.MakeImageCheckBox(item: TSDK3ImageCheckBox): String;
var
  s: String;
begin
     s := 'checked="' + LowerCase(booltostr(item.Checked)) +
     '" enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + xMLE(item.Hint) + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" field="' + xMLE(item.Field) + '" '+#13+#9+#9+
     ' checkedImage="' + xMLE(item.CheckedImage) + '" uncheckedImage="' + xMLE(item.UncheckedImage) +
     '" optimize="'+ LowerCase(booltostr(item.Optimize)) + '" autoChange="' +
     LowerCase(booltostr(item.AutoChange)) + '" ';

     s := s  + AlignsNotWinControl(item.Align, item);
     result := Replaces(s, '<imageCheckBox ');
end;

function TfrmMain.MakeLabel(item: TSDK3Label): String;
var
  s: String;
begin
     s := 'text="' + xMLE(item.Caption) + '" enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + xMLE(item.Hint) + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" field="' + xMLE(item.Field) + '" '+
     'fontColor="#' + TColorToHex(item.Font.Color) +
     '" fontFamily="' + xMLE(item.Font.Name) + '" fontSize="' + inttostr(item.Font.Size) +
     '" autoSize="' + LowerCase(booltostr(item.AutoSize)) + '" ';

     s := s + Fonts(item.Font);
     s := s + ' ' + AlignsNotWinControl(item.Align, item);
     result := Replaces(s, '<label ');
end;

function TfrmMain.MakeProgressBar(item: TSDK3ProgressBar): String;
var
  s: String;
begin
     s := 'enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + xMLE(item.Hint) + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" '+#13+#9+#9 +
     'position="' + floattostr(item.Position) + '" min="' + floattostr(item.Min) +
     '" max="' + floattostr(item.Max) + '" mouseGlow="' + LowerCase(booltostr(item.mouseGlow)) +
     '" color="#' + TColorToHex(item.Color) + '" field="' + xMLE(item.Field) + '" ';

     s := s  + Aligns(item);
     result := Replaces(s, '<progressBar ');
end;

function TfrmMain.MakeRadioButton(item: TSDK3RadioButton): String;
var
  s: String;
begin
     s := 'text="' + xMLE(item.Caption) + '" checked="' + LowerCase(booltostr(item.Checked)) +
     '" enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + xMLE(item.Hint) + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" field="' + xMLE(item.Field) + '"'+
     'fontColor="#' + TColorToHex(item.Font.Color) +
     '" fontFamily="' + xMLE(item.Font.Name) + '" fontSize="' + inttostr(item.Font.Size) + '" '+#13+#9+#9+
     ' groupName="' + xMLE(item.GroupName) + '" fieldValue="' + xMLE(item.FieldValue) +'" ';

     s := s + Fonts(item.Font);
     s := s + ' ' + Aligns(item);
     result := Replaces(s, '<radioButton ');
end;

function TfrmMain.MakeTabControl(item: TSDK3TabControl): String;
var
  s: String;
begin
     s := 'enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + xMLE(item.Hint) + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" '+
     'tabIndex="' + inttostr(item.TabIndex) + '" ';

     s := s  + Aligns(item);
     result := Replaces(s, '<tabControl ');
end;

function TfrmMain.MakeTab(item: TCustomPage): String;
var
  s: String;
begin
     s := 'enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + xMLE(item.Hint) + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" '+
     'title="' + xMLE(item.Name) + '" ';

     s := s  + Aligns(item);
     result := Replaces(s, '<tab ');
end;

function TfrmMain.MakeRichEdit(item: TSDK3RichEdit): String;
var
  s: String;
begin
     s := 'enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + xMLE(item.Hint) + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" '+
     'field="' + xMLE(item.Field) + '" readyOnly="'+LowerCase(booltostr(item.ReadyOnly)) +
     '" backgroundColor="#' + TColorToHex(item.BackgroundColor) +
     '" defaultFontColor="#' + TColorToHex(item.DefaultFontColor) +
     '" defaultFontSize="' + floattostr(item.DefaultFontSize) +
     '" showToolbar="' +LowerCase(booltostr(item.ShowToolbar)) +
     '" hideSelection="' + LowerCase(booltostr(item.HideSelection)) + '" '+#13+#9+#9;

     s := s  + Aligns(item);
     result := Replaces(s, '<richEdit ');
end;

function TfrmMain.MakeScrollBox(item: TSDK3ScrollBox): String;
var
  s: String;
begin
     s := 'enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + xMLE(item.Hint) + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" ';

     s := s  + Aligns(item);
     result := Replaces(s, '<scrollBox ');
end;

procedure TfrmMain.Finalizar(Sender: TObject);
var
  memo: TMemo;
  svdlg: TSaveDialog;
begin

     memo := TMemo.Create(self);
     memo.Visible := false;
     memo.Clear;
     svdlg := TSaveDialog.Create(self);
     svdlg.Filter := '.TXT|*.txt';
     svdlg.Title := 'Criar arquivo para SDK3';

     if chkTagForm.Checked then
     begin
       memo.Lines.Add('<?xml version="1.0" encoding="UTF-8"?>'+#13+#9);
       memo.Lines.Add('<form formType="'+cbbTemplate.Text+'" dataType="'+edtDataType.Text+'" ');
       memo.Lines.Add('title="'+edtTitle.Text+'" name="'+edtNome.Text+'" theme="'+cbbTheme.Text+'" ');
       memo.Text:= memo.Text + Aligns(frmMain) + '>' + #13;
     end;

     memo.Lines.Add(panXpan(frmMain));

     if chkTagForm.Checked then
     begin
       memo.Lines.Add(#13+'</form>');
     end;

     if svdlg.Execute then
     begin
          memo.Lines.SaveToFile(svdlg.FileName);
     end;
     memo.free;
     svdlg.Free;
     showmessage('Código gerado!');

end;

function TfrmMain.PanXpan(comp: TComponent): String;
var
  i: integer;
  s: string;
  memo: TMemo;
begin
     memo := TMemo.Create(self);
     memo.Visible := false;
     memo.Clear;

     for i := 1 to Self.ComponentCount -1 do
     begin
          if (Components[i].GetParentComponent = comp) then
          begin

            if (Self.Components[i].ClassName <> 'TSDK3Layout') and
             (Self.Components[i].ClassName <> 'TSDK3FlowLayout') and
             (Self.Components[i].ClassName <> 'TSDK3FlowPart')  and
             (Self.Components[i].ClassName <> 'TSDK3TabControl')  and
             (Self.Components[i].ClassName <> 'TCustomPage')  and
             (Self.Components[i].ClassName <> 'TSDK3ScrollBox')  then
            begin
                 memo.Text := geraTags(Components[i], memo);
            end
            else
            begin
              if (Self.Components[i].ClassName = 'TSDK3Layout') then
              begin
                     memo.Text := memo.Text + MakeLayout(Components[i] as TSDK3Layout) + #13;
                     memo.Text := memo.Text + panXpan(Components[i]) + #13;
                     memo.Text := memo.Text +  #13 +'</layout>' + #13;
              end
              else
              if (Self.Components[i].ClassName = 'TSDK3FlowLayout') then
              begin
                   memo.Text := MakeFlowLayout(Components[i] as TSDK3FlowLayout) + #13;
                   memo.Text := memo.Text + panXpan(Components[i]) + #13;
                   memo.Text := memo.Text +  #13 +'</flowLayout>' + #13;
              end
              else
              if (Self.Components[i].ClassName = 'TSDK3FlowPart') then
              begin
                   memo.Text := MakeFlowPart(Components[i] as TSDK3FlowPart) + #13;
                   memo.Text := memo.Text + panXpan(Components[i]) + #13;
                   memo.Text := memo.Text +  #13 +'</flowPart>' + #13;
              end
              else
              if (Self.Components[i].ClassName = 'TSDK3TabControl') then
              begin
                   memo.Text := MakeTabControl(Components[i] as TSDK3TabControl) + #13;
                   memo.Text := memo.Text + panXpan(Components[i]) + #13;
                   memo.Text := memo.Text +  #13 +'</tabControl>' + #13;
              end
              else
              if (Self.Components[i].ClassName = 'TCustomPage') then
              begin
                   memo.Text := MakeTab(Components[i] as TCustomPage) + #13;
                   memo.Text := memo.Text + panXpan(Components[i]) + #13;
                   memo.Text := memo.Text +  #13 +'</tab>' + #13;
              end
              else
              if (Self.Components[i].ClassName = 'TSDK3ScrollBox') then
              begin
                   memo.Text := MakeScrollBox(Components[i] as TSDK3ScrollBox) + #13;
                   memo.Text := memo.Text + panXpan(Components[i]) + #13;
                   memo.Text := memo.Text +  #13 +'</scrollBox>' + #13;
              end;
            end;
          end;
     end;

     s := memo.text;
     memo.free;
     result := s;
end;

function TfrmMain.geraTags(comp: TComponent; memo: TMemo): String;
begin
         if comp is TSDK3Button then
         begin
                memo.Lines.add(#9 + MakeButton((comp as TSDK3Button)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3ColorComboBox then
         begin
                memo.Lines.add(#9 + MakeColorComboBox((comp as TSDK3ColorComboBox)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3ComboBox then
         begin
                memo.Lines.add(#9 + MakeComboBox((comp as TSDK3ComboBox)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3CheckBox then
         begin
                memo.Lines.add(#9 + MakeCheckBox((comp as TSDK3CheckBox)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3Edit then
         begin
                memo.Lines.add(#9 + MakeEdit((comp as TSDK3Edit)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3FlowLayout then
         begin
                memo.Lines.add(#9 + MakeflowLayout((comp as TSDK3FlowLayout)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3Image then
         begin
                memo.Lines.add(#9 + MakeImage((comp as TSDK3Image)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3Layout then
         begin
                memo.Lines.add(#9 + MakeLayout((comp as TSDK3Layout)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3FlowPart then
         begin
                memo.Lines.add(#9 + MakeFlowPart((comp as TSDK3FlowPart)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3ImageCheckBox then
         begin
                memo.Lines.add(#9 + MakeImageCheckBox((comp as TSDK3ImageCheckBox)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3Label then
         begin
                memo.Lines.add(#9 + MakeLabel((comp as TSDK3Label)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3ProgressBar then
         begin
                memo.Lines.add(#9 + MakeProgressBar((comp as TSDK3ProgressBar)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3RadioButton then
         begin
                memo.Lines.add(#9 + MakeRadioButton((comp as TSDK3RadioButton)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3RichEdit then
         begin
                memo.Lines.add(#9 + MakeRichEdit((comp as TSDK3RichEdit)));
                memo.lines.add('');
         end;
         result := memo.text;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  menuBar: TMainMenu;
  item: TMenuItem;
begin
  menuBar := TmainMenu.Create(frmMain);
  item := TMenuItem.Create(menuBar);
  item.Caption :='GERAR FICHA!';
  item.OnClick := @Finalizar;
  menuBar.Items.Add(item);
end;

function TfrmMain.Fonts(item: TFont): String;
var
   f: string;
begin
     f := '';
       if item.Style <> [] then
     begin
          if fsBold in item.Style then
             f := f + 'bold ';
          if fsItalic in item.Style then
             f := f + 'italic ';
          if fsUnderline in item.Style then
             f := f + 'underline ';
          if fsStrikeout in item.Style then
             f := f + 'strikeout ';

          f := ' fontStyle="'+ f +'"';
     end;
       result := f;
end;

function TfrmMain.Aligns(item: TWinControl): String;
var
  f: String;
begin
       f := '';
     if item.Align <> alClient then
     begin
          if item.Align = alNone then
               if (item.GetParentComponent = frmMain) then
                  f := 'left="' + inttostr(item.Left) + '" top="' + inttostr(item.top - 26) +
               '" width="' + inttostr(item.Width) + '" height="' + inttostr(item.Height) + '"'
               else
                  f := 'left="' + inttostr(item.Left) + '" top="' + inttostr(item.top) +
               '" width="' + inttostr(item.Width) + '" height="' + inttostr(item.Height) + '"'
          else
          begin
            if item.Align = alTop then
               f := 'align="top" height="' + inttostr(item.Height) + '"'
            else
            if item.Align = alRight then
               f := 'align="right" width="' + inttostr(item.Width) + '"'
            else
            if item.Align = alBottom then
               f := 'align="bottom" height="' + inttostr(item.Height) + '"'
            else
            if item.Align = alLeft then
               f := 'align="left" width="' + inttostr(item.Width) + '"';
          end;
     end
     else
     begin
          f := 'align="client"';
     end;
     result := f;
end;

function TfrmMain.AlignsNotWinControl(itemA: TAlign; item: TControl): String;
var
  f: String;
begin
       f := '';
     if itemA <> alClient then
     begin
          if itemA = alNone then
               if (item.GetParentComponent = frmMain) then
                  f := 'left="' + inttostr(item.Left) + '" top="' + inttostr(item.top - 26) +
               '" width="' + inttostr(item.Width) + '" height="' + inttostr(item.Height) + '"'
               else
                  f := 'left="' + inttostr(item.Left) + '" top="' + inttostr(item.top) +
               '" width="' + inttostr(item.Width) + '" height="' + inttostr(item.Height) + '"'
          else
          begin
            if itemA = alTop then
               f := 'align="top" height="' + inttostr(item.Height) + '"'
            else
            if itemA = alRight then
               f := 'align="right" width="' + inttostr(item.Width) + '"'
            else
            if itemA = alBottom then
               f := 'align="bottom" height="' + inttostr(item.Height) + '"'
            else
            if itemA = alLeft then
               f := 'align="left" width="' + inttostr(item.Width) + '"';
          end;
     end
     else
     begin
          f := 'align="client"';
     end;
     result := f;
end;

function TfrmMain.Replaces(s: string; tags: String): String;
var
  tagF: String;
begin

     if (tags = '<layout ') or (tags = '<flowLayout ') or (tags = '<flowPart ') or
     (tags = '<tabControl ') or (tags = '<tab ') or (tags = '<scrollBox ') then
          tagF := '>'
     else
         tagF := '/>';

     s := stringReplace(s, 'enabled="0"', 'enabled="false"', [rfReplaceALL]);
     s := stringReplace(s, 'enabled="-1"', '', [rfReplaceALL]);
     s := stringReplace(s, 'visible="0"', 'visible="false"', [rfReplaceALL]);
     s := stringReplace(s, 'visible="-1"', '', [rfReplaceALL]);
     s := stringReplace(s, 'checked="0"', 'checked="false"', [rfReplaceALL]);
     s := stringReplace(s, 'checked="-1"', 'checked="true"', [rfReplaceALL]);
     s := stringReplace(s, 'isPasswordEdit="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'isPasswordEdit="-1"', 'isPasswordEdit="true"', [rfReplaceALL]);
     s := stringReplace(s, 'transparent="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'transparent="-1"', 'transparent="true"', [rfReplaceALL]);
     s := stringReplace(s, 'center="0"', 'center="false"', [rfReplaceALL]);
     s := stringReplace(s, 'center="-1"', '', [rfReplaceALL]);
     s := stringReplace(s, 'editable="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'editable="-1"', 'editable="true"', [rfReplaceALL]);
     s := stringReplace(s, 'optimize="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'optimize="-1"', 'optimize="true"', [rfReplaceALL]);
     s := stringReplace(s, 'showProgress="-1"', '', [rfReplaceALL]);
     s := stringReplace(s, 'showProgress="0"', 'showProgress="true"', [rfReplaceALL]);
     s := stringReplace(s, 'autoChange="-1"', 'autoChange="false"', [rfReplaceALL]);
     s := stringReplace(s, 'autoChange="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'autoSize="-1"', 'autoSize="true"', [rfReplaceALL]);
     s := stringReplace(s, 'autoSize="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'mouseGlow="-1"', 'mouseGlow="false"', [rfReplaceALL]);
     s := stringReplace(s, 'mouseGlow="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'readyOnly="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'readyOnly="-1"', 'readyOnly="true"', [rfReplaceALL]);
     s := stringReplace(s, 'showToolbar="0"', 'showToolbar="false"', [rfReplaceALL]);
     s := stringReplace(s, 'showToolbar="-1"', '', [rfReplaceALL]);
     s := stringReplace(s, 'hideSelection="0"', 'hideSelection="false"', [rfReplaceALL]);
     s := stringReplace(s, 'hideSelection="-1"', '', [rfReplaceALL]);

     s := stringReplace(s, 'hint=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'fontSize="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'fontColor="#000000"', '', [rfReplaceALL]);
     s := stringReplace(s, 'fontFamily="default"', '', [rfReplaceALL]);
     s := stringReplace(s, 'field=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'items=""', 'items="{}"', [rfReplaceALL]);
     s := stringReplace(s, 'values=""', 'values="{}"', [rfReplaceALL]);
     s := stringReplace(s, 'value=""', '', [rfReplaceALL]);
//     s := stringReplace(s, 'text=""', ' ', [rfReplaceALL]);
     s := stringReplace(s, 'textPrompt=""', '', [rfReplaceALL]);

     s := stringReplace(s, 'tabOrder="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'min="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'max="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'decimalPlaces="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'asNumber="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'autoHeight="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'maxControlsPerLine="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'maxColumns="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'lineSpacing="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'contentWidth="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'contentHeight="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'contentHeight="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'naturalWidth="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'naturalHeight="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'minWidth="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'maxWidth="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'minScaledWidth="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'maxScaledWidth="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'avoidScale="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'adjustHeightToLine="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'defaultFontSize="0"', '', [rfReplaceALL]);

     s := stringReplace(s, 'stepSizes=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'frameStyle=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'frameRegion=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'URLWhileLoading=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'uncheckedImage=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'checkedImage=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'fieldValue=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'groupName=""', '', [rfReplaceALL]);

     s := stringReplace(s, '   ', ' ', [rfReplaceALL]);
     s := stringReplace(s, '  ', ' ', [rfReplaceALL]);

     result:= tags+s+tagF;
end;

function TfrmMain.TColorToHex(Cor: TColor): string;
begin
  Result :=
    IntToHex( GetRValue( Cor ), 2 ) +
    IntToHex( GetGValue( Cor ), 2 ) +
    IntToHex( GetBValue( Cor ), 2 );
end;

procedure TfrmMain.chkTagFormChange(Sender: TObject);
begin
     if chkTagForm.Checked then
     begin
          cbbTemplate.Enabled:=true;
          cbbTheme.Enabled:=true;
          edtDataType.Enabled:=true;
          edtNome.Enabled:=true;
          edtTitle.Enabled:=true;
     end
     else
     begin
          cbbTemplate.Enabled:=false;
          cbbTheme.Enabled:=false;
          edtDataType.Enabled:=false;
          edtNome.Enabled:=false;
          edtTitle.Enabled:=false;
     end;
end;

function TfrmMain.xMLE(S: String): String;
begin

     s := stringReplace(s, '&', '&amp;', [rfReplaceALL]);
     s := stringReplace(s, '<', '&lt;', [rfReplaceALL]);
     s := stringReplace(s, '>', '&gt;', [rfReplaceALL]);
     s := stringReplace(s, '''', '&apos;', [rfReplaceALL]);
     s := stringReplace(s, '"', '&apos;&apos;', [rfReplaceALL]);

     result := s;
end;

procedure TfrmMain.cbbThemeChange(Sender: TObject);
begin
  if cbbTheme.ItemIndex <> 1 then
     frmMain.Color:=$004E4E4E
  else
     frmMain.Color:=clWhite;
end;

end.























