export const COLORS = ["black","brown","red","orange","yellow","green","blue","violet","grey","white"];

export const value = ([...colors]) => {
  return colors
          .reverse()
          .map(color => COLORS.indexOf(color))
          .reduce((sum, value, index) => {
            return sum + (value * (10**index)); 
          });
};
