with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Exceptions;  use Ada.Exceptions;
with fahrenheit; use fahrenheit;
with celsius; use celsius;
with exceptions; use exceptions;

procedure Main is



   type temp_data is record  --record
      TempC : Float;
      TempF : Float;
      Critical : Boolean;
   end record;



   num :Integer range 1 ..5;
   tempF,tempC: Float;
   critical: Boolean;

  procedure get_data(data:temp_data) is --subprogram
   begin
      Put(data.TempF, aft => 2, exp => 0);
      Put(" ");
      Put(data.TempC, aft => 2, exp => 0);
      Put(" ");
      Put_Line( Boolean'Image (data.Critical));


   end get_data;

   procedure menu is --subprogram

   Index: Integer :=0;

   type record_Array is array (0 .. 50) of temp_data;  --array
   stuff : record_Array;

   records: temp_data :=(tempF,tempC,critical); --record type
   begin
   loop  --loop
      Put_Line("Select Temperature type to Convert");
      Put_Line(" 1) Fahrenheit ");
      Put_Line(" 2) Celsius ");
      Put_Line(" 3) View All Records ");
      Put_Line(" 4) Exit ");
      Get(num);
      Put(num);


      case num is     --switch case
         when 1 =>
            Put_Line(" Convert to Fahrenheit ");
            Put_Line(" Input Temperature F: ");

            Get(tempF);


            if (0.0<= tempF) or (tempF >= 15.0) then
               critical := True;
            else
               critical := False;
            end if;

            tempC := Convert_to_C(tempF);
            records.TempF := tempF;
            records.TempC := tempC;
            records.Critical := critical;
            get_data(records);

            Index:= Index + 1;
            stuff(Index) := records;
            Put_Line(" ");

         when 2 =>
            Put_Line("Covert to Celsius ");
            Put_Line(" Input Temperature C: ");
            Get(tempC);


            if (-20.0 <= tempC) or (tempC >= 15.0) then
               critical := True;
            else
               critical := False;
            end if;

            tempF := Convert_to_F(tempC);
            records.TempC := tempC;
            records.TempF := tempF;
            records.Critical := critical;
            get_data(records);
            Index:= Index + 1;
            stuff(Index) := records;
            Put_Line(" ");
          when 3 =>

               for I in 1..Index loop --for loop
                  Put_Line(" ");
                  get_data(stuff (I));
               end loop;
           .
            when others =>


            Exit;
         end case;
         end loop;
   end menu;


   begin
   menu;
   exception --exception
       when Constraint_Error => Put_Line("Out of range, Enter a select an option from the menu");

   end Main;
