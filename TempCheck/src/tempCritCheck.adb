package body tempCritCheck is

   function CheckC(tempC:Float) return Boolean is
      begin
      if (-20.0 <= tempC) or (tempC >= 100.0) then
               return True;
            else
               return False;
      end if;
   end CheckC;
end tempCritCheck;


