package body celsius is
   function Convert_to_F(temp: Float) return Float is
     begin
      return 32.0 + (temp * 1.8);

   end Convert_to_F;
end celsius;
