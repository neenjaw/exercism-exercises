//
// This is only a SKELETON file for the 'Resistor Color Duo' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const COLORS = ["black","brown","red","orange","yellow","green","blue","violet","grey","white"];

export const value = ([color1, color2]) => {
  const color1Value = COLORS.indexOf(color1);
  const color2Value = COLORS.indexOf(color2);

  return (color1Value * 10) + color2Value;
};
