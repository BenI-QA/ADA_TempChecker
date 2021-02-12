package celsius is
   type C is new Float range -100.0 .. 100.0;
   function Convert_to_F(temp:Float) return Float;
end celsius;
