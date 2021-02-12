package body fahrenheit is
   function Convert_to_C(temp: Float) return Float is
     begin
      return (temp - 32.0) / 1.8;
   end Convert_to_C;
end fahrenheit;
