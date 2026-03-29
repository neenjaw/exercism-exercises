export const COLORS = ["black","brown","red","orange","yellow","green","blue","violet","grey","white"];

export const value = ([...colors]) => {
  colors = colors.map(color => COLORS.indexOf(color));

  return (colors[0] * 10) + colors[1];
};
