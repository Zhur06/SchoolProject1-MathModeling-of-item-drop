uses GraphABC;

var
  inp: Text;

//-----------------------------------------------------------------------------------------------------------------------------

procedure Drop_lvl_1_Graph(par: integer);
var
  h, g, t: integer;
  A: Array of Array [1..2] of integer;                                                                                                     //ячейка 1 - скорость, 2 - пройденное расстояние
begin
  ClearWindow;
  
  if EOF(inp) then
    begin
      ClearWindow;
      DrawTextCentered((WindowWidth div 2) - 120, (WindowHeight div 2) - 20, (WindowWidth div 2) + 120, (WindowHeight div 2) + 20, 'Введено недостаточное кол-во параметров в документе');
      Sleep(1000);
      Exit;
    end;
  
  ReadLn(inp, h);
  DrawTextCentered(WindowWidth div 2, 16, WindowWidth div 2, 26, 'Введенная высота:' + h);
  
  if par = 2 then
  begin
    if EOF(inp) then
    begin
      ClearWindow;
      DrawTextCentered((WindowWidth div 2) - 180, (WindowHeight div 2) - 20, (WindowWidth div 2) + 180, (WindowHeight div 2) + 20, 'Введено недостаточное кол-во параметров в документе');
      Sleep(1000);
      Exit;
    end;
    ReadLn(inp, g);
    DrawTextCentered(WindowWidth div 2, 36, WindowWidth div 2, 46, 'Введенное g:' + g);
  end
  else g := 10;
  
  SetLength(A, 1);
  t := 0;
  A[t][2] := 0;
  while A[t][2] <= h do
  begin
    t := t + 1;
    
    //DrawTextCentered(WindowWidth div 2, 16, WindowWidth div 2, 26 , 'fwbhcglgcgjvgiybxcvhytrfdcv nmkiuytueyfiw:' + h);
    
    SetLength(A, length(A) + 1);
    A[t][1] := t * g;
    A[t][2] := A[t - 1][2] + A[t][1]
  end;
  
  //SetLength(A, length(a) - 2);
  
  for var counter := 0 to WindowWidth - 10 do
  begin
    Line(5 + counter, windowHeight - (A[counter div ((WindowWidth - 10) div t) + 1][1] * ((WindowHeight - 31) div A[t][1]) + 5), 5 + counter,  WindowHeight - 31);
    if ((counter + 1) div ((WindowWidth - 10) div t) + 1) > t then Break;
  end;
  
  //ClearWindow;
end;

//-----------------------------------------------------------------------------------------------------------------------------

procedure Drop_lvl_1_Clc_Graph(x1, y1, mb: integer);
begin
  if mb = 1 then
    {if (x >= (WindowWidth div 2) - 120) and (y1 >= (WindowHeight div 2) - 20) and (x1 <= (WindowWidth div 2) + 120) and (y1 <= (WindowHeight div 2) + 20) then
      if (x >= 5) and (x <= 140) and (y >= 70) and (y <= 90) then
       Drop_lvl_1_Graph(1)
      else if (x >= 5) and (x <= 350) and (y >= 100) and (y <= 120) then}
        Drop_lvl_1_Graph(2);
      
end;

//-----------------------------------------------------------------------------------------------------------------------------

procedure Drop_lvl_1_MainPage(x, y, mb: integer);
var
  object_height: integer;
