with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Exceptions;  use Ada.Exceptions;
with fahrenheit; use fahrenheit;
with celsius; use celsius;
with tempCritCheck; use tempCritCheck;
with exceptions; use exceptions;

procedure Main is



   type temp_data is record  --record
      TempC : Float;
      TempF : Float;
      Critical : Boolean;
   end record;



   num :Integer range 1 ..5;
   tempF,tempC: Float;


  procedure get_data(data:temp_data) is --subprogram
   begin
      Put(data.TempF, aft => 2, exp => 0); --aft (set decimal place)
      Put(" ");
      Put(data.TempC, aft => 2, exp => 0);
      Put(" ");
      Put_Line( Boolean'Image (data.Critical));


   end get_data;

   procedure menu is --subprogram

   Index: Integer :=0;
   critical: Boolean := FALSE;
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

            tempF := Convert_to_F(tempC);

            records.TempC := tempC;
            records.TempF := tempF;
            critical := checkC(tempC);
            records.Critical := critical;
            get_data(records);
            Index:= Index + 1;
            stuff(Index) := records;
            Put_Line(" ");
          when 3 =>
               Put_Line(" ");
               for I in 1..Index loop --for loop

                  get_data(stuff (I));
               end loop;
               Put_Line(" ");
            when others =>


            Exit;
         end case;
         end loop;
   end menu;


   begin
   menu;
   exception --exception
       when Constraint_Error => Put_Line("Out of range, Enter an option from the menu");
       when Data_Error => Put_Line("Please enter a number");
   end Main;
