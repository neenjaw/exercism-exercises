export const COLORS = ["black","brown","red","orange","yellow","green","blue","violet","grey","white"];

export const colorCode = (color) => {
  function isMatchingColor(listColor) {
    return color == listColor
  } 

  return COLORS.findIndex(isMatchingColor);
};