begin
  if mb = 1 then
  begin
    if (x >= 5) and (x <= 140) and (y >= 70) and (y <= 90) then
    begin
      ClearWindow;
      
      DrawRectangle((WindowWidth div 2) - 180, 5, (WindowWidth div 2) + 180, 25);                   //Заголовок окна
      DrawTextCentered(WindowWidth div 2, 6, WindowWidth div 2, 24, 'Простейшая модель падения тела с высоты h');
      
      object_height := (WindowHeight - 35) div 10;
      
      Brush.Color := clRed;
      Rectangle(5, 40, 5 + object_height, 40 + object_height);
      Brush.Color := clWhite;
      
      Line(5 + (object_height div 2), 45 + object_height, 5 + (object_height div 2), WindowHeight - 10);
      Line(object_height div 2, WindowHeight - 15, (object_height div 2) + 5, WindowHeight - 10);
      Line((object_height div 2) + 10, WindowHeight - 15, (object_height div 2) + 5, WindowHeight - 10);
      
      TextOut((object_height div 2) + 10, WindowHeight - 10 - ((WindowHeight - 45 - object_height) div 2), 'h');
      
      DrawRectangle((WindowWidth div 2) - 120, (WindowHeight div 2) - 20, (WindowWidth div 2) + 120, (WindowHeight div 2) + 20);
      DrawTextCentered((WindowWidth div 2) - 120, (WindowHeight div 2) - 20, (WindowWidth div 2) + 120, (WindowHeight div 2) + 20, 'Нажмите сюда для отрисовки графика скорости тела от времени');
      
      OnMouseDown := Drop_lvl_1_Clc_Graph;
    end
    else
      if (x >= 5) and (x <= 350) and (y >= 100) and (y <= 120) then
      begin
        ClearWindow;
      
      DrawRectangle((WindowWidth div 2) - 220, 5, (WindowWidth div 2) + 220, 25);                   //Заголовок окна
      DrawTextCentered(WindowWidth div 2, 6, WindowWidth div 2, 24, 'Модель падения тела с высоты h и пользовательским ускорением g');
      
      object_height := (WindowHeight - 35) div 10;
      
      Brush.Color := clRed;
      Rectangle(5, 40, 5 + object_height, 40 + object_height);
      Brush.Color := clWhite;
      
      Line(5 + (object_height div 2), 45 + object_height, 5 + (object_height div 2), WindowHeight - 10);
      Line(object_height div 2, WindowHeight - 15, (object_height div 2) + 5, WindowHeight - 10);
      Line((object_height div 2) + 10, WindowHeight - 15, (object_height div 2) + 5, WindowHeight - 10);
      
      TextOut((object_height div 2) + 10, WindowHeight - 10 - ((WindowHeight - 45 - object_height) div 2), 'h     g');
      
      DrawRectangle((WindowWidth div 2) - 120, (WindowHeight div 2) - 20, (WindowWidth div 2) + 120, (WindowHeight div 2) + 20);
      DrawTextCentered((WindowWidth div 2) - 120, (WindowHeight div 2) - 20, (WindowWidth div 2) + 120, (WindowHeight div 2) + 20, 'Нажмите сюда для отрисовки графика скорости тела от времени');
      
      OnMouseDown := Drop_lvl_1_Clc_Graph;
      end;
  end
  else EXIT;
  
end;

//-----------------------------------------------------------------------------------------------------------------------------



//----------Отрисовка основного меню---------------------------------------------------------------------------

procedure MainPicture();
begin
  DrawRectangle((WindowWidth div 2) - 220, 5, (WindowWidth div 2) + 220, 35);                   //Заголовок окна
  DrawTextCentered(WindowWidth div 2, 6, WindowWidth div 2, 34, 'Матмоделирование падения тела с разной глубиной погружения');
  
  DrawTextCentered(WindowWidth div 2, 40, WindowWidth div 2, 60, 'Нажмите ЛКМ для выбора модели или ПКМ для выхода из программы');
  
  TextOut(10, 70, 'Модель только от h');                                                                                          //Кнопки разных графиков
  DrawRectangle(5, 70, 140, 90);
  
  TextOut(10, 100, 'Модель с указанной высотой h и пользовательским g');
  DrawRectangle(5, 100, 350, 120);
  
  OnMouseDown := Drop_lvl_1_MainPage;
end;

//-----------------------------------------------------------------------------------------------------------------------------

begin
  Assign(inp, 'input.txt');
  Reset(inp);
  MainPicture();
end.